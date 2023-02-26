

set(MAIN_REQUIRES "${MAIN_REQUIRES} driver valiturus_led valiturus_button nvs_flash bt bootloader app_update BMI160_driver lsm303agr-pid lsm303agrImpl protobuf valiturus_battery esp_http_server esp_eth")
set(CPACK_SOURCE_IGNORE_FILES "examples/*")

set(MAIN_SRCS
    "${MAIN_SRCS}"
    "main.c"
    "application/sensors/bmiSensor/bmiTasks.c"
    "application/exercise/exercise.c"
    "application/ota/ota.c"
    "application/bluetooth/bluetooth.c"
    "application/bluetooth/gatt/gatt.c"
    "application/bluetooth/gatt/gap.c"
    "application/bluetooth/gatt/ota_gatt_service.c"
    "application/proto/c_proto/Algorithim.pb.c"
)

# idf_component_register(SRCS "main.c"
# INCLUDE_DIRS ".")
idf_component_register(SRCS ${MAIN_SRCS}
    INCLUDE_DIRS "." REQUIRES ${MAIN_REQUIRES})