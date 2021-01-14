.globl _start
.text
.align 4

int_handler:
  ###### Tratador de interrupções e syscalls ######
  # <= Implemente o tratamento da sua syscall aqui =>

  #Salva o contexto
  csrrw sp, mscratch, sp
  addi sp, sp, -64
  sw a1, 4(sp)
  sw a2, 8(sp)
  sw a3, 12(sp)
  sw a4, 16(sp)
  sw a5, 20(sp)
  sw a6, 24(sp)
  sw a7, 28(sp)
  sw t0, 32(sp)
  sw t1, 36(sp)
  sw t2, 40(sp)
  sw t3, 44(sp)
  sw t4, 48(sp)
  sw t5, 52(sp)
  sw t6, 56(sp)


  #Verifica se foi syscall

  csrr t0, mcause
  bltz t0, loop_infinito #Interrupção
  li t1, 8
  blt t0, t1, loop_infinito #Exceção não syscall



  #Executa a rotina especializada
  li t0, 10
  bne a7, t0, 1f
    jal sys_set_motor

    j 4f
  1:
  li t0, 11
  bne a7, t0, 1f
    jal sys_set_break

    j 4f
  1:
  li t0, 12
  bne a7, t0, 1f
    jal sys_read_lum

    j 4f
  1:
  li t0, 13
  bne a7, t0, 1f
    jal sys_read_ult

    j 4f
  1:
  li t0, 14
  bne a7, t0, 1f
    jal sys_get_time

    j 4f
  1:
  li t0, 15
  bne a7, t0, 1f
    jal sys_get_position

    j 4f
  1:
  li t0, 16
  bne a7, t0, 1f
    jal sys_get_rotation
  4:


  #Recupera o contexto
  csrr t0, mepc  # carrega endereço de retorno (endereço da instrução que invocou a syscall)
  addi t0, t0, 4 # soma 4 no endereço de retorno (para retornar após a ecall)
  csrw mepc, t0  # armazena endereço de retorno de volta no mepc

  lw a1, 4(sp)
  lw a2, 8(sp)
  lw a3, 12(sp)
  lw a4, 16(sp)
  lw a5, 20(sp)
  lw a6, 24(sp)
  lw a7, 28(sp)
  lw t0, 32(sp)
  lw t1, 36(sp)
  lw t2, 40(sp)
  lw t3, 44(sp)
  lw t4, 48(sp)
  lw t5, 52(sp)
  lw t6, 56(sp)
  addi sp, sp, 64
  csrrw sp, mscratch, sp
  
  mret           # Recuperar o restante do contexto (pc <- mepc)

# a0: addr do sensor que será lido 
espera_leitura:
  li t0, 1
  sb t0, 0(a0)

  1:
    lw t0, 0(a0)
    bnez t0, 1b
  
  fim_espera:
  ret

#a0: accel (-1, 0 ou 1)
#a1: steering (-127 a 127)
#ret a0: 0 em sucesso, -1 em falha (param invalido)
sys_set_motor:
  addi sp, sp, -16
  sw ra, 0(sp)
  sw fp, 4(sp)
  addi fp, sp, 16

  li t0, 1
  blt a0, t0, 1f
  li t0, -1
  bge a0, t0, 1f
    li a0, -1

    j 4f
  1:
  li t0, 127
  blt a1, t0, 1f
  li t0, -127
  bge a1, t0, 1f
    li a0, -1

    j 4f
  1:
    lw t0, addr_accel
    sw a0, 0(t0)
    lw t0, addr_steering
    sw a1, 0(t0)

    li a0, 0
  4:

  lw ra, 0(sp)
  lw fp, 4(sp)
  addi sp, sp, 16
  ret

#a0: 1 para acionar o freio
sys_set_break:
  addi sp, sp, -16
  sw ra, 0(sp)
  sw fp, 4(sp)
  addi fp, sp, 16

  lw a1, addr_break

  li t0, 1
  bne a0, t0, 1f
    sb t0, 0(a1)
    j 2f
  1:
    li t0, 0
    sb t0, 0(a1)
  2:

  lw ra, 0(sp)
  lw fp, 4(sp)
  addi sp, sp, 16
  ret

#a0: end do vetor
sys_read_lum:
  addi sp, sp, -16
  sw ra, 0(sp)
  sw fp, 4(sp)
  addi fp, sp, 16

  sw a0, 8(sp)

  lw a0, addr_set_lum
  jal espera_leitura

  lw a0, 8(sp)
  lw a1, addr_lum_vec

  li t0, 0
  li t1, 256

  1:
    bge t0, t1, 1f

    lb a2, 0(a1)
    sb a2, 0(a0)

    
    addi a0, a0, 1
    addi a1, a1, 1

    addi t0, t0, 1
    j 1b
  1:


  lw ra, 0(sp)
  lw fp, 4(sp)
  addi sp, sp, 16
  ret

#ret a0: distancia lida (-1 se detectar nada)
sys_read_ult:
  addi sp, sp, -16
  sw ra, 0(sp)
  sw fp, 4(sp)
  addi fp, sp, 16

  lw a0, addr_set_ult
  jal espera_leitura

  lw a0, addr_ult_dist

  bgez a0, 1f
    li a0, -1
    j 2f
  1:
  li t0, 200
  blt a0, t0, 2f
    li a0, -1
  2:

  lw ra, 0(sp)
  lw fp, 4(sp)
  addi sp, sp, 16
  ret

