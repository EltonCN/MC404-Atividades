#include "montador.h"
#include "simbolo.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int pontoMontagem = 0;
int lado = ESQ;
char saida[1023][14];

int mapeiaLinha[1023];
int indexMapa = 0;

char* converteParaHex(char* palavra)
{
    int valor = atoi(palavra);
    char* hex = malloc(sizeof(char)*3);
    sprintf(hex, "%X", valor);

    if(hex[1] == '\0')
    {
        hex[2] = hex[0];
        hex[1] = '0';
        hex[0] = '0';
    }
    else if(hex[2] == '\0')
    {
        hex[2] = hex[1];
        hex[1] = hex[0];
        hex[0] = '0';
    }

    return hex;
}

char* converteIntParaHex(int valor)
{
    char* hex = malloc(sizeof(char)*3);

    sprintf(hex, "%X", valor);

    if(hex[1] == '\0')
    {
        hex[2] = hex[0];
        hex[1] = '0';
        hex[0] = '0';
    }
    else if(hex[2] == '\0')
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

    int nDigito = strlen(palavra)-2;

    if(nDigito == 1)
    {
        hex[2] = palavra[2];
    }
    else if (nDigito == 2)
    {
        hex[1] = palavra[2];
        hex[2] = palavra[3];
    }
    else
    {
        hex[0] = palavra[2];
        hex[1] = palavra[3];
        hex[2] = palavra[4];
    }  

    return hex;
}

void preencheAAA(int linha)
{
    if(saida[linha][0] == '\0')
    {
        char* pontoHex = converteIntParaHex(linha);
        saida[linha][0] = pontoHex[0];
        saida[linha][1] = pontoHex[1];
        saida[linha][2] = pontoHex[2];
    }

    mapeiaLinha[indexMapa] = linha;
    indexMapa+=1;
}


int geraInstrucao(Token* inst, Token* arg1)
{
    char instrucao[5];
    int ladoArgumento = ESQ;

    if(arg1 == NULL)
    {
        instrucao[2] = '0';
        instrucao[3] = '0';
        instrucao[4] = '0';
    }
    else if(arg1->tipo == Hexadecimal)
    {
        

        char* hex = formataPalavraHex(arg1->palavra);

        instrucao[2] = hex[0];
        instrucao[3] = hex[1];
        instrucao[4] = hex[2];
        
    }
    else if(arg1->tipo == Decimal)
    {
        char* hex;

        

        hex = converteParaHex(arg1->palavra);
       
        instrucao[2] = hex[0];
        instrucao[3] = hex[1];
        instrucao[4] = hex[2];
    }
    else
    {
        Simbolo* arg = getSimbolo(arg1->palavra);

        if(arg == NULL)
        {
            return 1;
        }

        ladoArgumento = arg->lado;

        char *hex;


        hex = converteIntParaHex(arg->linha);


        instrucao[2] = hex[0];
        instrucao[3] = hex[1];
        instrucao[4] = hex[2];
    }

    int i = 0;

    while (inst->palavra[i] != '\0')
    {
        if(inst->palavra[i]>90)
        {
            inst->palavra[i] -= 32;
        }

        i+=1;
    } 
    

    instrucao[0] = '0';

    if(strcmp(inst->palavra, "LD\0") == 0)
    {
        instrucao[1] = '1';
    }
    else if(strcmp(inst->palavra, "LDINV\0") == 0)
    {
        instrucao[1] = '2';
    }
    else if(strcmp(inst->palavra, "LDABS\0") == 0)
    {
        instrucao[1] = '3';
    }
    else if(strcmp(inst->palavra, "LDMQ\0") == 0)
    {
        instrucao[1] = 'A';
    }
    else if(strcmp(inst->palavra, "LDMQMX\0") == 0)
    {
        instrucao[1] = '9';
    }
    else if(strcmp(inst->palavra, "STORE\0") == 0)
    {
        instrucao[0] = '2';
        instrucao[1] = '1';
    }
    else if(strcmp(inst->palavra, "JUMP\0") == 0)
    {
        if(ladoArgumento == ESQ)
        {
            instrucao[1] = 'D';
        }
        else
        {
            instrucao[1] = 'E';
        }
        
    }
    else if(strcmp(inst->palavra, "JGE\0") == 0)
    {
        if(ladoArgumento == ESQ)
        {
            instrucao[1] = 'F';
        }
        else
        {
            instrucao[0] = '1';
            instrucao[1] = '0';
        }
    }
    else if(strcmp(inst->palavra, "ADD\0") == 0)
    {
        instrucao[1] = '5';
    }
    else if(strcmp(inst->palavra, "ADDABS\0") == 0)
    {
        instrucao[1] = '7';
    }
    else if(strcmp(inst->palavra, "SUB\0") == 0)
    {
        instrucao[1] = '6';
    }
    else if(strcmp(inst->palavra, "SUBABS\0") == 0)
    {
        instrucao[1] = '8';
    }
    else if(strcmp(inst->palavra, "MULT\0") == 0)
    {
        instrucao[1] = 'B';
    }
    else if(strcmp(inst->palavra, "DIV\0") == 0)
    {
        instrucao[1] = 'C';
    }
    else if(strcmp(inst->palavra, "LSH\0") == 0)
    {
        instrucao[0] = '1';
        instrucao[1] = '4';
    }
    else if(strcmp(inst->palavra, "RSH\0") == 0)
    {
        instrucao[0] = '1';
        instrucao[1] = '5';
    }
    else//"STREND\0"
    {
        if(ladoArgumento == ESQ)
        {
            instrucao[0] = '1';
            instrucao[1] = '2';
        }
        else
        {
            instrucao[0] = '1';
            instrucao[1] = '3';
        }
    }
    
    for(int i = 0; i<5; i++)
    {
        if(lado == ESQ)
        {
            saida[pontoMontagem][i+3] = instrucao[i];
        }
        else
        {
            saida[pontoMontagem][i+8] = instrucao[i];
        }
        
    }

    if(saida[pontoMontagem][0] == '\0')
    {
        preencheAAA(pontoMontagem);
    }


    if(lado == ESQ)
    {
        lado = DIR;
    }
    else
    {
        pontoMontagem += 1;
        lado = ESQ;
    }

    return 0;
}

