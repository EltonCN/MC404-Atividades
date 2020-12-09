entrada = input().split()
x0 = int(entrada[0])
y0 = int(entrada[1])

xAtual = x0
yAtual = y0

input()

entrada = input().split()
C = int(entrada[0])
L = int(entrada[1])

input()

saida = []

for i in range(L):
    estado = 0
    xMed = 0
    
    entrada = input().split()

    for j in range(C):
        entrada[j] = int(entrada[j])

        if estado == 0:
            if entrada[j] > 0:
                estado += 1

        elif estado == 1:
            if entrada[j] < 0:
                estado += 1
                xMed = j
        
        elif estado == 2:
            if entrada[j] > 0:
                estado += 1
                xMed += j
                xMed /= 2
    
    if xMed < xAtual:
        xAtual -= 1
    elif xMed > xAtual:
        xAtual += 1

    yAtual += 1

    saida.append("POS: "+str(xAtual)+" "+str(yAtual))

for i in saida:
    print(i)

