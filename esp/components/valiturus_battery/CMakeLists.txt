set(srcs "valiturus_battery.c")

idf_component_register(SRCS ${srcs}
                    INCLUDE_DIRS "."
                    PRIV_REQUIRES "driver esp_adc freertos")
