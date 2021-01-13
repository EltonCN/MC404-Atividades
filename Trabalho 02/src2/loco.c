#include "api_car.h"


int accel;
int steering;
unsigned char lum[256];

//Constantes de ajuste
const float kp = 1.2;
const float kd = 0.5;
const int max_steering = 80;


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

    int indice[256];

    while(1 == 1)
    {
        //Verifica a posição do centro da pista para calcular o erro
        read_sensors(lum);

        int ultimo_centro = centro;
        centro = 0;

        int nIndice = 0;

        for(int i = 0; i<256; i++)
        {
            if(lum[i]>125 && lum[i] < 150)
            {
                indice[nIndice] = i;
                nIndice += 1;
            }
        }
        
        if(nIndice > 25)
        {
            centro /= nIndice;

            centro = indice[(int)(nIndice/2)];
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
