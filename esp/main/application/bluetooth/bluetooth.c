#include "esp_log.h"
#include "gatt/gap.h"
#include "gatt/gatt.h"
#include "esp_bt.h"

#include "host/ble_hs.h"
#include "services/gap/ble_svc_gap.h"
#include "services/gatt/ble_svc_gatt.h"
#include "nimble/nimble_port.h"
#include "nimble/nimble_port_freertos.h"

#include "bluetooth.h"
#include "gatt/messaging_gatt_service.h"

#include "gatt/gatt.h"

/*
  This file is for PUBLIC methods/interfacing the bluetooth application folder with the application.
  Functions that 
*/



/*
  A GATT service is a collection of charactarstics.
  For example: a heart rate service contains a heart rate measurement charactaristic and a a body location charactaristic.

  What does GATT do?
    - defines the format of services and ther characteristics.
    - defines the procedures that are used to interface with theese atributes such as service discovery,
      characteristic reads, characteristic writes, notifications and indications.

*/
#define BLE_OTA_EXAMPLE_TAG "BLE_OTA_EXAMPLE"
/*

  NOTES:

    Increasing tx power to 21dBm causes the device to brownout. This is because it uses much more instaneous power and my
    hardware is not good enough for that. :(

*/

// need to consider how memory will be effected on both sides....

// this is fine
typedef struct {
  char *buffer;
  int bufferLength;
  // bool lock; maybe in the future add a data lock
  // anybody using this data must use it straight away, which is really dangerous 
} messageData;

// message received callback is called when a message has been received 
void bluetooth_init(void (*bytesReceivedCallback)(messageData receivingData), void (*sendBytesCallback)(messageData sendingData))
{

  // BLE Setup
  esp_bt_mem_release(ESP_BT_MODE_BTDM);

  // initialize BLE controller and nimble stack
  nimble_port_init();

  // register sync and reset callbacks
  ble_hs_cfg.sync_cb = sync_cb;
  ble_hs_cfg.reset_cb = reset_cb;

  // initialize service table
  gatt_svr_init();

  // set device name and start host task
  ble_svc_gap_device_name_set(device_name);
  nimble_port_freertos_init(host_task);
}

// notify_message_ready notifies the client that there is a message ready
void notify_message_ready() {
  _notify_message_ready();
}
