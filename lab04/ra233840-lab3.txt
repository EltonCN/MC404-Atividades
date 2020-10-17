# Constantes -------------------------

# Instruções -------------------------
.org 0x000

laco:

    #Atualiza o endereço dos vetores
    LOAD M(vet1)
    ADD M(i)
    STA M(loadvet1)
    
    LOAD M(vet2)
    ADD M(i)
    STA M(multvet2)
    
    
    #Calcula do produto vet1[i]*vet2[i]
    
    loadvet1:
        LOAD MQ, M(0x000)
        
    multvet2:
        MUL M(0x000)
    
    LOAD MQ
    ADD M(result)
    STOR M(result)
    
    #Atualiza o laço
    LOAD M(i)
    ADD M(n_1)
    STOR M(i)
    
    LOAD M(tam)
    SUB M(i)
    JUMP+ M(laco)
    
LOAD M(result)
JUMP M(0x400)
    
    




# Dados ------------------------------

#Variáveis
.org 0x050
    
    i:
        .word 0x0000000000
    
    result:
        .word 0x0000000000
    

#Constantes
    n_1:
        .word 0x0000000001
    

#Entrada
.org 0x3FD
    tam:
        .skip 0x001
    vet1:
        .skip 0x001
    vet2:
        .skip 0x001