#include "esp_log.h"
#include "esp_ota_ops.h"
#include "gap.h"
#include "gatt_svr.h"
#include "nvs_flash.h"
#include "esp_bt.h"
#include "driver/gpio.h"
#include "bmi160.h"
#include "bmi160Impl.h"
#include "lsm303agr_reg.h"
#include "lsm303agrImpl.h"

#include "valiturus_button.h"
#include "valiturus_led.h"

#define LOG_TAG_MAIN "main"

#define TX_BUF_DIM 1000

static uint8_t tx_buffer[TX_BUF_DIM];

/*
  Sensor test init
*/
static int16_t data_raw_acceleration[3];
static int16_t data_raw_temperature;
static float acceleration_mg[3];
static float magnetic_mG[3];
static float temperature_degC;
static int16_t data_raw_magnetic[3];

static uint8_t whoamI, rst;

void lsm303agr_read_data_polling(void)
{
  /* Initialize mems driver interface */
  stmdev_ctx_t dev_ctx_xl;
  dev_ctx_xl.write_reg = platform_write_accell;
  dev_ctx_xl.read_reg = platform_read_accell;
  stmdev_ctx_t dev_ctx_mg;
  dev_ctx_mg.write_reg = platform_write_mag;
  dev_ctx_mg.read_reg = platform_read_mag;
  /* Wait boot time and initialize platform specific hardware */
  platform_init();
  /* Wait sensor boot time */
  platform_delay(portTICK_PERIOD_MS * 30);
  /* Check device ID */
  whoamI = 0;
  lsm303agr_xl_device_id_get(&dev_ctx_xl, &whoamI);

  if (whoamI != LSM303AGR_ID_XL)
    while (1)
    {
      ESP_LOGI(LOG_TAG_MAIN, "init fail");
      vTaskDelay(portTICK_PERIOD_MS * 50);
      /*manage here device not found */
    }

  whoamI = 0;
  lsm303agr_mag_device_id_get(&dev_ctx_mg, &whoamI);

  if (whoamI != LSM303AGR_ID_MG)
    while (1)
      ; /*manage here device not found */

  /* Restore default configuration for magnetometer */
  lsm303agr_mag_reset_set(&dev_ctx_mg, PROPERTY_ENABLE);

  do
  {
    lsm303agr_mag_reset_get(&dev_ctx_mg, &rst);
  } while (rst);

  /* Enable Block Data Update */
  lsm303agr_xl_block_data_update_set(&dev_ctx_xl, PROPERTY_ENABLE);
  lsm303agr_mag_block_data_update_set(&dev_ctx_mg, PROPERTY_ENABLE);
  /* Set Output Data Rate */
  lsm303agr_xl_data_rate_set(&dev_ctx_xl, LSM303AGR_XL_ODR_1Hz);
  lsm303agr_mag_data_rate_set(&dev_ctx_mg, LSM303AGR_MG_ODR_10Hz);
  /* Set accelerometer full scale */
  lsm303agr_xl_full_scale_set(&dev_ctx_xl, LSM303AGR_2g);
  /* Set / Reset magnetic sensor mode */
  lsm303agr_mag_set_rst_mode_set(&dev_ctx_mg,
                                 LSM303AGR_SENS_OFF_CANC_EVERY_ODR);
  /* Enable temperature compensation on mag sensor */
  lsm303agr_mag_offset_temp_comp_set(&dev_ctx_mg, PROPERTY_ENABLE);
  /* Enable temperature sensor */
  lsm303agr_temperature_meas_set(&dev_ctx_xl, LSM303AGR_TEMP_ENABLE);
  /* Set device in continuous mode */
  lsm303agr_xl_operating_mode_set(&dev_ctx_xl, LSM303AGR_HR_12bit);
  /* Set magnetometer in continuous mode */
  lsm303agr_mag_operating_mode_set(&dev_ctx_mg,
                                   LSM303AGR_CONTINUOUS_MODE);

  /* Read samples in polling mode (no int) */
  while (1)
  {
    /* Read output only if new value is available */
    lsm303agr_reg_t reg;
    lsm303agr_xl_status_get(&dev_ctx_xl, &reg.status_reg_a);

    if (reg.status_reg_a.zyxda)
    {
      /* Read accelerometer data */
      memset(data_raw_acceleration, 0x00, 3 * sizeof(int16_t));
      lsm303agr_acceleration_raw_get(&dev_ctx_xl,
                                     data_raw_acceleration);
      acceleration_mg[0] = lsm303agr_from_fs_2g_hr_to_mg(
          data_raw_acceleration[0]);
      acceleration_mg[1] = lsm303agr_from_fs_2g_hr_to_mg(
          data_raw_acceleration[1]);
      acceleration_mg[2] = lsm303agr_from_fs_2g_hr_to_mg(
          data_raw_acceleration[2]);
      ESP_LOGI(LOG_TAG_MAIN,
               "Acceleration [mg]:%4.2f\t%4.2f\t%4.2f\r\n",
               acceleration_mg[0], acceleration_mg[1], acceleration_mg[2]);
    }

    lsm303agr_mag_status_get(&dev_ctx_mg, &reg.status_reg_m);

    if (reg.status_reg_m.zyxda)
    {
      /* Read magnetic field data */
      memset(data_raw_magnetic, 0x00, 3 * sizeof(int16_t));
      lsm303agr_magnetic_raw_get(&dev_ctx_mg, data_raw_magnetic);
      magnetic_mG[0] = lsm303agr_from_lsb_to_mgauss(
          data_raw_magnetic[0]);
      magnetic_mG[1] = lsm303agr_from_lsb_to_mgauss(
          data_raw_magnetic[1]);
      magnetic_mG[2] = lsm303agr_from_lsb_to_mgauss(
          data_raw_magnetic[2]);
      ESP_LOGI(LOG_TAG_MAIN,
               "Magnetic field [mG]:%4.2f\t%4.2f\t%4.2f\r\n",
               magnetic_mG[0], magnetic_mG[1], magnetic_mG[2]);
    }

    lsm303agr_temp_data_ready_get(&dev_ctx_xl, &reg.byte);

    if (reg.byte)
    {
      /* Read temperature data */
      memset(&data_raw_temperature, 0x00, sizeof(int16_t));
      lsm303agr_temperature_raw_get(&dev_ctx_xl,
                                    &data_raw_temperature);
      temperature_degC = lsm303agr_from_lsb_hr_to_celsius(
          data_raw_temperature);
      ESP_LOGI(LOG_TAG_MAIN, "Temperature [degC]:%6.2f\r\n",
               temperature_degC);
    }
    vTaskDelay(portTICK_RATE_MS * 10);
  }
}

