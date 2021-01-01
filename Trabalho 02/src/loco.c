#include "api_car.h"


float kp = 0.001;
float ki = 0;
float kd = 0;

float setpointVel = 100;

float posicao[3];
float direcao[3];
float velocidade[3];
float magVelocidade; //AINDA PRECISA CRIAR FUNÇÃO PARA CALCULAR RAIZ, POSSUI MAG^2
float deltaT;
float ultimaPosicao[3];
int accel;


void controle_longitudinal()
{
    float erro = setpointVel - magVelocidade;

    float saida = kp*erro;

    if(saida > 0)
    {
        accel = 1;
    }
    else if(saida < 0)
    {
        accel = -1;
    }
    else
    {
        accel = 0;
    }
}

void calcula_velocidade()
{
    velocidade[0] = posicao[0] - ultimaPosicao[0];
    velocidade[1] = posicao[1] - ultimaPosicao[1];
    velocidade[2] = posicao[2] - ultimaPosicao[2];

    velocidade[0] /= deltaT;
    velocidade[1] /= deltaT;
    velocidade[2] /= deltaT;

    magVelocidade = 0;
    magVelocidade += velocidade[0] * velocidade[0];
    magVelocidade += velocidade[1] * velocidade[1];
    magVelocidade += velocidade[2] * velocidade[2];
 }

// Implemente aqui a lógica de controle do carro, utilizando as funções da api
void user_code(void) 
{
    unsigned int time = get_time();

    unsigned int ultimoTime = time;

    while(get_time()-time< (30*1000))
    {
        int x, y, z;
        get_position(&x, &y, &z);

        posicao[0] = ((float) x)/10.0;
        posicao[1] = ((float) y)/10.0;
        posicao[2] = ((float) z)/10.0;

        deltaT = get_time() - ultimoTime;
        deltaT /= 1000.0;

        calcula_velocidade();

        controle_longitudinal();


        set_motor(accel, 0);

        ultimaPosicao[0] = posicao[0];
        ultimaPosicao[1] = posicao[1];
        ultimaPosicao[2] = posicao[2];
        ultimoTime = get_time();
    }

    set_motor(0, 0);
    set_handbreak(1);
}
