
/*

    This service is responsible for sending/transferring message to/from clients

    // transferring messages == receicing messages from ble client, parsing them to the application via a queue.
    // sending messages == getting messages from a queue and then sending them to clients.

*/

// first lets worry about transferring bytes from a client
// we can look at copy how it is done by the ota update system

#include "messaging_gatt_service.h"

#include "gatt.h"
#include "freertos/FreeRTOS.h"
#include "esp_ota_ops.h"
#include "host/ble_hs.h"
#include "services/gap/ble_svc_gap.h"
#include "services/gatt/ble_svc_gatt.h"
#include "esp_system.h"
#include "ota_gatt_service.h"

void process_message_write(uint16_t conn_handle);
void process_message_data(uint16_t conn_handle);

#define MESSAGE_CONTROL_WRITE_REQUEST 1
#define MESSAGE_CONTROL_READ_REQUEST 2
#define MESSAGE_CONTROL_ACK 3
#define MESSAGE_CONTROL_NACK 4
#define MESSAGE_CONTROL_DONE 5

// handles
uint16_t messaging_control_val_handle;
uint16_t messaging_data_val_handle;

uint8_t message_control_val;   // used to control message batches
uint8_t message_data_val[512]; // used for message data

#define MESSAGING_BLE_TAG "MESSAGING BLE"

#define READING 0
#define WRITING 1
#define NONE 2

uint8_t transfer_mode = NONE;

typedef struct
{
    uint16_t pkgs_received;
    uint16_t packet_size;
} messaging_context;

messaging_context bluetooth_messaging_context = {
    .pkgs_received = 0,
    .packet_size = 0,
};

int gatt_svr_chr_messaging_data_cb(uint16_t conn_handle, uint16_t attr_handle, struct ble_gatt_access_ctxt *ctxt, void *arg)
{
    static int rc;
    static esp_err_t err;

    // store the received data into gatt_svr_chr_message_data_val
    rc = gatt_svr_chr_write(ctxt->om, 1, sizeof(message_data_val),
                            message_data_val, NULL);

    // write the received packet to the partition
    if (transfer_mode == WRITING)
    {
        ESP_LOGI(MESSAGING_BLE_TAG, "message data: transferring data");

        // write the data to the message queue thing

        bluetooth_messaging_context.pkgs_received++;
        ESP_LOGI(MESSAGING_BLE_TAG, "Received packet %d", bluetooth_messaging_context.pkgs_received);
    }

    return rc;
}

int gatt_svr_chr_messaging_control_cb(uint16_t conn_handle, uint16_t attr_handle,
                                      struct ble_gatt_access_ctxt *ctxt,
                                      void *arg)
{
    static int rc;
    static int8_t length = sizeof(messaging_data_val_handle);

    // Here is where we set the control value based on the request from the client, so we should do something similar!
    switch (ctxt->op)
    {
    case BLE_GATT_ACCESS_OP_READ_CHR:
        // a client is reading the current value of ota control
        // what happens when there is not enough memory/packets 
        rc = os_mbuf_append(ctxt->om, &message_control_val, length);
        return rc == 0 ? 0 : BLE_ATT_ERR_INSUFFICIENT_RES;
        
        // we need to send a notification here to tell the client that the reads are done
        // if reading complete send notification saying reading is complete

        // if reading is not complete send notificaition saying that reading is not complete
        
        break;

    case BLE_GATT_ACCESS_OP_WRITE_CHR:
        // client writes to gatt_svr_chr_ota_control_val (which is our state)
        rc = gatt_svr_chr_write(ctxt->om, 1, length,
                                &message_control_val, NULL);
        process_message_write(conn_handle);
        return rc;
        break;

    default:
        break;
    }

    // this shouldn't happen
    assert(0);
    return BLE_ATT_ERR_UNLIKELY;
}

// message_control_val .
void process_message_write(uint16_t conn_handle)
{
    static struct os_mbuf *om;
    static esp_err_t err;

    switch (message_control_val)
    {
    case MESSAGE_CONTROL_WRITE_REQUEST:
        // TODO - remove last message data if not marked as done

        // create a new message
        ESP_LOGI(MESSAGING_BLE_TAG, "message control: request");
        message_control_val = MESSAGE_CONTROL_ACK;
        transfer_mode = WRITING;

        // retrieve the packet size from OTA data
        bluetooth_messaging_context.packet_size =
            (message_data_val[1] << 8) + message_data_val[0];
        ESP_LOGI(MESSAGING_BLE_TAG, "Packet size is: %d", bluetooth_messaging_context.packet_size);

        bluetooth_messaging_context.pkgs_received = 0;

        // notify the client via BLE that the OTA has been acknowledged
        om = ble_hs_mbuf_from_flat(&message_control_val,
                                   sizeof(message_control_val));
        ble_gattc_notify_custom(conn_handle, messaging_control_val_handle, om);
        ESP_LOGI(MESSAGING_BLE_TAG, "OTA request acknowledgement has been sent.");

        break;
    case MESSAGE_CONTROL_DONE:
        // we have processed all of the bytes and are happy
        // mark message as done
        transfer_mode = NONE;
        ESP_LOGI(MESSAGING_BLE_TAG, "message control: completed");

        // set messaging to set proccessed message as okay
        om = ble_hs_mbuf_from_flat(&message_control_val,
                                   sizeof(message_control_val));
        ble_gattc_notify_custom(conn_handle, messaging_control_val_handle, om);
        ESP_LOGI(MESSAGING_BLE_TAG, "OTA request acknowledgement has been sent.");
        break;
    default:
        break;
    }
}

// process_message_data
void process_message_data(uint16_t conn_handle)
{
}