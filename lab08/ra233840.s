#EltonCN 233840 EngComp
#IC MC404 2s2021
#lab08

.text
  .align 1
  .globl _start
_start: #main  
    addi sp, sp, -64
    sw ra, 0(sp)
    sw fp, 4(sp)
    addi fp, sp, 64

    #Variaveis
    #
    #Vetor posicao
    #8(sp) = x
    #12(sp) = y
    #
    #Vetor ultima_posicao
    #16(sp) = x
    #20(sp) = y
    #
    #Vetor velocidade
    #24(sp) = x
    #28(sp) = y

    #Inicializa os vetores
    jal get_deltat
    mv a0, sp
    addi a0, a0, 8
    jal get_pos
    mv a0, sp
    addi a0, a0, 8
    mv a1, sp
    addi a1, a1, 16
    jal copia_vetor
    sw zero, 24(sp)
    sw zero, 28(sp)

    li a2, 0
    li a3, 1000000
    1:
        bge a2, a3, 1f

        sw a2, 32(sp)
        sw a3, 36(sp)

        mv a0, sp
        addi a0, a0, 8
        jal get_pos

        mv a0, sp
        addi a0, a0, 8
        mv a1, sp
        addi a1, a1, 16
        mv a2, sp
        addi a2, a2, 24
        jal sub_vetor

        /*mv a0, sp
        addi a0, a0, 24
        mv a2, a0
        li a1, 1000
        jal multiplica_vetor

        jal get_deltat
        mv a1, a0
        mv a0, sp
        addi a0, a0, 24
        mv a2, a0
        jal divide_vetor*/

        lw a0, 24(sp)
        lw a1, 28(sp)
        jal norma
        sw a0, 32(sp)
        jal print_int

        lw a0, 32(sp)

        li a1, 4096

        sub a0, a1, a0

        bgtz a0, 2f
            li a1, 1 

            j 3f
        2:
            li a1, -1 
        3:

        sw a1, 32(sp)
        mv a0, a1
        jal print_int

        li a0, 1000
        li a2, 0
        li a7, 2100
        ecall

        mv a0, sp
        addi a0, a0, 8
        mv a1, sp
        addi a1, a1, 16
        jal copia_vetor


        lw a2, 32(sp)
        lw a3, 36(sp)

        addi a2, a2, 1
        j 1b
    1:

    lw ra, 0(sp)
    lw fp, 4(sp)
    addi sp, sp, 64

    li a0, 0 # exit code
    li a7, 93 # syscall exit
_end:
    ecall


delay:
     li a2, 0
    li a3, 500000
    2:
        bge a2, a3, 2f

        addi a2, a2, 1
        j 2b
    2:

#a0 = &v
#a1 = divisor
#a2 = &result
divide_vetor:
    addi sp, sp, -16
    sw ra, 0(sp)
    sw fp, 4(sp)
    addi fp, sp, 16

    lw t0, 0(a0)
    div t0, t0, a1
    sw t0, 0(a2)

    lw t0, 4(a0)
    div t0, t0, a1
    sw t0, 4(a2)

    lw ra, 0(sp)
    lw fp, 4(sp)
    addi sp, sp, 16
    ret

#a0 = &v
#a1 = multiplicador
#a2 = &result
multiplica_vetor:
    addi sp, sp, -16
    sw ra, 0(sp)
    sw fp, 4(sp)
    addi fp, sp, 16

    lw t0, 0(a0)
    mul t0, t0, a1
    sw t0, 0(a2)

    lw t0, 4(a0)
    mul t0, t0, a1
    sw t0, 4(a2)

    lw ra, 0(sp)
    lw fp, 4(sp)
    addi sp, sp, 16
    ret

# a0 = &vetor_antigo
# a1 = &vetor_novo
copia_vetor:
    addi sp, sp, -16
    sw ra, 0(sp)
    sw fp, 4(sp)
    addi fp, sp, 16

    lw t0, 0(a0)
    sw t0, 0(a1)

    lw t0, 4(a0)
    sw t0, 4(a1)

    lw ra, 0(sp)
    lw fp, 4(sp)
    addi sp, sp, 16
    ret

teste:
    addi sp, sp, -32
    sw ra, 0(sp)
    sw fp, 4(sp)
    addi fp, sp, 32

    sw zero, 8(sp)
    sw zero, 12(sp)
    sw zero, 16(sp)
    sw zero, 20(sp)
    sw zero, 24(sp)
    sw zero, 28(sp)

    mv a0, sp
    addi a0, a0, 8
    li a1, 0
    li a7, 169
    ecall
    lw a0, 8(sp) #sec
    jal print_int
    lw a0, 12(sp)
    jal print_int
    lw a0, 16(sp) #micro_sec
    jal print_int
    lw a0, 20(sp)
    jal print_int
    lw a0, 24(sp)
    jal print_int
    lw a0, 28(sp)
    jal print_int

    lw ra, 0(sp)
    lw fp, 4(sp)
    addi sp, sp, 32
    ret