#ret a0: unsigned word, tempo do sistema
sys_get_time:
  addi sp, sp, -16
  sw ra, 0(sp)
  sw fp, 4(sp)
  addi fp, sp, 16

  lw a0, addr_set_timer
  jal espera_leitura

  lw a0, addr_timer_time
  lw a0, 0(a0)

  lw ra, 0(sp)
  lw fp, 4(sp)
  addi sp, sp, 16
  ret

#a0: end para x
#a1: end para y
#a2: end para z
sys_get_position:
  addi sp, sp, -32
  sw ra, 0(sp)
  sw fp, 4(sp)
  addi fp, sp, 32

  sw a0, 8(sp)
  sw a1, 12(sp)
  sw a2, 16(sp)

  lw a0, addr_set_gps
  jal espera_leitura

  lw a0, 8(sp)
  lw a1, 12(sp)
  lw a2, 16(sp)

  lw t0, addr_gps_x
  lw t1, addr_gps_y
  lw t2, addr_gps_z
  
  lw t0, 0(t0)
  lw t1, 0(t1)
  lw t2, 0(t2)

  sw t0, 0(a0)
  sw t1, 0(a1)
  sw t2, 0(a2)


  lw ra, 0(sp)
  lw fp, 4(sp)
  addi sp, sp, 32
  ret

#a0: end para theta_x
#a1: end para theta_y
#a2: end para theta_z
sys_get_rotation:
  addi sp, sp, -32
  sw ra, 0(sp)
  sw fp, 4(sp)
  addi fp, sp, 32

  sw a0, 8(sp)
  sw a1, 12(sp)
  sw a2, 16(sp)

  lw a0, addr_set_gps
  jal espera_leitura

  lw a0, 8(sp)
  lw a1, 12(sp)
  lw a2, 16(sp)

  lw t0, addr_gps_thetax
  lw t1, addr_gps_thetay
  lw t2, addr_gps_thetaz
  
  lw t0, 0(t0)
  lw t1, 0(t1)
  lw t2, 0(t2)

  sw t0, 0(a0)
  sw t1, 0(a1)
  sw t2, 0(a2)
  

  lw ra, 0(sp)
  lw fp, 4(sp)
  addi sp, sp, 32
  ret

_start:
    la t0, int_handler  # Carregar o endereço da rotina que tratará as syscalls
    csrw mtvec, t0      # no registrador MTVEC


    la t0, system_stack
    csrw mscratch, t0

    # Aqui você deve mudar para modo usuário, ajustar a pilha do usuário para
    # 0x7fffffc e saltar para o código de usuário (user_code)


    #Altera para o modo de usuário (mstatus.MPP = 0)
    csrr t1, mstatus
    li t2, ~0x1800
    and t1, t1, t2
    csrw mstatus, t1

    #Ajusta a pilha
    lw sp, user_stack

    #Carrega a entrada do código (mepc = &user_code)
    la t0, user_code
    csrw mepc, t0

    mret

  loop_infinito:
_end:
    j loop_infinito

test_code:
  addi sp, sp, -32
  sw ra, 0(sp)
  sw fp, 4(sp)
  addi fp, sp, 32

  inicio_leitura:

  addi a0, sp, 8
  addi a1, sp, 12
  addi a2, sp, 16

  li a7, 16
  ecall

  fim_leitura:
  j inicio_leitura

  lw ra, 0(sp)
  lw fp, 4(sp)
  addi sp, sp, 32
  ret

### BSS  #############################################################################
.align 2
.bss

system_stack_end:
  .skip 128
system_stack:

vetor:
  .skip 500


### DATA #############################################################################
.align 2
.data

user_stack:
  .word 0x7fffffc
  
##Coisas do carro
# registradores set (byte): colocar 1 para iniciar a leitura, quando voltar para 0 a leitura está pronta

addr_set_gps:
  .word 0xFFFF0100
addr_gps_thetax:
  .word 0xFFFF0104 #word
addr_gps_thetay:
  .word 0xFFFF0108 #word
addr_gps_thetaz:
  .word 0xFFFF010C #word
addr_gps_x:
  .word 0xFFFF0110 #word, E-1 m
addr_gps_y:
  .word 0xFFFF0114 #word, E-1 m
addr_gps_z:
  .word 0xFFFF0118 #word, E-1 m

addr_set_ult:
  .word 0xFFFF0102
addr_ult_dist:
  .word 0xFFFF011C  #word, E-2 m

addr_set_lum:
  .word 0xFFFF0101
addr_lum_vec:
  .word 0xFFFF0124 #vetor de 256 bytes iniciando nesse endereço, preto = 0, branco = 255

addr_accel:
  .word 0xFFFF0121 #byte, 1 = frente, -1 = trás
addr_break:
  .word 0xFFFF0122 #byte, 1 = freia
addr_steering:
  .word 0xFFFF0120 #byte, + = direita

##Coisas do timer
addr_set_timer:
  .word 0xFFFF0300
addr_timer_time:
  .word 0xFFFF0304 #tempo do sistema em ms
