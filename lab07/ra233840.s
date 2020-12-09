.text
  .align 1
  .globl _start

_start:  
    addi sp, sp, -64
    sw ra, 0(sp)
    sw fp, 4(sp)
    addi fp, sp, 64

    #variaveis
    #8sp = x0
    #12sp = y0
    #16sp = xAtual
    #20sp = yAtual
    #24sp = C
    #28sp = L
    #32sp = i
    #36sp = j
    #40sp = xMed
    #44sp = intLido
    #48sp = estado (0 = preParede, 1 = dentroParedeEsquerda, 2 = dentroPista, 3 = posPista)

    la a0, 8(sp)
    jal ler_int 

    la a0, 12(sp)
    jal ler_int

    jal ignora_linha

    la a0, 24(sp)
    jal ler_int

    la a0, 28(sp)
    jal ler_int

    li a0, 0
    sw a0, 32(sp)

    1:#for i = 0; i<L; i++
        lw t0, 28(sp)
        bge a0, t0, 2f

        li a0, 0
        sw a0, 40(sp) #xMed = 0
        sw a0, 48(sp) #estado = 0
        
        sw a0, 36(sp)
        3: #for j = 0; j< C; j++
            lw t0, 24(sp)
            bge a0, t0, 4f

            la a0, 44(sp)
            jal ler_int

            lw a0, 48(sp)
            lw a1, 44(sp)
            
            li t0, 0
            bne a0, t0, 5f
            ##if 48sp == 0

                beqz a1, 6f
                ##if 44sp > 0
                    addi a1, a1, 1
                    sw a1, 44(sp)
                6:
            5:
            li t0, 1
            bne a0, t0, 5f
            ##if 48sp == 1

                bnez a1, 6f
                ##if 44sp == 0
                    addi a1, a1, 1
                    sw a1, 44(sp)

                    lw t0, 36(sp)
                    sw t0, 40(sp) #xMed = j
                6:
            5:
            li t0, 2
            bne a0, t0, 5f
            ##if 48sp == 2
                
                beqz a1, 6f
                ##if 44sp > 0
                    addi a1, a1, 1
                    sw a1, 44(sp)

                    lw t0, 36(sp)
                    lw t1, 40(sp)

                    add t1, t1, t0 #xMed += j
                    srai t1, t1, 1 #xMed /= 2^1 (ou seja, xMed /= 2)
                    sw t1, 40(sp)
                6:

            5:

            lw a0, 36(sp)
            addi a0, a0, 1
            sw a0, 36(sp)
            j 3b
        4:

        lw t0, 40(sp) #t0 = xMed
        lw t1, 16(sp) #t1 = xAtual


        blt t0, t1, 5f
        ## if xMed > xAtual
            addi t1, t1, 1
            sw t1, 16(sp)
        j 6f
        5:
        bne t0, t1, 5f
        ##else if xMed == xAtual

        j 6f
        5:
        ##else (ou seja, xMed < xAtual)
            addi t1, t1, -1
            sw t1, 16(sp)
        6:

        lw t0, 20(sp) #t0 = yAtual
        addi t0, t0, 1 #yAtual += 1
        sw t0, 20(sp)

        mv a0, t1 #a0 = t1 = xAtual
        mv a1, t0 #a1 = t0 = yAtual
        jal print_resposta

        lw a0, 32(sp)
        addi a0, a0, 1
        sw a0, 32(sp)
        j 1b
    2:

    lw ra, 0(sp)
    lw fp, 4(sp)
    addi sp, sp, 64
    ret

    li a0, 0 # exit code
    li a7, 93 # syscall exit
_end:
    ecall

print_resposta: #<- (a0 = x, a1 = y)
    addi sp, sp, -16
    sw ra, 0(sp)
    sw fp, 4(sp)
    addi fp, sp, 16


    li t0, 1
    li t1, 4
    li t2, 1000
    li t3, 10
    lb a3, zero_char
    la a4, resp
    addi a4, a4, 5
    #for int i = 0; i<4; i++
    1:
        bge t0, t1, 1f

        div t4, a0, t2 #t4 = x/(10^4-i)
        add t4, t4, a3 #t4 += zero_char
        sb t4, 0(a4)

        div t4, a1, t2 #t4 = y/(10^4-i)
        add t4, t4, a3 #t4 += zero_char
        sb t4, 5(a4)

        rem a0, a0, t2
        rem a1, a1, t2
        div t2, t2, t3
        addi a4, a4, 1

        addi t0, t0, 1
        j 1b
    1:
    
    li a0, 1 # file descriptor = 1 (stdout)
    la a1, resp #  buffer
    li a2, 15 # size
    li a7, 64 # syscall write (64)
    ecall


    lw ra, 0(sp)
    lw fp, 4(sp)
    addi sp, sp, 16
    ret


ignora_linha: #le até \n
    addi sp, sp, -16
    sw ra, 0(sp)
    sw fp, 4(sp)
    addi fp, sp, 16

    la a0, 8(sp)
    jal ler_char
    lb a0, 8(sp)

    1: #do

        la a0, 8(sp)
        jal ler_char
        lb a0, 8(sp)

        lb t0, space
        beq t0, a0, 2f
        lb t0, new_line
        beq t0, a0, 2f

        j 1b

    2: #while !(12sp == " " || "\n") eq (12sp != " " && 12sp != "\n")


    lw ra, 0(sp)
    lw fp, 4(sp)
    addi sp, sp, 16
    ret

ler_int: #<-(a0 = endereço para gravar o int)
    addi sp, sp, -32
    sw ra, 0(sp)
    sw fp, 4(sp)
    addi fp, sp, 32

    sw a0, 8(sp)

    1: #do
        la a0, 12(sp)
        jal ler_char
        lb a0, 12(sp)

        lb t0, space
        beq t0, a0, 1b
        lb t0, new_line
        beq t0, a0, 1b
    #while(12sp == " " || "\n")

    sw zero, 16(sp)

    1: #do
        lw a1, 16(sp)

        #16sp *= 10
        li t0, 10
        mul a1, t0, a1

        #16sp += int(entrada)
        lb t0, zero_char
        sub a0, a0, t0
        add a1, a1, a0
        sw a1, 16(sp)

        la a0, 12(sp)
        jal ler_char
        lb a0, 12(sp)

        lb t0, space
        beq t0, a0, 2f
        lb t0, new_line
        beq t0, a0, 2f

        j 1b

    2: #while !(12sp == " " || "\n") eq (12sp != " " && "\n)
    
    lw a1, 16(sp)
    lw a0, 8(sp)
    sw a1, (a0)

    lw ra, 0(sp)
    lw fp, 4(sp)
    addi sp, sp, 32
    ret


ler_char: #<-(a0 = endereço para gravar o char) -> nada
    addi sp, sp, -16
    sw ra, 0(sp)
    sw fp, 4(sp)
    addi fp, sp, 16

    mv a1, a0 #  buffer
    li a0, 0 # file descriptor = 0 (stdin)
    li a2, 1 # size (lendo apenas 1 byte, mas tamanho é variável)
    li a7, 63 # syscall read (63)
    ecall

    lw ra, 0(sp)
    lw fp, 4(sp)
    addi sp, sp, 16
    ret

.align  4
.data

    space:
        .asciz " "
    .align 2
    
    new_line:
        .asciz "\n"
    .align 2

    zero_char:
        .asciz "0"
    .align 2

    resp:
        .asciz "POS: 0000 0000\n"
    .align 2