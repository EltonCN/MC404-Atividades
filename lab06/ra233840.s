.text
  .align 1
  .globl _start

_start:  
  # Converte angulo inteiro para radianos e coloca em f0
  jal funcao_pegar_angulo
  # Utilizado para calcular a série
  jal funcao_calcula_serie
  # Transforma um PF para inteiro, onde a0 contem o sinal, a1 a parte inteira e a2 a parte fracionaria (truncada com 3 casas decimais)
  jal funcao_float_para_inteiro
  # Imprime o resultado de a0, a1 e a2 na tela
  jal funcao_imprime
  
  li a0, 0 # exit code
  li a7, 93 # syscall exit
_end:
  ecall
  
funcao_calcula_serie:
  addi sp, sp, -32
  sw ra, 0(sp)
  sw s0, 4(sp)
  addi s0, sp, 32
  
  # Neste ponto o registrador f0 contem o valor de angle em radianos
  # *********************************************
  # ** INSIRA AQUI SEU CÓDIGO PARA CÁLCULO DA SERIE **
  # *********************************************

    fcvt.s.w f1, zero

    #for(int a0 = 0; a0<a1=10; a0++)
    li a1, 10
    li a0, 0
    1:
        bge a0, a1, 2f

        # a2 = (2*a0) + 1
        li a2, 2
        mul a2, a2, a0
        addi a2, a2, 1

        sw a0, 8(sp)
        sw a1, 12(sp)
        sw a2, 16(sp)

        addi a0, a2, 0
        jal funcao_pow

        lw a0, 16(sp)
        jal funcao_fat

        fcvt.s.w f3, a0

        lw a0, 8(sp)
        lw a1, 12(sp)

        fdiv.s f4, f4, f3

        li t0, 2
        rem a2, a0, t0


        bne a2, zero, 3f
            fadd.s f1, f1, f4
        j 4f
        3:
            fsub.s f1, f1, f4
        4:

    fim_laco:

        addi a0, a0, 1
        j 1b
    2:

    fcvt.s.w f2, zero

    fadd.s f0, f1, f2

  lw ra, 0(sp)
  lw s0, 4(sp)
  addi sp, sp, 32
  jr ra


funcao_imprime:
  addi sp, sp, -8
  sw ra, 0(sp)
  sw s0, 4(sp)
  addi s0, sp, 8
  
  # Neste ponto os registradores contem:
  #   a0 -> valor 0 se f0 for negativo e !=0 caso contratio
  #   a1 -> Parte inteira de f0
  #   a2 -> Parte fracionaria de f0 (truncada com 3 casas decimais, i.e. 0 a 999)
  # **************************************
  # ** INSIRA AQUI SEU CÓDIGO PARA IMPRESSÃO **
  # **************************************
    lb a3, zero_code
    la a5, string

    #Coloca o sinal
    bne a0, zero, 1f
        lb t0, plus_code
        sb t0, 6(a5)
    1:

    #Coloca a parte inteira
    bne a1, zero, 1f
        lb t0, zero_code
        sb a3, 7(a5)
    1:

    #Altera os digitos fracionarios


    li t0, 100
    div a4, a2, t0
    add a4, a4, a3
    sb a4, 9(a5)
    rem a2, a2, t0

    li t0, 10
    div a4, a2, t0
    add a4, a4, a3
    sb a4, 10(a5)
    rem a2, a2, t0

    add a2, a2, a3
    sb a2, 11(a5)

    li a0, 1 # file descriptor = 1 (stdout)
    la a1, string #  buffer
    li a2, 13 # size
    li a7, 64 # syscall write (64)
    ecall


  lw ra, 0(sp)
  lw s0, 4(sp)
  addi sp, sp, 8
  jr ra

