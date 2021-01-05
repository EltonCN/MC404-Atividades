.globl set_motor
.globl set_handbreak
.globl read_sensors
.globl read_sensor_distance
.globl get_time
.globl get_position
.globl get_rotation
.globl print_int
.globl get_pos

# Implemente aqui as funções da API_CAR.
# As funções devem checar os parametros e fazer as chamadas de sistema que serão
#   tratadas na camada SoCa

set_motor:
    addi sp, sp, -16
    sw ra, 0(sp)
    sw fp, 4(sp)
    addi fp, sp, 16

    li a7, 10
    ecall

    lw ra, 0(sp)
    lw fp, 4(sp)
    addi sp, sp, 16
    ret

set_handbreak:
    addi sp, sp, -16
    sw ra, 0(sp)
    sw fp, 4(sp)
    addi fp, sp, 16

    li a7, 11
    ecall

    lw ra, 0(sp)
    lw fp, 4(sp)
    addi sp, sp, 16
    ret
    
read_sensors:
    addi sp, sp, -16
    sw ra, 0(sp)
    sw fp, 4(sp)
    addi fp, sp, 16
    
    li a7, 12
    ecall

    lw ra, 0(sp)
    lw fp, 4(sp)
    addi sp, sp, 16
    ret

read_sensor_distance:
    addi sp, sp, -16
    sw ra, 0(sp)
    sw fp, 4(sp)
    addi fp, sp, 16

    li a7, 13
    ecall

    lw ra, 0(sp)
    lw fp, 4(sp)
    addi sp, sp, 16
    ret

get_position:
    addi sp, sp, -16
    sw ra, 0(sp)
    sw fp, 4(sp)
    addi fp, sp, 16

    li a7, 15
    ecall

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

get_rotation:
    addi sp, sp, -16
    sw ra, 0(sp)
    sw fp, 4(sp)
    addi fp, sp, 16

    li a7, 16
    ecall

    lw ra, 0(sp)
    lw fp, 4(sp)
    addi sp, sp, 16
    ret

get_time:
    addi sp, sp, -16
    sw ra, 0(sp)
    sw fp, 4(sp)
    addi fp, sp, 16

    li a7, 14
    ecall

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

    p_inicio:
        .word 679928
        .word 65422
    .align 2

    p_fim:
        .word 319486
        .word 65518
    .align 2

