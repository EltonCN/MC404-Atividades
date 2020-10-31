#include "montador.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
 
/*
    Realiza o processamento da entrada do montador
    Separa a entrada em tokens, procura erros léxicos e procura erros gramaticais
*/

// Nomes das diretivas
const char * const NOME_DIRETIVA[] = {".SET\0", ".ORG\0", ".ALIGN\0", ".WFILL\0", ".WORD\0", 
                                    ".set\0", ".org\0", ".align\0", ".wfill\0", ".word\0"};
const int N_NOME_DIRETIVA = 10; //Quantidade de nom das diretivas
const int MENOR_DIRETIVA = 5;//Número de caractéres na menor diretiva. Menor diretiva é .set = [.,s,e,t,\0]

//Mnemonicos das instruções
const char * const MNEMONICO_INSTRUCAO[] = {"LD\0","LDINV\0","LDABS\0","LDMQ\0","LDMQMX\0","STORE\0","JUMP\0","JGE\0","ADD\0",
                                            "ADDABS\0","SUB\0","SUBABS\0","MULT\0","DIV\0","LSH\0","RSH\0","STOREND\0", 
                                            "ld\0","ldinv\0","ldabs\0","ldmq\0","ldmqmx\0","store\0","jump\0","jge\0","add\0",
                                            "addabs\0","sub\0","subabs\0","mult\0","div\0","lsh\0","rsh\0","storend\0"};
const int N_MNEMONICO_INSTRUCAO = 34; //Quantidade de mnemonicos das instruções
const int MENOR_INSTRUCAO = 3;//Número de caractéres na menor instrução. Menor instrução é ld = [l,d,\0]
const int INSTRUCAO_0_ARGUMENTO[] = {14, 15, 31, 32, 3, 20}; //Índices das instruções que recebem 0 argumentos
const int N_INSTRUCAO_0_ARGUMENTO = 6; //Quantidades de instruções que recebem 0 argumentos


//Define o tipo de argumento que um comando recebe
typedef struct TipoArgumento
{
    TipoDoToken tipoToken[4]; //Tipos possíveis de tokens
    int decMin[4]; //Se decimal, mínimo possível
    int decMax[4]; //Se decimal, máximo possível
} TipoArgumento;

//Define a lista de argumentos que cada diretiva pode receber. Cada linha é uma diretiva (mesmo índice do vetor de diretivas), 
//cada coluna contém dois elementos = argumentos. Argumento com tipoToken = {0} é inválido, o que significa que não recebe argumento
//{  {Argumento1}, {Argumento2} }
//Argumento: {{Tipo1,Tipo2, -1=FIM}, {min1, min2}, {max1, max2}}
const TipoArgumento ARGUMENTO_DIRETIVA[][2] = {
    {   {{Nome, -1},{0},{0}},   {{Decimal,Hexadecimal, -1 },{0},{2147483647}} }, //.set
    {   {{Decimal, Hexadecimal, -1},{0},{1023}},   {{0,-1},{0},{0}} }, //.org
    {   {{Decimal, Hexadecimal, -1},{0},{1023}},   {{0,-1},{0},{0}} }, //.align
    {   {{Decimal,-1},{0},{1023}},   {{Decimal, Hexadecimal, Nome, 0},{-2147483648},{2147483647}} }, //.wfill
    {   {{Decimal, Hexadecimal, Nome, -1},{-2147483648},{2147483647}},   {{0,-1},{0},{0}} } //.word
    };

//Verifica se um char é um número
//@param c - O caracter
//@return 1 se true, 0 se falso
int charNumerico(char c)
{
    //É número
    if(c>=48 && c <= 57)
    {
        return 1;
    }

    return 0;
}

//Verifica se um char é alfanumérico (underscore incluído)
//@param c - caracter
//@return 1 se true, 0 se falso
int charAlfanumerica(char c)
{
    //É letra
    if(c>=65 && c <= 90)
    {
        return 1;
    }

    if(c>=97 && c <= 122)
    {
        return 1;
    }

    //É _
    if(c==95)
    {
        return 1;
    }

    return charNumerico(c);
}

