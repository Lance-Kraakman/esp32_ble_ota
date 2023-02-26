#include "nvs_flash.h"
#include "application/ota/ota.h"
#include "freertos/FreeRTOS.h"
#include "esp_system.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_log.h"
#include "esp_bt.h"
#include "esp_err.h"
#include "esp_pm.h"

#include "application/ota/ota.h"
#include "valiturus_battery.h"

// bluetooth part of the application
#include "application/bluetooth/bluetooth.h"
#include "application/proto/c_proto/Algorithim.pb.h"

#define LOG_TAG_MAIN "main"

void app_main(void)
{

  ota_app_init();

  // enable light sleep
  esp_pm_config_esp32c3_t pm_config = {
      .max_freq_mhz = CONFIG_ESP_DEFAULT_CPU_FREQ_MHZ, // e.g. 80, 160, 240
      .min_freq_mhz = CONFIG_ESP_DEFAULT_CPU_FREQ_MHZ, // e.g. 40
      .light_sleep_enable = true,                      // enable light sleep
  };
  ESP_ERROR_CHECK(esp_pm_configure(&pm_config));

  // Initialize NVS
  esp_err_t ret = nvs_flash_init();
  if (ret == ESP_ERR_NVS_NO_FREE_PAGES ||
      ret == ESP_ERR_NVS_NEW_VERSION_FOUND)
  {
    ESP_ERROR_CHECK(nvs_flash_erase());
    ret = nvs_flash_init();
  }
  ESP_ERROR_CHECK(ret);

  bluetooth_init();
  /*
    TODO -

  */

  // valiturus_battery_init();

  // // !!!!!!!!!!!!!!!!!!!!
  // // TODO
  // // run diagnostics and rollback if image fails to update
  // // rollback_image();

  // vTaskDelay(100 / portTICK_PERIOD_MS);
  // verify_image();

  // while (1)
  // {
  //   valiturus_battery_measure();
  //   // print out every 5 minutes
  //   vTaskDelay(pdMS_TO_TICKS(60000));
  //   vTaskDelay(pdMS_TO_TICKS(60000));
  //   vTaskDelay(pdMS_TO_TICKS(60000));
  //   vTaskDelay(pdMS_TO_TICKS(60000));
  //   vTaskDelay(pdMS_TO_TICKS(60000));
  // }

  // valiturus_battery_deinit();
}
