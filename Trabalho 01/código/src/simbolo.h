#ifndef SIMBOLO_H
#define SIMBOLO_H

#define MAX_SIMBOLO 1023
#define ESQ 0
#define DIR 1


typedef struct Simbolo
{
    int linha;
    int lado; //0 = ESQ, 1 = DIR
    char* nome;
} Simbolo;


void adicionaSimbolo(char* nome, int linha, int lado, int tipo);

int getNSimbolo();

Simbolo* getSimbolo(char* nome);

void imprimeTabela();

#endif