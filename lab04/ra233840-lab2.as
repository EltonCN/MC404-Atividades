# Constantes -------------------------
.set G, 0x000000000A
.set N, 0x000000000A

# Instruções -------------------------
.org 0x000

#Calcula y
LOAD MQ, M(g)
MUL M(x)
LOAD MQ
STOR M(y)

#Calcula k_0 (y está em AC)
RSH
STOR M(k)

#Calcula k_i, i=1, ..., 10
laco:

    #Computa k_i
    LOAD M(y)
    DIV M(k)
    LOAD MQ
    ADD M(k)
    RSH
    STOR M(k)
    
    #Atualiza o laço
    LOAD M(i)
    ADD M(n_1)
    STOR M(i)
    LOAD M(n)
    SUB M(i)
    JUMP+ M(laco)
#FIM DO LAÇO1

#Coloca o resultado em AC e finaliza
LOAD M(k)
JUMP M(0x400)





# Dados ------------------------------
#Entrada
.org 0x110
    x:
        .word 0x0000000DAC

#Variáveis
.org 0x200
    i: 
        .word 0x0000000000
    y:
        .skip 0x01
    k:
        .skip 0x01

#Constantes
    g:
        .word G
    n:
        .word N
    n_1:
        .word 0x0000000001
        