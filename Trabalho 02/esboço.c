// Implemente aqui a lógica de controle do carro, utilizando as funções da api
/*void user_code(void) 
{
    unsigned int time = get_time();

    unsigned int ultimoTime = time;

    while(1 == 1)
    {
        /*int x, y, z;
        get_position(&x, &y, &z);

        posicao[0] = ((float) x)/10.0;
        posicao[1] = ((float) y)/10.0;
        posicao[2] = ((float) z)/10.0;*/

        read_sensors(lum);

        /*deltaT = get_time() - ultimoTime;
        deltaT /= 1000.0;

        calcula_velocidade();

        controle_longitudinal();*/
        controle_lateral();

        accel = 1;

        set_motor(accel, steering);

        /*ultima2Posicao[0] = ultimaPosicao[0];
        ultima2Posicao[1] = ultimaPosicao[1];
        ultima2Posicao[2] = ultimaPosicao[2];
        ultimaPosicao[0] = posicao[0];
        ultimaPosicao[1] = posicao[1];
        ultimaPosicao[2] = posicao[2];
        ultimoTime = get_time();
        ultimoDeltaT = deltaT;*/
    }

    set_motor(0, 0);
    set_handbreak(1);
}*/