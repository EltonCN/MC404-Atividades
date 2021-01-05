#include "api_car.h"


int accel;
int steering;
unsigned char lum[256];

//Constantes de ajuste
const float kp = 1.2;
const float kd = 0.5;
const int max_steering = 80;
const float setpoint_vel = 5.55556; //20 km/h

/**
 * @brief Espera uma quantidade de tempo
 * 
 * @param duracao - Tempo, em milissegundos
 */
void delay(unsigned int duracao)
{
    unsigned int time = get_time();

    do
    {
    } while (get_time()-time < duracao);
}

/**
 * @brief Espera um tempo, enviando um comando para o motor
 * 
 * @param duracao - Tempo, em milissegundos
 * @param accel  - Aceleração
 * @param steering - Direção
 */
void delayMotor(unsigned int duracao, int accel, int steering)
{
    unsigned int time = get_time();

    do
    {
        set_motor(accel, steering);
    } while (get_time()-time < duracao);
}

/**
 * @brief Calcula a raiz quadrada de um número
 * 
 * @param num - número
 * @return float - raiz do número
 */
float raiz(float num)
{
    if(num <= 0)
    {
        return 0.0;
    }

    float result = num/2.0;

    for(int i = 0; i<100; i++)
    {
        result = 0.5*(result+(num/result));

        if( (result*result)-num < 0.1)
        {
            break;
        }
    }

    return result;

}

/*
Funciona, mas com problema na colina:
Ciclo de 1000 ms
600 ms de aceleração
kp = 1.8
kd = 1.7
max_steering = 80
*/
/*
Funciona
Ciclo de 1000 ms
600 ms de aceleração
kp = 1.2
kd = 0.5
max_steering = 80
Com verificação de saída da pista
*/


/**
 * @brief Mantém o carro dentro da pista, utilizando um controlador PD
 * 
 */
void user_code(void) 
{
    int centro = 128;
    int ultimo_erro = 0;

    unsigned int time = get_time();

    unsigned int ultimo_time = time;

    while(1 == 1)
    {
        //Verifica a posição do centro da pista para calcular o erro
        read_sensors(lum);

        int n = 0;
        int ultimo_centro = centro;
        centro = 0;

        for(int i = 0; i<256; i++)
        {
            if(lum[i]>125 && lum[i] < 150)
            {
                n += 1;
                centro += i;
            }
        }
        
        if(n > 25)
        {
            centro /= n;
        }
        else
        {
            centro = ultimo_centro;
        }
        
        

        unsigned int time_atual = get_time();

        //Controle PD para manter na pista
        int erro = centro - 128;

        int steering = kp*erro;
        
        steering += kd*((erro-ultimo_erro)); //(time_atual-ultimo_time));


        if(steering > max_steering)
        {
            steering = max_steering;
        }
        else if(steering < -max_steering)
        {
            steering = -max_steering;
        }

        //Envia o comando aos motores, com ciclos de aceleração
        if(time_atual - time < 600)
        {
            set_motor(1, steering);
        }
        else if (time_atual - time < 1000)
        {
            set_motor(0, steering);
        }
        else
        {
            time = time_atual;
            set_motor(1, steering);
        }
        
        ultimo_erro = erro;
        ultimo_time = time_atual;
    }
    
}