int executaDiretiva(Token* dir, Token* arg1, Token* arg2)
{
    int i = 0;

    while (dir->palavra[i] != '\0')
    {
        if(dir->palavra[i]>90)
        {
            dir->palavra[i] -= 32;
        }

        i+=1;
    }

    if(strcmp(dir->palavra, ".SET\0") == 0)
    {
        int valor;

        if(arg2->tipo == Hexadecimal)
        {
            valor = strtol(arg2->palavra, NULL, 16);
        }
        else
        {
            valor = atoi(arg2->palavra);
        }

        adicionaSimbolo(arg1->palavra, valor, ESQ, Nome);
    }
    else if(strcmp(dir->palavra, ".ORG\0") == 0)
    {
        int valor;

        if(arg1->tipo == Hexadecimal)
        {
            valor = strtol(arg1->palavra, NULL, 16);
        }
        else
        {
            valor = atoi(arg1->palavra);
        }

        pontoMontagem = valor;
        lado = ESQ;
    }
    else if(strcmp(dir->palavra, ".ALIGN\0") == 0)
    {
        if(lado == DIR)
        {
            pontoMontagem += 1;
        }

        int valor = atoi(arg1->palavra);

        int endereco = valor* ((int) pontoMontagem/valor);

        if(pontoMontagem%valor != 0)
        {
            endereco += valor;
        }

        pontoMontagem = endereco;

        lado = ESQ;
        
    }  
    else if(strcmp(dir->palavra, ".WFILL\0") == 0)
    {
        int n = atoi(arg1->palavra);
        char valor[10];

        for(int i = 0; i<10; i++)
        {
            valor[i] = '0';
        }
        
        if(arg2->tipo == Hexadecimal)
        {
            int index = 0;

            int tamanho = strlen(arg2->palavra)-2;

            for(int i = 10-tamanho; i<10; i++)
            {
                valor[i] = arg2->palavra[index+2];
                index += 1;
            }

        }
        else if(arg2->tipo == Decimal)
        {

            int decimal = atoi(arg2->palavra);
            char hex[11];

            sprintf(hex, "%X", decimal);

            int index = 0;

            int tamanho = strlen(hex);

            for(int i = 10-tamanho; i<10; i++)
            {
                valor[i] = hex[index];
                index += 1;
            }
        }
        else
        {
            Simbolo* simb = getSimbolo(arg2->palavra);

            if(simb == NULL)
            {
                return 2;
            }

            int decimal = simb->linha;

            char hex[11];

            sprintf(hex, "%X", decimal);

            int index = 0;

            for(int i = 10-strlen(hex); i<10; i++)
            {
                valor[i] = hex[index];
                index += 1;
            }

        }

        for(int i = 0; i<n; i++)
        {
            if(saida[pontoMontagem+i][0] == '\0')
            {
                preencheAAA(pontoMontagem+i);

                for(int j = 0; j<10; j++)
                {
                    saida[pontoMontagem+i][j+3] = valor[j];
                }
            }
            
        }

        pontoMontagem += n;

    }
    else if(strcmp(dir->palavra, ".WORD\0") == 0)
    {
        char valor[10];

        for(int i = 0; i<10; i++)
        {
            valor[i] = '0';
        }
        

        if(arg1->tipo == Hexadecimal)
        {
            int index = 0;

            int tamanho = strlen(arg1->palavra)-2;

            for(int i = 10-tamanho; i<10; i++)
            {
                valor[i] = arg1->palavra[index+2];
                index += 1;
            }
        }
        else if(arg1->tipo == Decimal)
        {
            int decimal = atoi(arg1->palavra);
            char hex[11];

            sprintf(hex, "%X", decimal);

            int index = 0;

            int tamanho = strlen(hex);

            for(int i = 10-tamanho; i<10; i++)
            {
                valor[i] = hex[index];
                index += 1;
            }
        }
        else
        {
            Simbolo* simb = getSimbolo(arg1->palavra);

            if(simb == NULL)
            {
                return 2;
            }

            int decimal = simb->linha;

            char hex[11];

            sprintf(hex, "%X", decimal);

            int index = 0;

            for(int i = 10-strlen(hex); i<10; i++)
            {
                valor[i] = hex[index];
                index += 1;
            }

        }

        if(saida[pontoMontagem][0] == '\0')
        {
            preencheAAA(pontoMontagem);

            for(int j = 0; j<10; j++)
            {
                saida[pontoMontagem][j+3] = valor[j];
            }

            pontoMontagem += 1;
        }
        else
        {
            pontoMontagem += 1;
        }
        
        
    }


    return 0;
}

