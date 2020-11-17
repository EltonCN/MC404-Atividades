#ifndef SIMBOLO_H
#define SIMBOLO_H

#define MAX_SIMBOLO 1023
#define ESQ 0
#define DIR 1


/**
 * @brief Armazena dados de um símbolo da tabela de símbolos
 * 
 */
typedef struct Simbolo
{
    int linha;
    int lado; //0 = ESQ, 1 = DIR
    char* nome;
} Simbolo;

/**
 * @brief Adiciona um símbolo a tabela de símbolos
 * 
 * @param nome Nome do símbolo
 * @param linha Linha ou valor do símbolo
 * @param lado Lado do símbolo (se rótulo)
 * @param tipo Tipo do símbolo (DefRotulo ou outro)
 */
void adicionaSimbolo(char* nome, int linha, int lado, int tipo);

/**
 * @brief Retorna o número de símbolos na lista
 * 
 * @return int Número de símbolos na lista
 */
int getNSimbolo();

/**
 * @brief Retorna o símbolo a partir de um nome
 * 
 * @param nome Nome do símbolo procurado
 * @return Simbolo* Símbolo (NULL se não existir)
 */
Simbolo* getSimbolo(char* nome);

/**
 * @brief Imprime a tabela de símbolos
 * 
 */
void imprimeTabela();

#endif