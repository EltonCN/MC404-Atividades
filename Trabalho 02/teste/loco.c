#include "api_car.h"

float setPointVel2 = 729;

double posicao[3];
float direcao[3];
double velocidade[3];
double magVelocidade2;
double deltaT;
double ultimoDeltaT;
double ultimaPosicao[3];
double ultima2Posicao[3];
int accel;
int steering;
unsigned char lum[256];

float kp = 0.03;

void controle_longitudinal()
{
    float erro = setPointVel2 - magVelocidade2;

    if(erro > 0)
    {
        accel = 1;
    }
    else if(erro < 0)
    {
        accel = -1;
    }
    else
    {
        accel = 0;
    }

    accel = 1;
}

void controle_lateral()
{
    float erro = 0.0;

    /*for(int i = 0; i<256; i++)
    {
        float peso = i - 128.0;

        if(peso < -85)
        {
            peso = -3;
        }
        else if(peso <-42)
        {
            peso = -2;
        }
        else if(peso < 0)
        {
            peso = -1;
        }
        else if(peso < 42)
        {
            peso = 1;
        }
        else if(peso < 85)
        {
            peso = 2;
        }
        else
        {
            peso = 3;
        }
        

        erro += peso*(255-lum[i]);
    }*/

    for(int i = 64; i<192; i++)
    {
        int peso = i - 128;

        if(peso<-43)
        {
            peso = -3;
        }
        else if(peso<-21)
        {
            peso = 2;
        }
        else if(peso<0)
        {
            peso = -1;
        }
        else if(peso <21)
        {
            peso = 1;
        }
        else if(peso <43)
        {
            peso = 2;
        }
        else
        {
            peso = 3;
        }

        erro += peso*(255-lum[i]);
        
    }

    steering = (erro * kp);

    if(steering > 127)
    {
        steering = 127;
    }
    else if(steering < -127)
    {
        steering = -127;
    }
}

void delay(unsigned int duracao)
{
    unsigned int time = get_time();

    do
    {
    } while (get_time()-time < duracao);
}

void delayMotor(unsigned int duracao, int accel, int steering)
{
    unsigned int time = get_time();

    do
    {
        set_motor(accel, steering);
    } while (get_time()-time < duracao);
}

void calcula_velocidade()
{
    velocidade[0] = posicao[0] - ultima2Posicao[0];
    velocidade[1] = posicao[1] - ultima2Posicao[1];
    velocidade[2] = posicao[2] - ultima2Posicao[2];

    float delta = deltaT + ultimoDeltaT;

    velocidade[0] /= delta;
    velocidade[1] /= delta;
    velocidade[2] /= delta;

    magVelocidade2 = 0;
    magVelocidade2 += velocidade[0] * velocidade[0];
    magVelocidade2 += velocidade[1] * velocidade[1];
    magVelocidade2 += velocidade[2] * velocidade[2];
 }

void _start(void) 
{
    int posicao[2];

    while(1 == 1)
    {
        get_pos(posicao);

        print_int(posicao[0]);
        print_int(posicao[1]);
    }
}