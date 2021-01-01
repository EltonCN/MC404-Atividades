#include "api_car.h"

// Implemente aqui a lógica de controle do carro, utilizando as funções da api
void user_code(void) 
{

    while(read_sensor_distance()>10 || read_sensor_distance() < 0)
    {
        set_motor(1,0);
    }

    set_motor(0, 0);
    set_handbreak(1);
}
