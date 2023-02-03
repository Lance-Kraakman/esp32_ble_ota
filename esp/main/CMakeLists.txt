set(MAIN_REQUIRES
    valiturus_led
    valiturus_button
    nvs_flash
    bt
    bootloader
    app_update
    BMI160_driver
    bmi160Impl
    lsm303agr-pid
    lsm303agrImpl
)

idf_component_register(SRCS "gap.c" "gatt_svr.c" "main.c" 
                    INCLUDE_DIRS "." REQUIRES ${MAIN_REQUIRES})