/*
  Custom component includes
*/
void app_main(void)
{
  lsm303agr_read_data_polling();
}

/*

  bluetooth test init

*/
int tickCount = 0;

/*
  button interrupt handler
*/
static void IRAM_ATTR button_interrupt_handler(void *args)
{
  tickCount++;
}

bool run_diagnostics()
{
  // do some diagnostics
  return true;
}

// LED_Control_Task
void LED_Control_Task(void *params)
{
  bool level = false;

  while (1)
  {
    vTaskDelay(portTICK_PERIOD_MS * 1);
    ESP_LOGI(LOG_TAG_MAIN, "New app with blink");
    ESP_LOGI(LOG_TAG_MAIN, "tick count %d", tickCount);

    level = !level;
    valiturus_led_set_level(level);
  }
}

/*

  bluetooth main

*/
void bluetooth_main()
{
  // check which partition is running
  const esp_partition_t *partition = esp_ota_get_running_partition();

  switch (partition->address)
  {
  case 0x00010000:
    ESP_LOGI(LOG_TAG_MAIN, "Running partition: factory");
    break;
  case 0x00110000:
    ESP_LOGI(LOG_TAG_MAIN, "Running partition: ota_0");
    break;
  case 0x00210000:
    ESP_LOGI(LOG_TAG_MAIN, "Running partition: ota_1");
    break;

  default:
    ESP_LOGE(LOG_TAG_MAIN, "Running partition: unknown");
    break;
  }

  // check if an OTA has been done, if so run diagnostics
  esp_ota_img_states_t ota_state;
  if (esp_ota_get_state_partition(partition, &ota_state) == ESP_OK)
  {
    if (ota_state == ESP_OTA_IMG_PENDING_VERIFY)
    {
      ESP_LOGI(LOG_TAG_MAIN, "An OTA update has been detected.");
      if (run_diagnostics())
      {
        ESP_LOGI(LOG_TAG_MAIN,
                 "Diagnostics completed successfully! Continuing execution.");
        esp_ota_mark_app_valid_cancel_rollback();
      }
      else
      {
        ESP_LOGE(LOG_TAG_MAIN,
                 "Diagnostics failed! Start rollback to the previous version.");
        esp_ota_mark_app_invalid_rollback_and_reboot();
      }
    }
  }

  // Initialize NVS
  esp_err_t ret = nvs_flash_init();
  if (ret == ESP_ERR_NVS_NO_FREE_PAGES ||
      ret == ESP_ERR_NVS_NEW_VERSION_FOUND)
  {
    ESP_ERROR_CHECK(nvs_flash_erase());
    ret = nvs_flash_init();
  }
  ESP_ERROR_CHECK(ret);

  // BLE Setup
  esp_bt_mem_release(ESP_BT_MODE_BTDM);

  // initialize BLE controller and nimble stack
  esp_nimble_hci_and_controller_init();
  nimble_port_init();

  // register sync and reset callbacks
  ble_hs_cfg.sync_cb = sync_cb;
  ble_hs_cfg.reset_cb = reset_cb;

  // initialize service table
  gatt_svr_init();

  // set device name and start host task
  ble_svc_gap_device_name_set(device_name);
  nimble_port_freertos_init(host_task);

  ESP_LOGI(LOG_TAG_MAIN, "initing LED");
  gpio_reset_pin(GPIO_NUM_19);
  valiturus_led_init();

  ESP_LOGI(LOG_TAG_MAIN, "init button");
  gpio_reset_pin(GPIO_NUM_18);
  valiturus_button_init(button_interrupt_handler);

  // init tasks
  xTaskCreate(LED_Control_Task, "LED_Control_Task", 2048, NULL, 1, NULL);
}