//Verifica se uma palavra é alfanumérica (underscore incluído)
//@param palavra - A palavra que será verificada
//@param inicio - O índice de onde deverá ser verificado
//@param fim - O último índice que deverá ser verificado
//@return 1 se true, 0 se não true 
int stringAlfanumerica(char* palavra, int inicio, int fim)
{
    for(int i = inicio; i<= fim; i++)
    {
        if(charAlfanumerica(palavra[i]) == 0)
        {
            return 0;
        }
    }

    return 1;
}

//Verifica se uma string é numérica
//@param palavra - A string
//@return 1 se true, 0 se false
int stringNumerica(char *palavra)
{
    int i = 0;

    do{

        if(charNumerico(palavra[i]) == 0)
        {
            return 0;
        }

        i += 1;
    }while(palavra[i] != '\0');

    return 1;
}

//Verifica se uma palavra é um hexadecimal
//@param palavra - A palavra
//@param tamanho - O tamanho da palavra
//@return 1 se true, 0 se false
int eHexadecimal(char* palavra, int tamanho)
{    
    //Começa com "0x"
    if(palavra[0] != '0')
    {
        return 0;
    }

    if(palavra[1] != 'x' && palavra[1] != 'X')
    {
        return 0;
    }

    

    int i = 2;
    do
    {
        
        if(charNumerico(palavra[i]) == 0)//É número?
        {
            if (!((palavra[i] >= 65 && palavra[i] <= 70) || (palavra[i] >= 97 && palavra[i] <= 102)))//É letra (A-F)
            {
                return 0;
            }
        }
        

        i += 1;
    }while(palavra[i] != '\0');

    return 1;
}

//Verifica se uma palavra é uma definição de rótulo
//@param palavra - A palavra
//@param tamanho - O tamanho da palavra
//@return 1 se true, 0 se false
int eRotulo(char* palavra, int tamanho)
{   
    //Rótulo não pode conter apenas : e NULL
    if(tamanho <= 2)
    {
        return 0;
    }

    //Rótulo não inicia com número
    if(palavra[0] >= 48 && palavra[0] <= 57)
    {
        return 0;
    }

    //Não termina com ":"
    if(palavra[tamanho-2] != ':')
    {
        return 0;
    }

    return stringAlfanumerica(palavra, 0, tamanho-3);
}

//Verifica se uma palavra é uma diretiva
//@param palavra - A palavra
//@param tamanho - O tamanho da palavra
//@return 1 se true, 0 se false
int eDiretiva(char* palavra, int tamanho)
{
    
    if(tamanho <MENOR_DIRETIVA)
    {
        return 0;
    }

    if(palavra[0] != '.')
    {
        return 0;
    }

    for(int i = 0; i<N_NOME_DIRETIVA; i++)
    {
        if(strcmp(palavra, NOME_DIRETIVA[i])== 0)
        {
            return 1;
        }
    }

    return 0;
}

//Verifica se uma palavra é uma instrução
//@param palavra - A palavra
//@param tamanho - O tamanho da palavra
//@return 1 se true, 0 se false
int eInstrucao(char* palavra, int tamanho)
{
    if(tamanho <MENOR_INSTRUCAO)
    {
        return 0;
    }


    for(int i = 0; i<N_MNEMONICO_INSTRUCAO; i++)
    {
        if(strcmp(palavra, MNEMONICO_INSTRUCAO[i])== 0)
        {
            return 1;
        }
    }

    return 0;
}

//Verifica se uma palavra é um decimal
//@param palavra - A palavra
//@param tamanho - O tamanho da palavra
//@return 1 se true, 0 se false
int eDecimal(char* palavra, int tamanho)
{
    return stringNumerica(palavra);
}

//Verifica se uma palavra é um nome
//@param palavra - A palavra
//@param tamanho - O tamanho da palavra
//@return 1 se true, 0 se false
int eNome(char* palavra, int tamanho)
{
    if(charNumerico(palavra[0]) == 1)
    {
        return 0;
    }

    return stringAlfanumerica(palavra, 0, tamanho -2);
}

