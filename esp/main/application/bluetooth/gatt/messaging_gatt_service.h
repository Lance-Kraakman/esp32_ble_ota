#pragma once

#include "esp_system.h"

#ifndef MESSAGING_GATT_SERVICE_H_
#ifdef __cplusplus
extern "C"
{
#endif
    int gatt_svr_chr_messaging_input_stream_cb(uint16_t conn_handle, uint16_t attr_handle,
                                       struct ble_gatt_access_ctxt *ctxt,
                                       void *arg);

    int gatt_svr_chr_messaging_output_stream_cb(uint16_t conn_handle, uint16_t attr_handle, struct ble_gatt_access_ctxt *ctxt, void *arg);

    void _notify_message_ready();


#ifdef __cplusplus
}
#endif

#endif // !MESSAGING_GATT_SERVICE_H_
