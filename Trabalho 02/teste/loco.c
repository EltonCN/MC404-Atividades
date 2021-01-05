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
int x, y, z;

    int x_ant, y_ant, z_ant;

    accel = 1;
    int steering = 0;

    get_position(&x_ant, &y_ant, &z_ant);

    unsigned int tempo_inicio, tempo_final, tempo_accel = 100;

    tempo_inicio = get_time();

    

    while(1 == 1)
    {
        tempo_final = get_time();

        if(tempo_final - tempo_inicio < 1000)
        {
            set_motor(accel, steering);
        }
        else if (tempo_final - tempo_inicio < 1000)
        {
            set_handbreak(1);
        }
        else
        {
            get_position(&x, &y, &z);

            float velocidade[3];
            float deltaT = ((float)(tempo_final - tempo_inicio))/1000.0;

            velocidade[0] = (((float) (x - x_ant))/10.0);
            velocidade[1] = (((float) (y - y_ant))/10.0);
            velocidade[2] = (((float) (z - z_ant))/10.0);

            magVel =  (velocidade[0]*velocidade[0]);
            magVel += (velocidade[1]*velocidade[1]);
            magVel += (velocidade[2]*velocidade[2]);
            magVel = raiz(magVel);

            if(magVel < setpoint_vel)
            {
                accel = 1;
            }
            else
            {
                break;
            }
 
            /*float erro = setpoint_vel - magVel;
            
            accel = 1;
            if(erro < 0.0)
            {
                tempo_accel = 1000;
                accel = 0;

                steering = 10;
            }
            else
            {
                tempo_accel = ((int) (90.0*erro));

                if(tempo_accel > 1000)
                {
                    tempo_accel = 1000;
                }

                steering = 0;
            }*/
            
            x_ant = x;
            y_ant = y;
            z_ant = z;

            tempo_inicio = get_time();
        }
    }

    set_handbreak(1);
    set_motor(0,0);

    return; 
    //// Fim da seção de testes
*/

void _start(void) 
{
    int posicao[2];
    int posicao_ant[2];

    float magVel;

    while(1 == 1)
    {
        get_pos(posicao);

        float velocidade[3];
        //float deltaT = ((float)(tempo_final - tempo_inicio))/1000.0;

        velocidade[0] = (((float) (posicao[0] - posicao_ant[0]))/10.0);
        velocidade[2] = (((float) (posicao[1] - posicao_ant[1]))/10.0);   

        magVel =  (velocidade[0]*velocidade[0]);
        magVel += (velocidade[2]*velocidade[2]);
        magVel = raiz(magVel);

        int a = (int) magVel;

        print_int(a);
    }
}