funcao_fat: #Calcula o fatorial de a0 e retorna em a0
    li t1, 0
    bne a0, t1, 1f # se a0!=0, salta o laço 
        li a0, 1
        ret

    1:

    addi sp, sp, -16
    sw ra, 0(sp)
    sw a0, 4(sp)
    sw s0, 8(sp)
    addi s0, sp, 16

    addi a1, a0, -1

    addi a0, a1, 0

    jal funcao_fat

    lw a1, 4(sp)

    mul a0, a0, a1

    lw ra, 0(sp)
    lw s0, 8(sp)
    addi sp, sp, 16
    ret

funcao_pow: #Calcula f0 elevado a a0 e retorna em f4
    li a1, 1
    fcvt.s.w f5, a1

    #for(int i = 0; i<a0; i++)
    li a1, 0
    1:
        bge a1, a0, 2f

        fmul.s f5, f0, f5

        addi a1, a1, 1
        j 1b
    2:

    #Transfere o resultado de f1 para f0
    li a1, 0
    fcvt.s.w f4, a1
    fadd.s f4, f4, f5

    ret


funcao_pegar_angulo:
  addi sp, sp, -8
  sw ra, 0(sp)
  sw s0, 4(sp)
  addi s0, sp, 8
  
  # load angle value to a0
  lw a0, angle
  # convert angle to float and put in f0
  fcvt.s.w f0, a0
  # load pi address to a0
  la a0, .float_pi
  # load float_pi value (from a0 address) into f1
  flw f1, 0(a0)
  # load value 180 into a0
  li a0, 180
  # convert 180 to float and put in f2
  fcvt.s.w f2, a0

  # f0 -> angle, f1 -> pi, f2 -> 180
  # Now, put angle in radians (angle*pi/180)
  # f0 = angle * pi
  fmul.s f0, f0, f1
  # f0 = f0 / 180
  fdiv.s f0, f0, f2
  
  lw ra, 0(sp)
  lw s0, 4(sp)
  addi sp, sp, 8
  jr ra
  
funcao_float_para_inteiro:
  addi sp, sp, -8
  sw ra, 0(sp)
  sw s0, 4(sp)
  addi s0, sp, 8
  
  # Get signal
  li a0, 0
  fcvt.s.w f1, a0
  flt.s a0, f0, f1
  
  # Drop float signal
  fabs.s f0, f0
  
  # Truncate integer part
  fcvt.s.w f1, a0
  fadd.s f1, f1, f0
  jal funcao_truncar_float
  fcvt.w.s a1, f0
  
  # Truncate float part with 3 decimal places
  fsub.s f1, f1, f0
  li a3, 1000
  fcvt.s.w f2, a3
  fmul.s f0, f1, f2
  jal funcao_truncar_float
  fcvt.w.s a2, f0
  li a3, 1000
  rem a2, a2, a3
  
  lw ra, 0(sp)
  lw s0, 4(sp)
  addi sp, sp, 8
  jr ra
  
funcao_truncar_float:
  addi sp, sp, -8
  sw ra, 0(sp)
  sw s0, 4(sp)
  addi s0, sp, 8
  
  fmv.x.w a5, f0
  li a3, 22
  srai a4, a5,0x17
  andi a4, a4, 255
  addi a4, a4, -127
  addi a2, a5, 0
  blt a3, a4, .funcao_truncar_float_continue
  lui a5, 0x80000
  and a5, a5, a2
  bltz a4, .funcao_truncar_float_continue
  lui a5, 0x800
  addi a5, a5, -1
  sra a5, a5, a4
  not a5, a5
  and a5, a5, a2
.funcao_truncar_float_continue:
  fmv.w.x f0, a5
  
  lw ra, 0(sp)
  lw s0, 4(sp)
  addi sp, sp, 8
  jr ra
  
  
# Additional data variables
.align  4
.data
    angle:
        .word 45
    .float_pi:
        .word 0x40490fdb
    
    
    plus_code:
        .asciz "+"
    .align 2

    one_code:
        .asciz "1"
    .align 2

    zero_code:
        .asciz "0"
    .align 2

    string:
        .asciz "SENO: -0.000\n"
        #sinal = 6(string) 
        #inteiro = 7(string)