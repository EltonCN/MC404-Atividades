#include "simbolo.h"
#include "token.h"
#include <string.h>
#include <stdio.h>

static Simbolo simbolos[MAX_SIMBOLO];
static int nSimbolo = 0;

int getNSimbolo()
{
    return nSimbolo;
}

void adicionaSimbolo(char* nome, int linha, int lado, int tipo)
{
    if(nSimbolo == MAX_SIMBOLO)
    {
        return;
    }

    if(tipo == DefRotulo)
    {
        simbolos[nSimbolo].lado = lado;
        simbolos[nSimbolo].linha = linha;

        nome[strlen(nome)-1] = '\0';

        simbolos[nSimbolo].nome = nome;
    }
    else
    {
        simbolos[nSimbolo].lado = lado;
        simbolos[nSimbolo].linha = linha;
        simbolos[nSimbolo].nome = nome;
    }
    

    nSimbolo+=1;
}

Simbolo* getSimbolo(char* nome)
{
    for(int i = 0; i<nSimbolo; i++)
    {
        if(strcmp(nome, simbolos[i].nome) == 0)
        {
            return &simbolos[i];
        }
    }

    return NULL;
}

void imprimeTabela()
{
    for(int i = 0; i<nSimbolo; i++)
    {
        printf("Nome: %s, valor: %d, lado: %d\n", simbolos[i].nome, simbolos[i].linha, simbolos[i].lado);
    }
}