//Verifica o tipo de token que uma palavra pertence
//@param palavra - A palavra
//@param tamanho - O tamanho da palavra
//@return o tipo da palavra 
TipoDoToken verificaTipo(char* palavra, int tamanho)
{

    if(eHexadecimal(palavra, tamanho) == 1)
    {
        return Hexadecimal;
    }

    if(eInstrucao(palavra, tamanho) == 1)
    {
        return Instrucao;
    }


    if(eDiretiva(palavra, tamanho) == 1)
    {
        return Diretiva;
    }


    if(eRotulo(palavra, tamanho) == 1)
    {
        return DefRotulo;
    }


    if(eDecimal(palavra,tamanho) == 1)
    {
        return Decimal;
    }


    if(eNome(palavra, tamanho) == 1)
    {
        return Nome;
    }

    return 0;
}

//Imprime um erro gramatical
//@param linha - A linha do erro
void printErroGramatical(int linha)
{
    fprintf(stderr, "ERRO GRAMATICAL: palavra na linha %d\n", linha);
}

//Procura erros gramaticais na lista de tokens
//@return 1 se houver erro, 0 se contrário
int procuraErroGramatical()
{
    
    Token* tokens[4]; //Armazena uma linha de tokens

    //Comando = diretiva ou instrução
    int linha, index, nRotulo, nComand, posComand, posRotulo;

    int i = 0;

    do
    {
        nRotulo = 0; 
        nComand = 0;
        posComand = 0; 
        posRotulo = 0;
        index = 0;

        linha = recuperaToken(i)->linha;

        //Separa uma linha de tokens
        while(recuperaToken(i)->linha == linha)
        {
            if(index == 4)
            {
                printErroGramatical(linha);
                return 1;
            }

            tokens[index] = recuperaToken(i);

            if(tokens[index]->tipo == Instrucao || tokens[index]->tipo == Diretiva)
            {
                nComand += 1;
                posComand = index;
            }
            else if(tokens[index]->tipo == DefRotulo)
            {
                nRotulo += 1;
                posRotulo = index;
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

        //Procura erros

        if(nRotulo > 1)
        {
            printErroGramatical(linha); // Mais de um rótulo
            return 1;
        }
        else if(posRotulo != 0)
        {
            printErroGramatical(linha); // Rótulo fora do começo da linha
            return 1;
        }
        else if(nComand != 0)
        {
            if(nComand > 1)
            {
                printErroGramatical(linha); // Mais de um comando (diretiva/instrução)
                return 1;
            }

            if(posComand == 0)
            {
                if(tokens[3] != NULL)
                {
                    printErroGramatical(linha); //Nenhum comando recebe mais que dois argumentos (quarta possição não nula)
                    return 1;
                }
            }
            else if(posComand> 1)
            {
                printErroGramatical(linha); //É impossível um comando na 3ª ou 4ª posição
                return 1;
            }

            if(tokens[posComand]->tipo == Instrucao)
            {
                int zeroArgumento = 0;
                for(int j = 0; j<N_INSTRUCAO_0_ARGUMENTO; j++)
                {
                    if(strcmp(tokens[posComand]->palavra, MNEMONICO_INSTRUCAO[INSTRUCAO_0_ARGUMENTO[j]]) == 0)
                    {
                        if(index-nComand-nRotulo != 0)
                        {
                            printErroGramatical(linha); //Instrução sem argumento recendo argumento
                            return 1;
                        }
                        zeroArgumento = 1;
                        break;
                    }
                }

                if(zeroArgumento == 0)
                {
                    if(tokens[posComand+1] == NULL)
                    {
                        printErroGramatical(linha);
                        return 1;    
                    }
                    else if(tokens[posComand+1]->tipo == Decimal)
                    {
                        int num = atoi(tokens[posComand+1]->palavra);

                        if(num < 0 || num > 1023)
                        {
                            printErroGramatical(linha); //Instrução com decimal fora do range
                            return 1;
                        }
                    }
                    else if(tokens[posComand+1]->tipo != Hexadecimal && tokens[posComand+1]->tipo != Nome)
                    {
                        printErroGramatical(linha); //Tipo incorreto para argumento da instrução
                        return 1;
                    }
                }

            }
            else
            { //Diretiva
                int indiceDiretiva = 0;
                for(int j = 0; j<N_NOME_DIRETIVA; j++)
                {
                    if(strcmp(tokens[posComand]->palavra, NOME_DIRETIVA[j]) == 0)
                    {
                        indiceDiretiva = j;
                    }
                }

                if(indiceDiretiva>(N_NOME_DIRETIVA-1)/2)
                {
                    indiceDiretiva -= 5;
                }


                for(int j = 1; j<=2; j++)
                {
                    TipoDoToken tipo = 0;
                    
                    if(tokens[posComand+j] != NULL)
                    {
                        tipo = tokens[posComand+j]->tipo;
                    }

                    int k = -1;
                    int correto = 0;

                    do
                    {
                        k+=1;

                        if(tipo == ARGUMENTO_DIRETIVA[indiceDiretiva][j-1].tipoToken[k])
                        {
                            if(tipo == Decimal)
                            {
                                int num = atoi(tokens[posComand+j][j-1].palavra);

                                if(num <= ARGUMENTO_DIRETIVA[indiceDiretiva][j-1].decMax[k] && num >= ARGUMENTO_DIRETIVA[indiceDiretiva][j-1].decMin[k] )
                                {
                                    correto = 1;
                                    break;
                                }
                            }
                            else
                            {
                                correto = 1;
                                break;
                            }
                            
                        }

                    } while (ARGUMENTO_DIRETIVA[indiceDiretiva][j-1].tipoToken[k] != -1);
                    
                    if(correto == 0)
                    {
                        printErroGramatical(linha); //Tipo incorreto de argumento para a diretiva
                        return 1;
                    }

                }
            }
            
        }
    }while(i<getNumberOfTokens());

    return 0;
}

/*
    ---- Você Deve implementar esta função para a parte 1.  ----
    Essa função é chamada pela main em main.c
    Entrada da função: arquivo de texto lido e seu tamanho
*/
int processarEntrada(char* entrada, unsigned tamanho)
{
    /* printf("Você deve implementar esta função para a Parte 1.\n"); */

    int inicio, //Índice do início da palavra na entrada 
        fim, //Índice do fim da palavra na entrada
        tamanhoPalavra, //Tamanho da palavra
        linha = 1; //Linha atual da entrada

    int i = 0;

    do
    {   
        //Avança enquanto não encontrar palavra
        while((entrada[i] == ' ' || entrada[i] == '\n' || entrada[i] == '\t' || entrada[i] == '\0') && i != tamanho)
        {
            if(entrada[i] == '\n')
            {
                
                linha += 1;
            }

            i += 1;
            
        }

        if(i == tamanho)
        {
            break;
        }

        //Se comentário, parte para a próxima linha
        if(entrada[i] == '#')
        {
            do
            {
                i+= 1;
            } while ((entrada[i] != '\n' && entrada[i] != '\0' )&& i != tamanho);

            continue;
        }

        inicio = i;

        //Avança até o fim da palavra
        while(!(entrada[i] == ' ' || entrada[i] == '\n' || entrada[i] == '\t' || entrada[i] == '\0'))
        {

            i += 1;

            if(i == tamanho)
            {
                break;
            }
        }
        fim = i-1;
        //Computa o tamanho e aloca espaço para a palavra
        tamanhoPalavra = (fim - inicio)+1;
       
        char* palavra = malloc(sizeof(char)*(tamanhoPalavra+1));

        //Copia a palavra
        for(int j = inicio; j<=fim; j++)
        {
            palavra[j-inicio] = entrada[j];
        }

        palavra[tamanhoPalavra] = '\0';

        TipoDoToken tipo = verificaTipo(palavra, tamanhoPalavra+1);
        
        


        if(tipo == 0)
        {
            //ERRO
            fprintf(stderr, "ERRO LEXICO: palavra inválida na linha %d!\n", linha);
            return 1;
        }
        else
        {
            adicionarToken(tipo, palavra, linha);
        }
    }while(i < tamanho);

    //Procura erros gramaticais e finaliza
    if(getNumberOfTokens() > 0)
    {
        return procuraErroGramatical();
    }
    else
    {
        return 0;
    }
    
    
    
}