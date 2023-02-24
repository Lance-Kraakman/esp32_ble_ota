
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

// handles
uint16_t messaging_output_handle;
uint16_t messaging_input_handle;

uint8_t message_control_val;   // used to control message batches

// buffer used for incomming packets
uint8_t input_message_data[512]; 

// buffer used for outgoing packets
uint8_t output_packet_buffer[512];

#define MESSAGING_BLE_TAG "MESSAGING BLE"

// callback for client message reads
int gatt_svr_chr_messaging_output_stream_cb(uint16_t conn_handle, uint16_t attr_handle, struct ble_gatt_access_ctxt *ctxt, void *arg)
{
    static int rc;
    static esp_err_t err;    

    switch (ctxt->op) {
        case BLE_GATT_ACCESS_OP_READ_CHR:            
            /*
            
             here we want to put some data onto the queue.
             we put as much data as we need onto os_mbuf_append 
                    
            */

            // TODO - 
            // read from queue through some callback    

            // COPY data so data can be discarded wherever it came from 
            rc = os_mbuf_copyinto(ctxt->om, 0, "here is a popped message from the queue", sizeof("here is some strings"));
            return rc == 0 ? 0 : BLE_ATT_ERR_INSUFFICIENT_RES;    
            
            break;
    }
    
    return rc;
}


// callback for client message writes
int gatt_svr_chr_messaging_input_stream_cb(uint16_t conn_handle, uint16_t attr_handle, struct ble_gatt_access_ctxt *ctxt, void *arg)
{
    static int rc;
    static esp_err_t err;

    switch (ctxt->op) {
        case BLE_GATT_ACCESS_OP_WRITE_CHR:
            // store the received data into input_packet_buffer
            rc = gatt_svr_chr_write(ctxt->om, 1, sizeof(input_message_data),
                                    input_message_data, NULL);

        /*
            Here is where we put the received data onto some protobuf queue
        */
        // add message to queue somewhere 
    }
    return rc;
}

/*

    . Maybe a data read callback could go here which will let the
    user know that the read has been completed


*/

// notify client input_message_data is legit
void _notify_message_ready() {
    ble_gatts_chr_updated(messaging_output_handle); 
}