get_deltat: #-> a0 = deltaT em us entra esse e a ultima chamada da funcao
    addi sp, sp, -32
    sw ra, 0(sp)
    sw fp, 4(sp)
    addi fp, sp, 32


    mv a0, sp
    addi a0, a0, 8
    li a1, 0
    li a7, 169
    ecall

    lw a1, 8(sp) #sec
    lw a2, 16(sp) #us

    lw t1, last_sec
    lw t2, last_us

    la a0, last_sec
    sw a1, 0(a0) 
    la a0, last_us
    sw a2, 0(a0) 

    li a0, 0

    beq t1, zero, 1f
        sub a1, a1, t1 #sec -= last_sec
        sub a2, a2, t2 #us -= last_us

        li t0, 1000
        mul a1, a1, t0 #sec *= 1E6
        div a2, a2, t0
        add a1, a1, a2 #sec += us

        mv a0, a1

    1:

    lw ra, 0(sp)
    lw fp, 4(sp)
    addi sp, sp, 32
    ret

# vetor = (int x; int y;)
# a0 = &v0
# a1 = &v1
# a2 = &result
# escreve em result v0 - v1
sub_vetor:
    addi sp, sp, -16
    sw ra, 0(sp)
    sw fp, 4(sp)
    addi fp, sp, 16

    lw t0, 0(a0) #x0
    lw t1, 0(a1) #x1
    sub t0, t0, t1
    sw t0, 0(a2)

    lw t0, 4(a0) #y0
    lw t1, 4(a1) #y1
    sub t0, t0, t1
    sw t0, 4(a2)

    lw ra, 0(sp)
    lw fp, 4(sp)
    addi sp, sp, 16
    ret

get_pos:#<- a0 = apontador para estrutura posicao(int x; int z;)
    addi sp, sp, -16
    sw ra, 0(sp)
    sw fp, 4(sp)
    addi fp, sp, 16

    sw a0, 8(sp)

    li a7, 2101
    ecall

    mv a1, a0
    srli a1, a1, 4 #a1 = x
    li t0, 65535
    and a0, a0, t0 #a0 = z

    lw a2, 8(sp) #a2 = &posicao

    sw a1, 0(a2) #posicao.x = x
    sw a0, 4(a2) #posicao.z = z

    lw ra, 0(sp)
    lw fp, 4(sp)
    addi sp, sp, 16
    ret


norma: #<- (a0 = x, a1 = y). -> a0 = norma
    addi sp, sp, -16
    sw ra, 0(sp)
    sw fp, 4(sp)
    addi fp, sp, 16

    mul a0, a0, a0 # x = x^2
    mul a1, a1, a1 # y = y^2

    add a0, a0, a1 # a0 = x^2 + y^2

    mv a1, a0 #a1 = a0 = aproximacao da raiz
    srai a1, a1, 1

    li a2, 0
    li a3, 1
    li a4, -1
    1:
        sub t0, a1, a2
        
        bge t0, a3, 2f #sqrt-sqrt_ant >= 1
        blt t0, a4, 2f #sqrt-sqrt_ant < -1
        j 1f

        2:
        mv a2, a1
        div t0, a0, a1
        add a1, a1, t0
        srai a1, a1, 1
        
        j 1b
    1:

    mv a0, a1

    lw ra, 0(sp)
    lw fp, 4(sp)
    addi sp, sp, 16
    ret


print_int: #<- (a0 = int)
    addi sp, sp, -32
    sw ra, 0(sp)
    sw fp, 4(sp)
    addi fp, sp, 32


    mv a4, sp
    addi a4, a4, 8

    blt a0, zero, 2f
        lb a3, plus #a0>0
        sb a3, 0(a4)
    2:
    bge a0, zero, 2f 
        lb a3, minus #a0<0
        sb a3, 0(a4)

        li t0, -1
        mul a0, t0, a0
    2:

    addi a4, a4, 1

    li t0, 0
    li t1, 10
    li t2, 1000000000
    li t3, 10
    lb a3, zero_char
    
    #for int i = 0; i<4; i++
    1:
        bge t0, t1, 1f

        div t4, a0, t2 #t4 = x/(10^4-i)
        add t4, t4, a3 #t4 += zero_char
        sb t4, 0(a4)

        rem a0, a0, t2
        rem a1, a1, t2
        div t2, t2, t3
        addi a4, a4, 1

        addi t0, t0, 1
        j 1b
    1:

    lb a3, new_line
    sb a3, 19(sp)

    #buffer
    mv a1, sp
    addi a1, a1, 8
    
    li a0, 1 # file descriptor = 1 (stdout)
    li a2, 12 # size
    li a7, 64 # syscall write (64)
    ecall


    lw ra, 0(sp)
    lw fp, 4(sp)
    addi sp, sp, 32
    ret


.align  4
.data
    space:
        .asciz " "
    .align 2
    
    new_line:
        .asciz "\n"
    .align 2

    minus:
        .asciz "-"
    .align 2

    plus:
        .asciz "+"
    .align 2

    zero_char:
        .asciz "0"
    .align 2

    last_sec:
        .word 0
    .align 2

    last_us:
        .word 0
    .align 2