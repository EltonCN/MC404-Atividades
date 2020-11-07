#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char* converteParaHex(char* palavra)
{
    int valor = atoi(palavra);
    char* hex = malloc(sizeof(char)*3);

    hex[2] = 'G';

    sprintf(hex, "%X", valor);

    if(hex[2] == '\0')
    {
        hex[2] = hex[1];
        hex[1] = hex[0];
        hex[0] = '0';
    }


    return hex;
}

char* formataPalavraHex(char* palavra)
{
    char* hex = malloc(sizeof(char)*3);

    hex[0] = '0';
    hex[1] = '0';
    hex[2] = '0';

    int nDigito = strlen(palavra);

    if(nDigito == 1)
    {
        hex[2] = palavra[0];
    }
    else if (nDigito == 2)
    {
        hex[1] = palavra[0];
        hex[2] = palavra[1];
    }
    else
    {
        hex[0] = palavra[0];
        hex[1] = palavra[1];
        hex[2] = palavra[2];
    }  

    return hex;
}

int main()
{
    char* hex = formataPalavraHex("A");

    printf("%c|%c|%c", hex[0], hex[1], hex[2]);

    printf("\n");

    int pontoMontagem = 5;

    int valor = 6;

    int endereco = valor* ((int) pontoMontagem/valor);

    if(pontoMontagem%valor != 0)
    {
        endereco += valor;
    }

    printf("%d", endereco);



    return 0;
}