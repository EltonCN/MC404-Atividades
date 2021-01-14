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

unsigned int timeCtrInicio;
unsigned int timeCtrAtual;

void set_motor_contr(char steering)
{
    timeCtrAtual = get_time();

    if(timeCtrAtual - timeCtrInicio < 600)
    {
        set_motor(1, steering);
    }
    else if (timeCtrAtual - timeCtrInicio < 990)
    {
        set_motor(0, steering);
    }
    else if (timeCtrAtual - timeCtrInicio < 1000)
    {
        set_motor(0, steering);
        set_handbreak(1);
    }
    else
    {
        timeCtrInicio = timeCtrAtual;
        set_handbreak(0);
        set_motor(1, steering);
    }
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
 * @brief Mantém o carro dentro da pista por algum tempo
 * 
 * @param tempo - tempo em ms
 */
void seguePista()
{
    int centro = 128;
    int ultimo_erro = 0;


    int indice[256];

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
    set_motor_contr(steering);
    
    ultimo_erro = erro;
}

/**
 * @brief Calcula a distância de Manhattan entre 2 vetores
 * 
 * @param vec1 float* - vetor 1 2x1
 * @param vec2 float* - vetor 2 2x1
 * @return float - distância
 */
int dist_manhattan(int* vec1, int* vec2)
{
    int result;

    if(vec1[0] > vec2[0])
    {
        result += vec1[0]-vec2[0];
    }
    else
    {
        result -= vec1[0]-vec2[0];
    }

    if(vec1[1] > vec2[1])
    {
        result += vec1[1]-vec2[1];
    }
    else
    {
        result -= vec1[1]-vec2[1];
    }
    
    return result;
}

int ax, ay, az;

void girar(int angulo)
{
    

    get_rotation(&ax, &ay, &az);

    int steering = 127;

    if(angulo < ay)
    {
        steering = -127;

        angulo *= -1;
    }

    while(angulo - ay > 1)
    {
        set_motor(1,steering);
        get_rotation(&ax, &ay, &az);
    }

}

typedef struct Area
{
    int xMin,
        xMax,
        zMin,
        zMax;
} Area;

/**
 * @brief Verifica se um ponto está dentro de uma área
 * 
 * @param area Área
 * @param x x do ponto
 * @param z z do ponto
 * @return int 1 se dentro, 0 se fora
 */
int dentroArea(Area area, int x, int z)
{

    if(x< area.xMax && x>area.xMin)
    {
        if(z>area.zMin && z<area.zMax)
        {
            return 1;
        }
    }

    return 0;
}

#define NORTE 180
#define SUL 0
#define LESTE 270
#define OESTE 90


int getDirecao()
{
    int ax, ay, az;

    get_rotation(&ax, &ay, &az);

    if(ay>= 135 && ay < 225)
    {
        return NORTE;
    }
    else if(ay>= 225 && ay < 315)
    {
        return LESTE;
    }
    else if(ay>=45 && ay <135)
    {
        return OESTE;
    }
    else
    {
        return SUL;
    }
    

}

int x,y,z;
/**
 * @brief Mantém o carro dentro da pista, utilizando um controlador PD
 * 
 */
void user_code(void) 
{
    Area cruzamento[5];

    cruzamento[0].xMin = -22;
    cruzamento[0].xMax = -7;
    cruzamento[0].zMin = -5;
    cruzamento[0].zMax = 30;

    cruzamento[1].xMin = 125;
    cruzamento[1].xMax = 161;
    cruzamento[1].zMin = -13;
    cruzamento[1].zMax = 23;

    cruzamento[2].xMin = 279;
    cruzamento[2].xMax = 294;
    cruzamento[2].zMin = -18;
    cruzamento[2].zMax = 17;

    cruzamento[3].xMin = 282;
    cruzamento[3].xMax = 297;
    cruzamento[3].zMin = 197;
    cruzamento[3].zMax = 212;

    cruzamento[4].xMin = 133;
    cruzamento[4].xMax = 169;
    cruzamento[4].zMin = 200;
    cruzamento[4].zMax = 216;
    
    timeCtrInicio = get_time();
    timeCtrAtual = timeCtrInicio;

    delayMotor(200,1,0);


    while(1 == 1)
    {
        seguePista();
        
        get_position(&x, &y, &z);



        if(dentroArea(cruzamento[0],x,z) == 1)
        {
            set_handbreak(1);

            int dir = getDirecao();

            char steering;

            int dirFinal;

            if(dir == NORTE)
            {
                steering = -127;
                dirFinal = OESTE;
            }
            else if (dir == LESTE)
            {
                steering = 127;
                dirFinal = SUL;
            }

            while(dentroArea(cruzamento[0],x,z) && getDirecao() != dirFinal)
            {
                get_position(&x, &y, &z);
                set_motor(1, steering);
            }

            while(dentroArea(cruzamento[0],x,z))
            {
                get_position(&x, &y, &z);
                set_motor(1, 0);
            }
        }

        if(dentroArea(cruzamento[1],x,z) == 1)
        {
            set_handbreak(1);

            int dir = getDirecao();

            char steering;

            if(dir == OESTE)
            {
                steering = 0;
            }
            else if (dir == NORTE)
            {
                steering = 127;
            }
            else if (dir == LESTE)
            {
                steering = 127;
            }

            while(dentroArea(cruzamento[1],x,z))
            {
                get_position(&x, &y, &z);
                set_motor(1, steering);
            }
        }



        if(dentroArea(cruzamento[2],x,z) == 1)
        {
            set_handbreak(1);

            int dir = getDirecao();

            char steering;

            if(dir == OESTE)
            {
                steering = -127;
            }
            else if (dir == NORTE)
            {
                steering = 127;
            }

            while(dentroArea(cruzamento[2],x,z))
            {
                get_position(&x, &y, &z);
                set_motor(1, steering);
            }
        }
        

        if(dentroArea(cruzamento[3],x,z) == 1)
        {
            set_handbreak(1);

            int dir = getDirecao();

            char steering;

            if(dir == SUL)
            {
                steering = -127;
            }
            else if (dir == OESTE)
            {
                steering = 127;
            }

            while(dentroArea(cruzamento[3],x,z))
            {
                get_position(&x, &y, &z);
                set_motor(1, steering);
            }
        }

//const int areaEntrei[12] = {0,     1,     2,     3,    4,    1,     0,     4,     3,     2,     1,     4}; //Area em que o carro entrou
//const int angulo[12] =     {NORTE, OESTE, OESTE, SUL, LESTE, NORTE, LESTE, OESTE, OESTE, NORTE, LESTE, SUL}; //Sentido em que ele esta
//const int ladoGiro[12] =   {-1,    0,     -1,    -1,  -1,     1,    1,     0,     1,     1,      1,     1}; //Sentido em que ele precisa girar

        if(dentroArea(cruzamento[4],x,z) == 1)
        {
            set_handbreak(1);

            int dir = getDirecao();

            char steering;

            if(dir == LESTE)
            {
                steering = -127;
            }
            else if (dir == OESTE)
            {
                steering = 0;
            }
            else if (dir == SUL)
            {
                steering = 127;
            }

            while(dentroArea(cruzamento[4],x,z))
            {
                get_position(&x, &y, &z);
                set_motor(1, steering);
            }
        }


        /*for(int k = 0; k<5; k++)
        {
            if(dentroArea(cruzamento[k],x,z) == 1)
            {
                set_handbreak(1);

                while(1 == 1)
                {

                }

                int dir = getDirecao();

                for(int j = 0; j<12; j++)
                {
                    if(areaEntrei[j] == k && angulo[j] == k)
                    {
                        char steering = 127 * ladoGiro[j];
                        while(dentroArea(cruzamento[k],x,z))
                        {
                            get_position(&x, &y, &z);
                            set_motor(1, steering);
                        }
                    }
                }

                
            }

        }*/

        
    }

    set_handbreak(1);

    
}
