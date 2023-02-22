// bmiTasks defines tasks required for the application
// Therefore this file specifies application specific code which

#include "bmiSensor.h"

void init()
{
    // init sensor
    init_bmi160();
}

void read_sensors()
{

    int reads = 0;
    while (reads < 100)
    {
        // To read both Accel and Gyro data
        bmi160_get_sensor_data((BMI160_ACCEL_SEL | BMI160_GYRO_SEL), &bmi160_accel, &bmi160_gyro, &bmi160dev); // this should cause a linker error

        // ESP_LOGI(BMI_160_EXAMPLE_TAG, "ax:%d\tay:%d\taz:%d\n", bmi160_accel.x, bmi160_accel.y, bmi160_accel.z);
        // ESP_LOGI(BMI_160_EXAMPLE_TAG, "gx:%d\tgy:%d\tgz:%d\n", bmi160_gyro.x, bmi160_gyro.y, bmi160_gyro.z);

        reads = reads + 1;
    }
}