void printErroSimbolo(char* simbolo)
{
    fprintf(stderr, "ERRO: Rótulo ou símbolo usado mas não definido: %s\n", simbolo);
}

/*
    ---- Voce deve implementar essa função para a Parte 2! ----
    Utilize os tokens da estrutura de tokens para montar seu código!
    Retorna:
        *  1 caso haja erro na montagem; (imprima o erro em stderr)
        *  0 caso não haja erro.
 */
int emitirMapaDeMemoria()
{
    for(int i = 0; i<1023; i++)
    {
        saida[i][0] = '\0';
        for(int j = 1; j<13; j++)
        {
            saida[i][j] = '0';
        }
        saida[i][13] = '\0';

        mapeiaLinha[i] = -1;
    }


    int i = 0;
    int index = 0;
    int posComand;
    int linha;
    Token* tokens[4]; //Armazena uma linha de tokens

    ///Rodada 1: procura rotulos
    while (getNumberOfTokens() != i)
    {
        linha = recuperaToken(i)->linha;
        posComand = -1;
        index = 0;

        //Separa uma linha de tokens
        while(recuperaToken(i)->linha == linha)
        {
            tokens[index] = recuperaToken(i);

            if(tokens[index]->tipo == Instrucao || tokens[index]->tipo == Diretiva)
            {
                posComand = index;
            }

            i+= 1;
            index += 1;

            if(i == getNumberOfTokens())
            {
                break;
            }
        }

        if(tokens[0]->tipo == DefRotulo)
        {
            adicionaSimbolo(tokens[0]->palavra, pontoMontagem, lado, DefRotulo);
        }

        if(posComand != -1)
        {
            if(tokens[posComand]->tipo == Instrucao)
            {
                if(lado == ESQ)
                {
                    lado = DIR;
                }
                else
                {
                    lado = ESQ;
                    pontoMontagem += 1;
                }
                
            }
            else
            {
                int lugarErrado = executaDiretiva(tokens[posComand], tokens[posComand+1], tokens[posComand+2]);
                if( lugarErrado!= 0)
                {
                    printErroSimbolo(tokens[posComand+lugarErrado]->palavra);
                    return 1;
                }
            }
           
        }

    }

    pontoMontagem = 0;
    lado = ESQ;

    //Rodada 2: monta o mapa
    i = 0;
    while (getNumberOfTokens() != i)
    {
        linha = recuperaToken(i)->linha;
        posComand = -1;
        index = 0;

        //Separa uma linha de tokens
        while(recuperaToken(i)->linha == linha)
        {
            tokens[index] = recuperaToken(i);

            if(tokens[index]->tipo == Instrucao || tokens[index]->tipo == Diretiva)
            {
                posComand = index;
            }

            i+= 1;
            index += 1;

            if(i == getNumberOfTokens())
            {
                break;
            }
        }

        for(int j = index; j<4; j++)
        {
            tokens[j] = NULL;
        }

        if(posComand != -1)
        {
            if(tokens[posComand]->tipo == Instrucao)
            {
                if(geraInstrucao(tokens[posComand], tokens[posComand+1]) != 0)
                {
                    printErroSimbolo(tokens[posComand+1]->palavra);
                    return 1;
                }
            }
            else
            {
                int lugarErrado = executaDiretiva(tokens[posComand], tokens[posComand+1], tokens[posComand+2]);
                if( lugarErrado!= 0)
                {
                    printErroSimbolo(tokens[posComand+lugarErrado]->palavra);
                    return 1;
                }
            }
           
        }

    }

    for(int i = 0; i<1023; i++)
    {
        if(mapeiaLinha[i] == -1)
        {
            break;
        }
        for(int j = 0; j<3; j++)
        {
            printf("%c", saida[mapeiaLinha[i]][j]);
        }
        printf(" ");
        for(int j = 3; j<5; j++)
        {
            printf("%c", saida[mapeiaLinha[i]][j]);
        }
        printf(" ");
        for(int j = 5; j<8; j++)
        {
            printf("%c", saida[mapeiaLinha[i]][j]);
        }
        printf(" ");
        for(int j = 8; j<10; j++)
        {
            printf("%c", saida[mapeiaLinha[i]][j]);
        }
        printf(" ");
        for(int j = 10; j<13; j++)
        {
            printf("%c", saida[mapeiaLinha[i]][j]);
        }
        printf("\n");
    }

    /* printf("Voce deve implementar essa função para a Parte 2!");*/
    return 0;
}
