	.text
	.file	"loco.c"
	.file	1 "/mnt/c/Users/Elton/Documents/GitHub/MC404/Trabalho 02/src2" "loco.c"
	.globl	delay                   # -- Begin function delay
	.p2align	1
	.type	delay,@function
delay:                                  # @delay
.Lfunc_begin0:
	.loc	1 20 0                  # loco.c:20:0
	.cfi_sections .debug_frame
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 16
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
.Ltmp0:
	.loc	1 21 25 prologue_end    # loco.c:21:25
	call	get_time
	.loc	1 21 18 is_stmt 0       # loco.c:21:18
	sw	a0, -16(s0)
	.loc	1 23 5 is_stmt 1        # loco.c:23:5
	j	.LBB0_1
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
.Ltmp1:
	.loc	1 25 5                  # loco.c:25:5
	j	.LBB0_2
.Ltmp2:
.LBB0_2:                                #   in Loop: Header=BB0_1 Depth=1
	.loc	1 25 14 is_stmt 0       # loco.c:25:14
	call	get_time
	.loc	1 25 25                 # loco.c:25:25
	lw	a1, -16(s0)
	.loc	1 25 24                 # loco.c:25:24
	sub	a0, a0, a1
	.loc	1 25 32                 # loco.c:25:32
	lw	a1, -12(s0)
.Ltmp3:
	.loc	1 25 5                  # loco.c:25:5
	bltu	a0, a1, .LBB0_1
	j	.LBB0_3
.Ltmp4:
.LBB0_3:
	.loc	1 26 1 is_stmt 1        # loco.c:26:1
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Ltmp5:
.Lfunc_end0:
	.size	delay, .Lfunc_end0-delay
	.cfi_endproc
                                        # -- End function
	.globl	delayMotor              # -- Begin function delayMotor
	.p2align	1
	.type	delayMotor,@function
delayMotor:                             # @delayMotor
.Lfunc_begin1:
	.loc	1 36 0                  # loco.c:36:0
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
.Ltmp6:
	.loc	1 37 25 prologue_end    # loco.c:37:25
	call	get_time
	.loc	1 37 18 is_stmt 0       # loco.c:37:18
	sw	a0, -24(s0)
	.loc	1 39 5 is_stmt 1        # loco.c:39:5
	j	.LBB1_1
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
.Ltmp7:
	.loc	1 41 19                 # loco.c:41:19
	lbu	a0, -16(s0)
	.loc	1 41 26 is_stmt 0       # loco.c:41:26
	lbu	a1, -20(s0)
	.loc	1 41 9                  # loco.c:41:9
	call	set_motor
	.loc	1 42 5 is_stmt 1        # loco.c:42:5
	j	.LBB1_2
.Ltmp8:
.LBB1_2:                                #   in Loop: Header=BB1_1 Depth=1
	.loc	1 42 14 is_stmt 0       # loco.c:42:14
	call	get_time
	.loc	1 42 25                 # loco.c:42:25
	lw	a1, -24(s0)
	.loc	1 42 24                 # loco.c:42:24
	sub	a0, a0, a1
	.loc	1 42 32                 # loco.c:42:32
	lw	a1, -12(s0)
.Ltmp9:
	.loc	1 42 5                  # loco.c:42:5
	bltu	a0, a1, .LBB1_1
	j	.LBB1_3
.Ltmp10:
.LBB1_3:
	.loc	1 43 1 is_stmt 1        # loco.c:43:1
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Ltmp11:
.Lfunc_end1:
	.size	delayMotor, .Lfunc_end1-delayMotor
	.cfi_endproc
                                        # -- End function
	.globl	set_motor_contr         # -- Begin function set_motor_contr
	.p2align	1
	.type	set_motor_contr,@function
set_motor_contr:                        # @set_motor_contr
.Lfunc_begin2:
	.loc	1 49 0                  # loco.c:49:0
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 16
	.cfi_def_cfa s0, 0
	add	a1, zero, a0
	sb	a0, -9(s0)
.Ltmp12:
	.loc	1 50 20 prologue_end    # loco.c:50:20
	sw	a1, -16(s0)
	call	get_time
	.loc	1 50 18 is_stmt 0       # loco.c:50:18
	lui	a1, %hi(timeCtrAtual)
	sw	a0, %lo(timeCtrAtual)(a1)
.Ltmp13:
	.loc	1 52 8 is_stmt 1        # loco.c:52:8
	lw	a0, %lo(timeCtrAtual)(a1)
	.loc	1 52 23 is_stmt 0       # loco.c:52:23
	lui	a1, %hi(timeCtrInicio)
	lw	a1, %lo(timeCtrInicio)(a1)
	.loc	1 52 21                 # loco.c:52:21
	sub	a0, a0, a1
	addi	a1, zero, 599
.Ltmp14:
	.loc	1 52 8                  # loco.c:52:8
	bltu	a1, a0, .LBB2_2
	j	.LBB2_1
.LBB2_1:
.Ltmp15:
	.loc	1 54 22 is_stmt 1       # loco.c:54:22
	lbu	a1, -9(s0)
	addi	a0, zero, 1
	.loc	1 54 9 is_stmt 0        # loco.c:54:9
	call	set_motor
	.loc	1 55 5 is_stmt 1        # loco.c:55:5
	j	.LBB2_6
.Ltmp16:
.LBB2_2:
	.loc	1 56 14                 # loco.c:56:14
	lui	a0, %hi(timeCtrAtual)
	lw	a0, %lo(timeCtrAtual)(a0)
	.loc	1 56 29 is_stmt 0       # loco.c:56:29
	lui	a1, %hi(timeCtrInicio)
	lw	a1, %lo(timeCtrInicio)(a1)
	.loc	1 56 27                 # loco.c:56:27
	sub	a0, a0, a1
	addi	a1, zero, 999
.Ltmp17:
	.loc	1 56 14                 # loco.c:56:14
	bltu	a1, a0, .LBB2_4
	j	.LBB2_3
.LBB2_3:
.Ltmp18:
	.loc	1 58 22 is_stmt 1       # loco.c:58:22
	lbu	a1, -9(s0)
	mv	a0, zero
	.loc	1 58 9 is_stmt 0        # loco.c:58:9
	call	set_motor
	.loc	1 59 5 is_stmt 1        # loco.c:59:5
	j	.LBB2_5
.Ltmp19:
.LBB2_4:
	.loc	1 62 25                 # loco.c:62:25
	lui	a0, %hi(timeCtrAtual)
	lw	a0, %lo(timeCtrAtual)(a0)
	.loc	1 62 23 is_stmt 0       # loco.c:62:23
	lui	a1, %hi(timeCtrInicio)
	sw	a0, %lo(timeCtrInicio)(a1)
	.loc	1 63 22 is_stmt 1       # loco.c:63:22
	lbu	a1, -9(s0)
	addi	a0, zero, 1
	.loc	1 63 9 is_stmt 0        # loco.c:63:9
	call	set_motor
	j	.LBB2_5
.Ltmp20:
.LBB2_5:
	.loc	1 0 9                   # loco.c:0:9
	j	.LBB2_6
.LBB2_6:
	.loc	1 65 1 is_stmt 1        # loco.c:65:1
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Ltmp21:
.Lfunc_end2:
	.size	set_motor_contr, .Lfunc_end2-set_motor_contr
	.cfi_endproc
                                        # -- End function
	.section	.sdata,"aw",@progbits
	.p2align	2               # -- Begin function seguePista
.LCPI3_0:
	.word	1067030938              # float 1.20000005
.LCPI3_1:
	.word	1056964608              # float 0.5
	.text
	.globl	seguePista
	.p2align	1
	.type	seguePista,@function
seguePista:                             # @seguePista
.Lfunc_begin3:
	.loc	1 92 0                  # loco.c:92:0
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -1072
	.cfi_def_cfa_offset 1072
	sw	ra, 1068(sp)
	sw	s0, 1064(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 1072
	.cfi_def_cfa s0, 0
	addi	a0, zero, 128
.Ltmp22:
	.loc	1 93 9 prologue_end     # loco.c:93:9
	sw	a0, -16(s0)
	mv	a0, zero
	.loc	1 94 9                  # loco.c:94:9
	sw	a0, -20(s0)
	.loc	1 100 5                 # loco.c:100:5
	lui	a1, %hi(lum)
	addi	a1, a1, %lo(lum)
	sw	a0, -1068(s0)
	add	a0, zero, a1
	call	read_sensors
	.loc	1 102 25                # loco.c:102:25
	lw	a0, -16(s0)
	.loc	1 102 9 is_stmt 0       # loco.c:102:9
	sw	a0, -1048(s0)
	.loc	1 103 12 is_stmt 1      # loco.c:103:12
	lw	a0, -1068(s0)
	sw	a0, -16(s0)
	.loc	1 105 9                 # loco.c:105:9
	sw	a0, -1052(s0)
.Ltmp23:
	.loc	1 107 13                # loco.c:107:13
	sw	a0, -1056(s0)
	.loc	1 107 9 is_stmt 0       # loco.c:107:9
	j	.LBB3_1
.LBB3_1:                                # =>This Inner Loop Header: Depth=1
.Ltmp24:
	.loc	1 107 20                # loco.c:107:20
	lw	a0, -1056(s0)
	addi	a1, zero, 255
.Ltmp25:
	.loc	1 107 5                 # loco.c:107:5
	blt	a1, a0, .LBB3_7
	j	.LBB3_2
.LBB3_2:                                #   in Loop: Header=BB3_1 Depth=1
.Ltmp26:
	.loc	1 109 16 is_stmt 1      # loco.c:109:16
	lw	a0, -1056(s0)
	.loc	1 109 12 is_stmt 0      # loco.c:109:12
	lui	a1, %hi(lum)
	addi	a1, a1, %lo(lum)
	add	a0, a0, a1
	lbu	a0, 0(a0)
	addi	a1, zero, 126
	.loc	1 109 23                # loco.c:109:23
	blt	a0, a1, .LBB3_5
	j	.LBB3_3
.LBB3_3:                                #   in Loop: Header=BB3_1 Depth=1
	.loc	1 109 30                # loco.c:109:30
	lw	a0, -1056(s0)
	.loc	1 109 26                # loco.c:109:26
	lui	a1, %hi(lum)
	addi	a1, a1, %lo(lum)
	add	a0, a0, a1
	lbu	a0, 0(a0)
	addi	a1, zero, 149
.Ltmp27:
	.loc	1 109 12                # loco.c:109:12
	blt	a1, a0, .LBB3_5
	j	.LBB3_4
.LBB3_4:                                #   in Loop: Header=BB3_1 Depth=1
.Ltmp28:
	.loc	1 111 31 is_stmt 1      # loco.c:111:31
	lw	a0, -1056(s0)
	.loc	1 111 20 is_stmt 0      # loco.c:111:20
	lw	a1, -1052(s0)
	.loc	1 111 13                # loco.c:111:13
	slli	a1, a1, 2
	addi	a2, s0, -1044
	add	a1, a1, a2
	.loc	1 111 29                # loco.c:111:29
	sw	a0, 0(a1)
	.loc	1 112 21 is_stmt 1      # loco.c:112:21
	lw	a0, -1052(s0)
	addi	a0, a0, 1
	sw	a0, -1052(s0)
	.loc	1 113 9                 # loco.c:113:9
	j	.LBB3_5
.Ltmp29:
.LBB3_5:                                #   in Loop: Header=BB3_1 Depth=1
	.loc	1 114 5                 # loco.c:114:5
	j	.LBB3_6
.Ltmp30:
.LBB3_6:                                #   in Loop: Header=BB3_1 Depth=1
	.loc	1 107 28                # loco.c:107:28
	lw	a0, -1056(s0)
	addi	a0, a0, 1
	sw	a0, -1056(s0)
	.loc	1 107 5 is_stmt 0       # loco.c:107:5
	j	.LBB3_1
.Ltmp31:
.LBB3_7:
	.loc	1 116 8 is_stmt 1       # loco.c:116:8
	lw	a0, -1052(s0)
	addi	a1, zero, 26
.Ltmp32:
	.loc	1 116 8 is_stmt 0       # loco.c:116:8
	blt	a0, a1, .LBB3_9
	j	.LBB3_8
.LBB3_8:
.Ltmp33:
	.loc	1 118 19 is_stmt 1      # loco.c:118:19
	lw	a0, -1052(s0)
	.loc	1 118 16 is_stmt 0      # loco.c:118:16
	lw	a1, -16(s0)
	div	a0, a1, a0
	sw	a0, -16(s0)
	.loc	1 120 31 is_stmt 1      # loco.c:120:31
	lw	a0, -1052(s0)
	.loc	1 120 38 is_stmt 0      # loco.c:120:38
	srli	a1, a0, 31
	add	a0, a0, a1
	.loc	1 120 18                # loco.c:120:18
	slli	a0, a0, 1
	.loc	1 120 38                # loco.c:120:38
	andi	a0, a0, -4
	addi	a1, s0, -1044
	.loc	1 120 18                # loco.c:120:18
	add	a0, a0, a1
	lw	a0, 0(a0)
	.loc	1 120 16                # loco.c:120:16
	sw	a0, -16(s0)
	.loc	1 121 5 is_stmt 1       # loco.c:121:5
	j	.LBB3_10
.Ltmp34:
.LBB3_9:
	.loc	1 124 18                # loco.c:124:18
	lw	a0, -1048(s0)
	.loc	1 124 16 is_stmt 0      # loco.c:124:16
	sw	a0, -16(s0)
	j	.LBB3_10
.Ltmp35:
.LBB3_10:
	.loc	1 129 16 is_stmt 1      # loco.c:129:16
	lw	a0, -16(s0)
	.loc	1 129 23 is_stmt 0      # loco.c:129:23
	addi	a0, a0, -128
	.loc	1 129 9                 # loco.c:129:9
	sw	a0, -1060(s0)
	.loc	1 131 23 is_stmt 1      # loco.c:131:23
	lw	a0, -1060(s0)
	fcvt.s.w	ft0, a0
	lui	a0, %hi(.LCPI3_0)
	addi	a0, a0, %lo(.LCPI3_0)
	flw	ft1, 0(a0)
	.loc	1 131 22 is_stmt 0      # loco.c:131:22
	fmul.s	ft0, ft0, ft1
	.loc	1 131 20                # loco.c:131:20
	fcvt.w.s	a0, ft0, rtz
	.loc	1 131 9                 # loco.c:131:9
	sw	a0, -1064(s0)
	.loc	1 133 22 is_stmt 1      # loco.c:133:22
	lw	a0, -1060(s0)
	.loc	1 133 27 is_stmt 0      # loco.c:133:27
	lw	a1, -20(s0)
	.loc	1 133 26                # loco.c:133:26
	sub	a0, a0, a1
	.loc	1 133 20                # loco.c:133:20
	fcvt.s.w	ft0, a0
	lui	a0, %hi(.LCPI3_1)
	addi	a0, a0, %lo(.LCPI3_1)
	flw	ft1, 0(a0)
	.loc	1 133 19                # loco.c:133:19
	fmul.s	ft0, ft0, ft1
	.loc	1 133 14                # loco.c:133:14
	lw	a0, -1064(s0)
	fcvt.s.w	ft1, a0
	fadd.s	ft0, ft1, ft0
	fcvt.w.s	a0, ft0, rtz
	sw	a0, -1064(s0)
.Ltmp36:
	.loc	1 136 8 is_stmt 1       # loco.c:136:8
	lw	a0, -1064(s0)
	addi	a1, zero, 81
.Ltmp37:
	.loc	1 136 8 is_stmt 0       # loco.c:136:8
	blt	a0, a1, .LBB3_12
	j	.LBB3_11
.LBB3_11:
	.loc	1 0 8                   # loco.c:0:8
	addi	a0, zero, 80
.Ltmp38:
	.loc	1 138 18 is_stmt 1      # loco.c:138:18
	sw	a0, -1064(s0)
	.loc	1 139 5                 # loco.c:139:5
	j	.LBB3_15
.Ltmp39:
.LBB3_12:
	.loc	1 140 13                # loco.c:140:13
	lw	a0, -1064(s0)
	addi	a1, zero, -81
.Ltmp40:
	.loc	1 140 13 is_stmt 0      # loco.c:140:13
	blt	a1, a0, .LBB3_14
	j	.LBB3_13
.LBB3_13:
	.loc	1 0 13                  # loco.c:0:13
	addi	a0, zero, -80
.Ltmp41:
	.loc	1 142 18 is_stmt 1      # loco.c:142:18
	sw	a0, -1064(s0)
	.loc	1 143 5                 # loco.c:143:5
	j	.LBB3_14
.Ltmp42:
.LBB3_14:
	.loc	1 0 5 is_stmt 0         # loco.c:0:5
	j	.LBB3_15
.LBB3_15:
	.loc	1 146 21 is_stmt 1      # loco.c:146:21
	lbu	a0, -1064(s0)
	.loc	1 146 5 is_stmt 0       # loco.c:146:5
	call	set_motor_contr
	.loc	1 148 19 is_stmt 1      # loco.c:148:19
	lw	a0, -1060(s0)
	.loc	1 148 17 is_stmt 0      # loco.c:148:17
	sw	a0, -20(s0)
	.loc	1 149 1 is_stmt 1       # loco.c:149:1
	lw	s0, 1064(sp)
	lw	ra, 1068(sp)
	addi	sp, sp, 1072
	ret
.Ltmp43:
.Lfunc_end3:
	.size	seguePista, .Lfunc_end3-seguePista
	.cfi_endproc
                                        # -- End function
	.globl	dist_manhattan          # -- Begin function dist_manhattan
	.p2align	1
	.type	dist_manhattan,@function
dist_manhattan:                         # @dist_manhattan
.Lfunc_begin4:
	.loc	1 159 0                 # loco.c:159:0
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	sw	a1, -16(s0)
.Ltmp44:
	.loc	1 162 8 prologue_end    # loco.c:162:8
	lw	a0, -12(s0)
	lw	a0, 0(a0)
	.loc	1 162 18 is_stmt 0      # loco.c:162:18
	lw	a1, -16(s0)
	lw	a1, 0(a1)
.Ltmp45:
	.loc	1 162 8                 # loco.c:162:8
	bge	a1, a0, .LBB4_2
	j	.LBB4_1
.LBB4_1:
.Ltmp46:
	.loc	1 164 19 is_stmt 1      # loco.c:164:19
	lw	a0, -12(s0)
	lw	a0, 0(a0)
	.loc	1 164 27 is_stmt 0      # loco.c:164:27
	lw	a1, -16(s0)
	lw	a1, 0(a1)
	.loc	1 164 26                # loco.c:164:26
	sub	a0, a0, a1
	.loc	1 164 16                # loco.c:164:16
	lw	a1, -20(s0)
	add	a0, a0, a1
	sw	a0, -20(s0)
	.loc	1 165 5 is_stmt 1       # loco.c:165:5
	j	.LBB4_3
.Ltmp47:
.LBB4_2:
	.loc	1 168 19                # loco.c:168:19
	lw	a0, -12(s0)
	lw	a0, 0(a0)
	.loc	1 168 27 is_stmt 0      # loco.c:168:27
	lw	a1, -16(s0)
	lw	a1, 0(a1)
	.loc	1 168 16                # loco.c:168:16
	lw	a2, -20(s0)
	sub	a0, a1, a0
	add	a0, a0, a2
	sw	a0, -20(s0)
	j	.LBB4_3
.Ltmp48:
.LBB4_3:
	.loc	1 171 8 is_stmt 1       # loco.c:171:8
	lw	a0, -12(s0)
	lw	a0, 4(a0)
	.loc	1 171 18 is_stmt 0      # loco.c:171:18
	lw	a1, -16(s0)
	lw	a1, 4(a1)
.Ltmp49:
	.loc	1 171 8                 # loco.c:171:8
	bge	a1, a0, .LBB4_5
	j	.LBB4_4
.LBB4_4:
.Ltmp50:
	.loc	1 173 19 is_stmt 1      # loco.c:173:19
	lw	a0, -12(s0)
	lw	a0, 4(a0)
	.loc	1 173 27 is_stmt 0      # loco.c:173:27
	lw	a1, -16(s0)
	lw	a1, 4(a1)
	.loc	1 173 26                # loco.c:173:26
	sub	a0, a0, a1
	.loc	1 173 16                # loco.c:173:16
	lw	a1, -20(s0)
	add	a0, a0, a1
	sw	a0, -20(s0)
	.loc	1 174 5 is_stmt 1       # loco.c:174:5
	j	.LBB4_6
.Ltmp51:
.LBB4_5:
	.loc	1 177 19                # loco.c:177:19
	lw	a0, -12(s0)
	lw	a0, 4(a0)
	.loc	1 177 27 is_stmt 0      # loco.c:177:27
	lw	a1, -16(s0)
	lw	a1, 4(a1)
	.loc	1 177 16                # loco.c:177:16
	lw	a2, -20(s0)
	sub	a0, a1, a0
	add	a0, a0, a2
	sw	a0, -20(s0)
	j	.LBB4_6
.Ltmp52:
.LBB4_6:
	.loc	1 180 12 is_stmt 1      # loco.c:180:12
	lw	a0, -20(s0)
	.loc	1 180 5 is_stmt 0       # loco.c:180:5
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Ltmp53:
.Lfunc_end4:
	.size	dist_manhattan, .Lfunc_end4-dist_manhattan
	.cfi_endproc
                                        # -- End function
	.globl	girar                   # -- Begin function girar
	.p2align	1
	.type	girar,@function
girar:                                  # @girar
.Lfunc_begin5:
	.loc	1 186 0 is_stmt 1       # loco.c:186:0
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
.Ltmp54:
	.loc	1 189 5 prologue_end    # loco.c:189:5
	lui	a0, %hi(ax)
	addi	a0, a0, %lo(ax)
	lui	a1, %hi(ay)
	addi	a2, a1, %lo(ay)
	lui	a3, %hi(az)
	addi	a3, a3, %lo(az)
	sw	a1, -20(s0)
	add	a1, zero, a2
	add	a2, zero, a3
	call	get_rotation
	addi	a0, zero, 127
	.loc	1 191 9                 # loco.c:191:9
	sw	a0, -16(s0)
.Ltmp55:
	.loc	1 193 8                 # loco.c:193:8
	lw	a0, -12(s0)
	.loc	1 193 17 is_stmt 0      # loco.c:193:17
	lw	a1, -20(s0)
	lw	a2, %lo(ay)(a1)
.Ltmp56:
	.loc	1 193 8                 # loco.c:193:8
	bge	a0, a2, .LBB5_2
	j	.LBB5_1
.LBB5_1:
	.loc	1 0 8                   # loco.c:0:8
	addi	a0, zero, -127
.Ltmp57:
	.loc	1 195 18 is_stmt 1      # loco.c:195:18
	sw	a0, -16(s0)
	.loc	1 197 16                # loco.c:197:16
	lw	a0, -12(s0)
	mv	a1, zero
	sub	a0, a1, a0
	sw	a0, -12(s0)
	.loc	1 198 5                 # loco.c:198:5
	j	.LBB5_2
.Ltmp58:
.LBB5_2:
	.loc	1 200 5                 # loco.c:200:5
	j	.LBB5_3
.LBB5_3:                                # =>This Inner Loop Header: Depth=1
	.loc	1 200 11 is_stmt 0      # loco.c:200:11
	lw	a0, -12(s0)
	.loc	1 200 20                # loco.c:200:20
	lui	a1, %hi(ay)
	lw	a1, %lo(ay)(a1)
	.loc	1 200 18                # loco.c:200:18
	sub	a0, a0, a1
	addi	a1, zero, 2
	.loc	1 200 5                 # loco.c:200:5
	blt	a0, a1, .LBB5_5
	j	.LBB5_4
.LBB5_4:                                #   in Loop: Header=BB5_3 Depth=1
.Ltmp59:
	.loc	1 202 21 is_stmt 1      # loco.c:202:21
	lbu	a1, -16(s0)
	addi	a0, zero, 1
	.loc	1 202 9 is_stmt 0       # loco.c:202:9
	call	set_motor
	.loc	1 203 9 is_stmt 1       # loco.c:203:9
	lui	a1, %hi(ax)
	addi	a1, a1, %lo(ax)
	lui	a2, %hi(ay)
	addi	a2, a2, %lo(ay)
	lui	a3, %hi(az)
	addi	a3, a3, %lo(az)
	sw	a0, -24(s0)
	add	a0, zero, a1
	add	a1, zero, a2
	add	a2, zero, a3
	call	get_rotation
.Ltmp60:
	.loc	1 200 5                 # loco.c:200:5
	j	.LBB5_3
.LBB5_5:
	.loc	1 206 1                 # loco.c:206:1
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Ltmp61:
.Lfunc_end5:
	.size	girar, .Lfunc_end5-girar
	.cfi_endproc
                                        # -- End function
	.globl	dentroArea              # -- Begin function dentroArea
	.p2align	1
	.type	dentroArea,@function
dentroArea:                             # @dentroArea
.Lfunc_begin6:
	.loc	1 225 0                 # loco.c:225:0
	.cfi_startproc
# %bb.0:
	#DEBUG_VALUE: dentroArea:area <- [$x10+0]
	#DEBUG_VALUE: dentroArea:area <- [$x10+0]
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a1, -16(s0)
	sw	a2, -20(s0)
.Ltmp62:
	.loc	1 227 8 prologue_end    # loco.c:227:8
	lw	a1, -16(s0)
	.loc	1 227 16 is_stmt 0      # loco.c:227:16
	lw	a2, 4(a0)
	.loc	1 227 21                # loco.c:227:21
	sw	a0, -24(s0)
.Ltmp63:
	#DEBUG_VALUE: dentroArea:area <- [DW_OP_constu 24, DW_OP_minus, DW_OP_deref] [$x8+0]
	bge	a1, a2, .LBB6_6
	j	.LBB6_1
.Ltmp64:
.LBB6_1:
	#DEBUG_VALUE: dentroArea:area <- [DW_OP_constu 24, DW_OP_minus, DW_OP_deref] [$x8+0]
	.loc	1 227 24                # loco.c:227:24
	lw	a0, -16(s0)
	.loc	1 227 31                # loco.c:227:31
	lw	a1, -24(s0)
	lw	a2, 0(a1)
.Ltmp65:
	.loc	1 227 8                 # loco.c:227:8
	bge	a2, a0, .LBB6_6
	j	.LBB6_2
.Ltmp66:
.LBB6_2:
	#DEBUG_VALUE: dentroArea:area <- [DW_OP_constu 24, DW_OP_minus, DW_OP_deref] [$x8+0]
	.loc	1 229 12 is_stmt 1      # loco.c:229:12
	lw	a0, -20(s0)
	.loc	1 229 19 is_stmt 0      # loco.c:229:19
	lw	a1, -24(s0)
	lw	a2, 8(a1)
	.loc	1 229 24                # loco.c:229:24
	bge	a2, a0, .LBB6_5
	j	.LBB6_3
.Ltmp67:
.LBB6_3:
	#DEBUG_VALUE: dentroArea:area <- [DW_OP_constu 24, DW_OP_minus, DW_OP_deref] [$x8+0]
	.loc	1 229 27                # loco.c:229:27
	lw	a0, -20(s0)
	.loc	1 229 34                # loco.c:229:34
	lw	a1, -24(s0)
	lw	a2, 12(a1)
.Ltmp68:
	.loc	1 229 12                # loco.c:229:12
	bge	a0, a2, .LBB6_5
	j	.LBB6_4
.Ltmp69:
.LBB6_4:
	#DEBUG_VALUE: dentroArea:area <- [DW_OP_constu 24, DW_OP_minus, DW_OP_deref] [$x8+0]
	.loc	1 0 12                  # loco.c:0:12
	addi	a0, zero, 1
.Ltmp70:
	.loc	1 231 13 is_stmt 1      # loco.c:231:13
	sw	a0, -12(s0)
	j	.LBB6_7
.Ltmp71:
.LBB6_5:
	#DEBUG_VALUE: dentroArea:area <- [DW_OP_constu 24, DW_OP_minus, DW_OP_deref] [$x8+0]
	.loc	1 233 5                 # loco.c:233:5
	j	.LBB6_6
.Ltmp72:
.LBB6_6:
	#DEBUG_VALUE: dentroArea:area <- [DW_OP_constu 24, DW_OP_minus, DW_OP_deref] [$x8+0]
	.loc	1 0 5 is_stmt 0         # loco.c:0:5
	mv	a0, zero
	.loc	1 235 5 is_stmt 1       # loco.c:235:5
	sw	a0, -12(s0)
	j	.LBB6_7
.Ltmp73:
.LBB6_7:
	#DEBUG_VALUE: dentroArea:area <- [DW_OP_constu 24, DW_OP_minus, DW_OP_deref] [$x8+0]
	.loc	1 236 1                 # loco.c:236:1
	lw	a0, -12(s0)
	lw	s0, 24(sp)
.Ltmp74:
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Ltmp75:
.Lfunc_end6:
	.size	dentroArea, .Lfunc_end6-dentroArea
	.cfi_endproc
                                        # -- End function
	.globl	getDirecao              # -- Begin function getDirecao
	.p2align	1
	.type	getDirecao,@function
getDirecao:                             # @getDirecao
.Lfunc_begin7:
	.loc	1 249 0                 # loco.c:249:0
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	addi	a0, s0, -16
	addi	a1, s0, -20
	addi	a2, s0, -24
.Ltmp76:
	.loc	1 252 5 prologue_end    # loco.c:252:5
	call	get_rotation
.Ltmp77:
	.loc	1 254 8                 # loco.c:254:8
	lw	a0, -20(s0)
	addi	a1, zero, 135
	.loc	1 254 17 is_stmt 0      # loco.c:254:17
	blt	a0, a1, .LBB7_3
	j	.LBB7_1
.LBB7_1:
	.loc	1 254 20                # loco.c:254:20
	lw	a0, -20(s0)
	addi	a1, zero, 224
.Ltmp78:
	.loc	1 254 8                 # loco.c:254:8
	blt	a1, a0, .LBB7_3
	j	.LBB7_2
.LBB7_2:
	.loc	1 0 8                   # loco.c:0:8
	addi	a0, zero, 180
.Ltmp79:
	.loc	1 256 9 is_stmt 1       # loco.c:256:9
	sw	a0, -12(s0)
	j	.LBB7_10
.Ltmp80:
.LBB7_3:
	.loc	1 258 13                # loco.c:258:13
	lw	a0, -20(s0)
	addi	a1, zero, 225
	.loc	1 258 22 is_stmt 0      # loco.c:258:22
	blt	a0, a1, .LBB7_6
	j	.LBB7_4
.LBB7_4:
	.loc	1 258 25                # loco.c:258:25
	lw	a0, -20(s0)
	addi	a1, zero, 314
.Ltmp81:
	.loc	1 258 13                # loco.c:258:13
	blt	a1, a0, .LBB7_6
	j	.LBB7_5
.LBB7_5:
	.loc	1 0 13                  # loco.c:0:13
	addi	a0, zero, 270
.Ltmp82:
	.loc	1 260 9 is_stmt 1       # loco.c:260:9
	sw	a0, -12(s0)
	j	.LBB7_10
.Ltmp83:
.LBB7_6:
	.loc	1 262 13                # loco.c:262:13
	lw	a0, -20(s0)
	addi	a1, zero, 45
	.loc	1 262 20 is_stmt 0      # loco.c:262:20
	blt	a0, a1, .LBB7_9
	j	.LBB7_7
.LBB7_7:
	.loc	1 262 23                # loco.c:262:23
	lw	a0, -20(s0)
	addi	a1, zero, 134
.Ltmp84:
	.loc	1 262 13                # loco.c:262:13
	blt	a1, a0, .LBB7_9
	j	.LBB7_8
.LBB7_8:
	.loc	1 0 13                  # loco.c:0:13
	addi	a0, zero, 90
.Ltmp85:
	.loc	1 264 9 is_stmt 1       # loco.c:264:9
	sw	a0, -12(s0)
	j	.LBB7_10
.Ltmp86:
.LBB7_9:
	.loc	1 0 9 is_stmt 0         # loco.c:0:9
	mv	a0, zero
.Ltmp87:
	.loc	1 268 9 is_stmt 1       # loco.c:268:9
	sw	a0, -12(s0)
	j	.LBB7_10
.Ltmp88:
.LBB7_10:
	.loc	1 272 1                 # loco.c:272:1
	lw	a0, -12(s0)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Ltmp89:
.Lfunc_end7:
	.size	getDirecao, .Lfunc_end7-getDirecao
	.cfi_endproc
                                        # -- End function
	.globl	user_code               # -- Begin function user_code
	.p2align	1
	.type	user_code,@function
user_code:                              # @user_code
.Lfunc_begin8:
	.loc	1 280 0                 # loco.c:280:0
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -112
	.cfi_def_cfa_offset 112
	sw	ra, 108(sp)
	sw	s0, 104(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 112
	.cfi_def_cfa s0, 0
	addi	a0, zero, -22
.Ltmp90:
	.loc	1 283 24 prologue_end   # loco.c:283:24
	sw	a0, -88(s0)
	addi	a0, zero, -7
	.loc	1 284 24                # loco.c:284:24
	sw	a0, -84(s0)
	addi	a0, zero, -5
	.loc	1 285 24                # loco.c:285:24
	sw	a0, -80(s0)
	addi	a0, zero, 30
	.loc	1 286 24                # loco.c:286:24
	sw	a0, -76(s0)
	addi	a0, zero, 125
	.loc	1 288 24                # loco.c:288:24
	sw	a0, -72(s0)
	addi	a0, zero, 161
	.loc	1 289 24                # loco.c:289:24
	sw	a0, -68(s0)
	addi	a0, zero, -13
	.loc	1 290 24                # loco.c:290:24
	sw	a0, -64(s0)
	addi	a0, zero, 23
	.loc	1 291 24                # loco.c:291:24
	sw	a0, -60(s0)
	addi	a0, zero, 279
	.loc	1 293 24                # loco.c:293:24
	sw	a0, -56(s0)
	addi	a0, zero, 294
	.loc	1 294 24                # loco.c:294:24
	sw	a0, -52(s0)
	addi	a0, zero, -18
	.loc	1 295 24                # loco.c:295:24
	sw	a0, -48(s0)
	addi	a0, zero, 17
	.loc	1 296 24                # loco.c:296:24
	sw	a0, -44(s0)
	addi	a0, zero, 282
	.loc	1 298 24                # loco.c:298:24
	sw	a0, -40(s0)
	addi	a0, zero, 297
	.loc	1 299 24                # loco.c:299:24
	sw	a0, -36(s0)
	addi	a0, zero, 197
	.loc	1 300 24                # loco.c:300:24
	sw	a0, -32(s0)
	addi	a0, zero, 212
	.loc	1 301 24                # loco.c:301:24
	sw	a0, -28(s0)
	addi	a0, zero, 133
	.loc	1 303 24                # loco.c:303:24
	sw	a0, -24(s0)
	addi	a0, zero, 169
	.loc	1 304 24                # loco.c:304:24
	sw	a0, -20(s0)
	addi	a0, zero, 200
	.loc	1 305 24                # loco.c:305:24
	sw	a0, -16(s0)
	addi	a0, zero, 216
	.loc	1 306 24                # loco.c:306:24
	sw	a0, -12(s0)
	.loc	1 308 21                # loco.c:308:21
	call	get_time
	.loc	1 308 19 is_stmt 0      # loco.c:308:19
	lui	a1, %hi(timeCtrInicio)
	sw	a0, %lo(timeCtrInicio)(a1)
	.loc	1 309 20 is_stmt 1      # loco.c:309:20
	lw	a0, %lo(timeCtrInicio)(a1)
	.loc	1 309 18 is_stmt 0      # loco.c:309:18
	lui	a1, %hi(timeCtrAtual)
	sw	a0, %lo(timeCtrAtual)(a1)
	.loc	1 311 5 is_stmt 1       # loco.c:311:5
	j	.LBB8_1
.LBB8_1:                                # =>This Inner Loop Header: Depth=1
.Ltmp91:
	.loc	1 313 9                 # loco.c:313:9
	call	seguePista
	.loc	1 315 9                 # loco.c:315:9
	lui	a0, %hi(x)
	addi	a1, a0, %lo(x)
	lui	a2, %hi(y)
	addi	a2, a2, %lo(y)
	lui	a3, %hi(z)
	addi	a4, a3, %lo(z)
	sw	a0, -108(s0)
	add	a0, zero, a1
	add	a1, zero, a2
	add	a2, zero, a4
	sw	a3, -112(s0)
	call	get_position
.Ltmp92:
	.loc	1 317 37                # loco.c:317:37
	lw	a0, -108(s0)
	lw	a1, %lo(x)(a0)
	.loc	1 317 39 is_stmt 0      # loco.c:317:39
	lw	a2, -112(s0)
	lw	a2, %lo(z)(a2)
	.loc	1 317 12                # loco.c:317:12
	lw	a3, -76(s0)
	sw	a3, -92(s0)
	lw	a3, -80(s0)
	sw	a3, -96(s0)
	lw	a3, -84(s0)
	sw	a3, -100(s0)
	lw	a3, -88(s0)
	sw	a3, -104(s0)
	addi	a0, s0, -104
	call	dentroArea
	addi	a1, zero, 1
.Ltmp93:
	.loc	1 317 12                # loco.c:317:12
	bne	a0, a1, .LBB8_4
	j	.LBB8_2
.LBB8_2:
	.loc	1 0 12                  # loco.c:0:12
	addi	a0, zero, 1
.Ltmp94:
	.loc	1 319 13 is_stmt 1      # loco.c:319:13
	call	set_handbreak
	.loc	1 321 13                # loco.c:321:13
	j	.LBB8_3
.LBB8_3:                                # =>This Inner Loop Header: Depth=1
	j	.LBB8_3
.Ltmp95:
.LBB8_4:                                #   in Loop: Header=BB8_1 Depth=1
	.loc	1 311 5                 # loco.c:311:5
	j	.LBB8_1
.Ltmp96:
.Lfunc_end8:
	.size	user_code, .Lfunc_end8-user_code
	.cfi_endproc
                                        # -- End function
	.type	kp,@object              # @kp
	.section	.rodata,"a",@progbits
	.globl	kp
	.p2align	2
kp:
	.word	1067030938              # float 1.20000005
	.size	kp, 4

	.type	kd,@object              # @kd
	.globl	kd
	.p2align	2
kd:
	.word	1056964608              # float 0.5
	.size	kd, 4

	.type	max_steering,@object    # @max_steering
	.globl	max_steering
	.p2align	2
max_steering:
	.word	80                      # 0x50
	.size	max_steering, 4

	.type	timeCtrAtual,@object    # @timeCtrAtual
	.comm	timeCtrAtual,4,4
	.type	timeCtrInicio,@object   # @timeCtrInicio
	.comm	timeCtrInicio,4,4
	.type	lum,@object             # @lum
	.comm	lum,256,1
	.type	ax,@object              # @ax
	.comm	ax,4,4
	.type	ay,@object              # @ay
	.comm	ay,4,4
	.type	az,@object              # @az
	.comm	az,4,4
	.type	areaEntrei,@object      # @areaEntrei
	.globl	areaEntrei
	.p2align	2
areaEntrei:
	.word	0                       # 0x0
	.word	1                       # 0x1
	.word	2                       # 0x2
	.word	3                       # 0x3
	.word	4                       # 0x4
	.word	1                       # 0x1
	.word	0                       # 0x0
	.word	4                       # 0x4
	.word	3                       # 0x3
	.word	2                       # 0x2
	.word	1                       # 0x1
	.word	4                       # 0x4
	.size	areaEntrei, 48

	.type	angulo,@object          # @angulo
	.globl	angulo
	.p2align	2
angulo:
	.word	180                     # 0xb4
	.word	90                      # 0x5a
	.word	90                      # 0x5a
	.word	0                       # 0x0
	.word	270                     # 0x10e
	.word	180                     # 0xb4
	.word	270                     # 0x10e
	.word	90                      # 0x5a
	.word	90                      # 0x5a
	.word	180                     # 0xb4
	.word	270                     # 0x10e
	.word	0                       # 0x0
	.size	angulo, 48

	.type	ladoGiro,@object        # @ladoGiro
	.globl	ladoGiro
	.p2align	2
ladoGiro:
	.word	4294967295              # 0xffffffff
	.word	0                       # 0x0
	.word	4294967295              # 0xffffffff
	.word	4294967295              # 0xffffffff
	.word	4294967295              # 0xffffffff
	.word	1                       # 0x1
	.word	1                       # 0x1
	.word	0                       # 0x0
	.word	1                       # 0x1
	.word	1                       # 0x1
	.word	1                       # 0x1
	.word	1                       # 0x1
	.size	ladoGiro, 48

	.type	x,@object               # @x
	.comm	x,4,4
	.type	y,@object               # @y
	.comm	y,4,4
	.type	z,@object               # @z
	.comm	z,4,4
	.type	accel,@object           # @accel
	.comm	accel,4,4
	.type	steering,@object        # @steering
	.comm	steering,4,4
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 10.0.0-4ubuntu1 " # string offset=0
.Linfo_string1:
	.asciz	"loco.c"                # string offset=31
.Linfo_string2:
	.asciz	"/mnt/c/Users/Elton/Documents/GitHub/MC404/Trabalho 02/src2" # string offset=38
.Linfo_string3:
	.asciz	"kp"                    # string offset=97
.Linfo_string4:
	.asciz	"float"                 # string offset=100
.Linfo_string5:
	.asciz	"kd"                    # string offset=106
.Linfo_string6:
	.asciz	"max_steering"          # string offset=109
.Linfo_string7:
	.asciz	"int"                   # string offset=122
.Linfo_string8:
	.asciz	"areaEntrei"            # string offset=126
.Linfo_string9:
	.asciz	"__ARRAY_SIZE_TYPE__"   # string offset=137
.Linfo_string10:
	.asciz	"angulo"                # string offset=157
.Linfo_string11:
	.asciz	"ladoGiro"              # string offset=164
.Linfo_string12:
	.asciz	"accel"                 # string offset=173
.Linfo_string13:
	.asciz	"steering"              # string offset=179
.Linfo_string14:
	.asciz	"lum"                   # string offset=188
.Linfo_string15:
	.asciz	"unsigned char"         # string offset=192
.Linfo_string16:
	.asciz	"timeCtrInicio"         # string offset=206
.Linfo_string17:
	.asciz	"unsigned int"          # string offset=220
.Linfo_string18:
	.asciz	"timeCtrAtual"          # string offset=233
.Linfo_string19:
	.asciz	"ax"                    # string offset=246
.Linfo_string20:
	.asciz	"ay"                    # string offset=249
.Linfo_string21:
	.asciz	"az"                    # string offset=252
.Linfo_string22:
	.asciz	"x"                     # string offset=255
.Linfo_string23:
	.asciz	"y"                     # string offset=257
.Linfo_string24:
	.asciz	"z"                     # string offset=259
.Linfo_string25:
	.asciz	"delay"                 # string offset=261
.Linfo_string26:
	.asciz	"delayMotor"            # string offset=267
.Linfo_string27:
	.asciz	"set_motor_contr"       # string offset=278
.Linfo_string28:
	.asciz	"seguePista"            # string offset=294
.Linfo_string29:
	.asciz	"dist_manhattan"        # string offset=305
.Linfo_string30:
	.asciz	"girar"                 # string offset=320
.Linfo_string31:
	.asciz	"dentroArea"            # string offset=326
.Linfo_string32:
	.asciz	"getDirecao"            # string offset=337
.Linfo_string33:
	.asciz	"user_code"             # string offset=348
.Linfo_string34:
	.asciz	"duracao"               # string offset=358
.Linfo_string35:
	.asciz	"time"                  # string offset=366
.Linfo_string36:
	.asciz	"char"                  # string offset=371
.Linfo_string37:
	.asciz	"centro"                # string offset=376
.Linfo_string38:
	.asciz	"ultimo_erro"           # string offset=383
.Linfo_string39:
	.asciz	"indice"                # string offset=395
.Linfo_string40:
	.asciz	"ultimo_centro"         # string offset=402
.Linfo_string41:
	.asciz	"nIndice"               # string offset=416
.Linfo_string42:
	.asciz	"i"                     # string offset=424
.Linfo_string43:
	.asciz	"erro"                  # string offset=426
.Linfo_string44:
	.asciz	"vec1"                  # string offset=431
.Linfo_string45:
	.asciz	"vec2"                  # string offset=436
.Linfo_string46:
	.asciz	"result"                # string offset=441
.Linfo_string47:
	.asciz	"area"                  # string offset=448
.Linfo_string48:
	.asciz	"xMin"                  # string offset=453
.Linfo_string49:
	.asciz	"xMax"                  # string offset=458
.Linfo_string50:
	.asciz	"zMin"                  # string offset=463
.Linfo_string51:
	.asciz	"zMax"                  # string offset=468
.Linfo_string52:
	.asciz	"Area"                  # string offset=473
.Linfo_string53:
	.asciz	"cruzamento"            # string offset=478
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.word	.Lfunc_begin6-.Lfunc_begin0
	.word	.Ltmp63-.Lfunc_begin0
	.half	2                       # Loc expr size
	.byte	122                     # DW_OP_breg10
	.byte	0                       # 0
	.word	.Ltmp63-.Lfunc_begin0
	.word	.Ltmp74-.Lfunc_begin0
	.half	3                       # Loc expr size
	.byte	120                     # DW_OP_breg8
	.byte	104                     # -24
	.byte	6                       # DW_OP_deref
	.word	0
	.word	0
	.section	.debug_abbrev,"",@progbits
	.byte	1                       # Abbreviation Code
	.byte	17                      # DW_TAG_compile_unit
	.byte	1                       # DW_CHILDREN_yes
	.byte	37                      # DW_AT_producer
	.byte	14                      # DW_FORM_strp
	.byte	19                      # DW_AT_language
	.byte	5                       # DW_FORM_data2
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	16                      # DW_AT_stmt_list
	.byte	23                      # DW_FORM_sec_offset
	.byte	27                      # DW_AT_comp_dir
	.byte	14                      # DW_FORM_strp
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	2                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	3                       # Abbreviation Code
	.byte	38                      # DW_TAG_const_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	4                       # Abbreviation Code
	.byte	36                      # DW_TAG_base_type
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	62                      # DW_AT_encoding
	.byte	11                      # DW_FORM_data1
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	5                       # Abbreviation Code
	.byte	1                       # DW_TAG_array_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	6                       # Abbreviation Code
	.byte	33                      # DW_TAG_subrange_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	55                      # DW_AT_count
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	7                       # Abbreviation Code
	.byte	36                      # DW_TAG_base_type
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	62                      # DW_AT_encoding
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	8                       # Abbreviation Code
	.byte	33                      # DW_TAG_subrange_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	55                      # DW_AT_count
	.byte	5                       # DW_FORM_data2
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	9                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	10                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	11                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	12                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	13                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	14                      # Abbreviation Code
	.byte	11                      # DW_TAG_lexical_block
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	15                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	16                      # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	17                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	18                      # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	19                      # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	20                      # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	21                      # Abbreviation Code
	.byte	22                      # DW_TAG_typedef
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	22                      # Abbreviation Code
	.byte	19                      # DW_TAG_structure_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	23                      # Abbreviation Code
	.byte	13                      # DW_TAG_member
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	56                      # DW_AT_data_member_location
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.word	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.half	4                       # DWARF version number
	.word	.debug_abbrev           # Offset Into Abbrev. Section
	.byte	4                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x42b DW_TAG_compile_unit
	.word	.Linfo_string0          # DW_AT_producer
	.half	12                      # DW_AT_language
	.word	.Linfo_string1          # DW_AT_name
	.word	.Lline_table_start0     # DW_AT_stmt_list
	.word	.Linfo_string2          # DW_AT_comp_dir
	.word	.Lfunc_begin0           # DW_AT_low_pc
	.word	.Lfunc_end8-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x26:0x11 DW_TAG_variable
	.word	.Linfo_string3          # DW_AT_name
	.word	55                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	9                       # DW_AT_decl_line
	.byte	5                       # DW_AT_location
	.byte	3
	.word	kp
	.byte	3                       # Abbrev [3] 0x37:0x5 DW_TAG_const_type
	.word	60                      # DW_AT_type
	.byte	4                       # Abbrev [4] 0x3c:0x7 DW_TAG_base_type
	.word	.Linfo_string4          # DW_AT_name
	.byte	4                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	2                       # Abbrev [2] 0x43:0x11 DW_TAG_variable
	.word	.Linfo_string5          # DW_AT_name
	.word	55                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	10                      # DW_AT_decl_line
	.byte	5                       # DW_AT_location
	.byte	3
	.word	kd
	.byte	2                       # Abbrev [2] 0x54:0x11 DW_TAG_variable
	.word	.Linfo_string6          # DW_AT_name
	.word	101                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.byte	5                       # DW_AT_location
	.byte	3
	.word	max_steering
	.byte	3                       # Abbrev [3] 0x65:0x5 DW_TAG_const_type
	.word	106                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x6a:0x7 DW_TAG_base_type
	.word	.Linfo_string7          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	2                       # Abbrev [2] 0x71:0x11 DW_TAG_variable
	.word	.Linfo_string8          # DW_AT_name
	.word	130                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	243                     # DW_AT_decl_line
	.byte	5                       # DW_AT_location
	.byte	3
	.word	areaEntrei
	.byte	5                       # Abbrev [5] 0x82:0xc DW_TAG_array_type
	.word	101                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x87:0x6 DW_TAG_subrange_type
	.word	142                     # DW_AT_type
	.byte	12                      # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	7                       # Abbrev [7] 0x8e:0x7 DW_TAG_base_type
	.word	.Linfo_string9          # DW_AT_name
	.byte	8                       # DW_AT_byte_size
	.byte	7                       # DW_AT_encoding
	.byte	2                       # Abbrev [2] 0x95:0x11 DW_TAG_variable
	.word	.Linfo_string10         # DW_AT_name
	.word	130                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	244                     # DW_AT_decl_line
	.byte	5                       # DW_AT_location
	.byte	3
	.word	angulo
	.byte	2                       # Abbrev [2] 0xa6:0x11 DW_TAG_variable
	.word	.Linfo_string11         # DW_AT_name
	.word	130                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	245                     # DW_AT_decl_line
	.byte	5                       # DW_AT_location
	.byte	3
	.word	ladoGiro
	.byte	2                       # Abbrev [2] 0xb7:0x11 DW_TAG_variable
	.word	.Linfo_string12         # DW_AT_name
	.word	106                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.byte	5                       # DW_AT_location
	.byte	3
	.word	accel
	.byte	2                       # Abbrev [2] 0xc8:0x11 DW_TAG_variable
	.word	.Linfo_string13         # DW_AT_name
	.word	106                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.byte	5                       # DW_AT_location
	.byte	3
	.word	steering
	.byte	2                       # Abbrev [2] 0xd9:0x11 DW_TAG_variable
	.word	.Linfo_string14         # DW_AT_name
	.word	234                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.byte	5                       # DW_AT_location
	.byte	3
	.word	lum
	.byte	5                       # Abbrev [5] 0xea:0xd DW_TAG_array_type
	.word	247                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0xef:0x7 DW_TAG_subrange_type
	.word	142                     # DW_AT_type
	.half	256                     # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	4                       # Abbrev [4] 0xf7:0x7 DW_TAG_base_type
	.word	.Linfo_string15         # DW_AT_name
	.byte	8                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	2                       # Abbrev [2] 0xfe:0x11 DW_TAG_variable
	.word	.Linfo_string16         # DW_AT_name
	.word	271                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	45                      # DW_AT_decl_line
	.byte	5                       # DW_AT_location
	.byte	3
	.word	timeCtrInicio
	.byte	4                       # Abbrev [4] 0x10f:0x7 DW_TAG_base_type
	.word	.Linfo_string17         # DW_AT_name
	.byte	7                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	2                       # Abbrev [2] 0x116:0x11 DW_TAG_variable
	.word	.Linfo_string18         # DW_AT_name
	.word	271                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	46                      # DW_AT_decl_line
	.byte	5                       # DW_AT_location
	.byte	3
	.word	timeCtrAtual
	.byte	2                       # Abbrev [2] 0x127:0x11 DW_TAG_variable
	.word	.Linfo_string19         # DW_AT_name
	.word	106                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	183                     # DW_AT_decl_line
	.byte	5                       # DW_AT_location
	.byte	3
	.word	ax
	.byte	2                       # Abbrev [2] 0x138:0x11 DW_TAG_variable
	.word	.Linfo_string20         # DW_AT_name
	.word	106                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	183                     # DW_AT_decl_line
	.byte	5                       # DW_AT_location
	.byte	3
	.word	ay
	.byte	2                       # Abbrev [2] 0x149:0x11 DW_TAG_variable
	.word	.Linfo_string21         # DW_AT_name
	.word	106                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	183                     # DW_AT_decl_line
	.byte	5                       # DW_AT_location
	.byte	3
	.word	az
	.byte	9                       # Abbrev [9] 0x15a:0x12 DW_TAG_variable
	.word	.Linfo_string22         # DW_AT_name
	.word	106                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.half	274                     # DW_AT_decl_line
	.byte	5                       # DW_AT_location
	.byte	3
	.word	x
	.byte	9                       # Abbrev [9] 0x16c:0x12 DW_TAG_variable
	.word	.Linfo_string23         # DW_AT_name
	.word	106                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.half	274                     # DW_AT_decl_line
	.byte	5                       # DW_AT_location
	.byte	3
	.word	y
	.byte	9                       # Abbrev [9] 0x17e:0x12 DW_TAG_variable
	.word	.Linfo_string24         # DW_AT_name
	.word	106                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.half	274                     # DW_AT_decl_line
	.byte	5                       # DW_AT_location
	.byte	3
	.word	z
	.byte	10                      # Abbrev [10] 0x190:0x2e DW_TAG_subprogram
	.word	.Lfunc_begin0           # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	19                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	11                      # Abbrev [11] 0x1a1:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	116
	.word	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	19                      # DW_AT_decl_line
	.word	271                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1af:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	112
	.word	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	21                      # DW_AT_decl_line
	.word	271                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	10                      # Abbrev [10] 0x1be:0x4a DW_TAG_subprogram
	.word	.Lfunc_begin1           # DW_AT_low_pc
	.word	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	11                      # Abbrev [11] 0x1cf:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	116
	.word	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
	.word	271                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x1dd:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	112
	.word	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x1eb:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	108
	.word	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x1f9:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	104
	.word	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	37                      # DW_AT_decl_line
	.word	271                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	10                      # Abbrev [10] 0x208:0x20 DW_TAG_subprogram
	.word	.Lfunc_begin2           # DW_AT_low_pc
	.word	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	48                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	11                      # Abbrev [11] 0x219:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	119
	.word	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	48                      # DW_AT_decl_line
	.word	972                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	13                      # Abbrev [13] 0x228:0x92 DW_TAG_subprogram
	.word	.Lfunc_begin3           # DW_AT_low_pc
	.word	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	91                      # DW_AT_decl_line
                                        # DW_AT_external
	.byte	12                      # Abbrev [12] 0x239:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	112
	.word	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	93                      # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x247:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	108
	.word	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	94                      # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x255:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\354w"
	.word	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	97                      # DW_AT_decl_line
	.word	979                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x264:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\350w"
	.word	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	102                     # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x273:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\344w"
	.word	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	105                     # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x282:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\334w"
	.word	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	129                     # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x291:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\330w"
	.word	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	131                     # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	14                      # Abbrev [14] 0x2a0:0x19 DW_TAG_lexical_block
	.word	.Ltmp23                 # DW_AT_low_pc
	.word	.Ltmp31-.Ltmp23         # DW_AT_high_pc
	.byte	12                      # Abbrev [12] 0x2a9:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\340w"
	.word	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	107                     # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	15                      # Abbrev [15] 0x2ba:0x40 DW_TAG_subprogram
	.word	.Lfunc_begin4           # DW_AT_low_pc
	.word	.Lfunc_end4-.Lfunc_begin4 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	158                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.word	106                     # DW_AT_type
                                        # DW_AT_external
	.byte	11                      # Abbrev [11] 0x2cf:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	116
	.word	.Linfo_string44         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	158                     # DW_AT_decl_line
	.word	992                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x2dd:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	112
	.word	.Linfo_string45         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	158                     # DW_AT_decl_line
	.word	992                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x2eb:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	108
	.word	.Linfo_string46         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	160                     # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	10                      # Abbrev [10] 0x2fa:0x2e DW_TAG_subprogram
	.word	.Lfunc_begin5           # DW_AT_low_pc
	.word	.Lfunc_end5-.Lfunc_begin5 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	185                     # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	11                      # Abbrev [11] 0x30b:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	116
	.word	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	185                     # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x319:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	112
	.word	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	191                     # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	15                      # Abbrev [15] 0x328:0x41 DW_TAG_subprogram
	.word	.Lfunc_begin6           # DW_AT_low_pc
	.word	.Lfunc_end6-.Lfunc_begin6 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	224                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.word	106                     # DW_AT_type
                                        # DW_AT_external
	.byte	16                      # Abbrev [16] 0x33d:0xf DW_TAG_formal_parameter
	.word	.Ldebug_loc0            # DW_AT_location
	.word	.Linfo_string47         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	224                     # DW_AT_decl_line
	.word	997                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x34c:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	112
	.word	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	224                     # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x35a:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	108
	.word	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	224                     # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	17                      # Abbrev [17] 0x369:0x40 DW_TAG_subprogram
	.word	.Lfunc_begin7           # DW_AT_low_pc
	.word	.Lfunc_end7-.Lfunc_begin7 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	248                     # DW_AT_decl_line
	.word	106                     # DW_AT_type
                                        # DW_AT_external
	.byte	12                      # Abbrev [12] 0x37e:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	112
	.word	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	250                     # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x38c:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	108
	.word	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	250                     # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x39a:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	104
	.word	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	250                     # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	18                      # Abbrev [18] 0x3a9:0x23 DW_TAG_subprogram
	.word	.Lfunc_begin8           # DW_AT_low_pc
	.word	.Lfunc_end8-.Lfunc_begin8 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.half	279                     # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	19                      # Abbrev [19] 0x3bb:0x10 DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\250\177"
	.word	.Linfo_string53         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.half	281                     # DW_AT_decl_line
	.word	1065                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	4                       # Abbrev [4] 0x3cc:0x7 DW_TAG_base_type
	.word	.Linfo_string36         # DW_AT_name
	.byte	8                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	5                       # Abbrev [5] 0x3d3:0xd DW_TAG_array_type
	.word	106                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x3d8:0x7 DW_TAG_subrange_type
	.word	142                     # DW_AT_type
	.half	256                     # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	20                      # Abbrev [20] 0x3e0:0x5 DW_TAG_pointer_type
	.word	106                     # DW_AT_type
	.byte	21                      # Abbrev [21] 0x3e5:0xb DW_TAG_typedef
	.word	1008                    # DW_AT_type
	.word	.Linfo_string52         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	214                     # DW_AT_decl_line
	.byte	22                      # Abbrev [22] 0x3f0:0x39 DW_TAG_structure_type
	.word	.Linfo_string52         # DW_AT_name
	.byte	16                      # DW_AT_byte_size
	.byte	1                       # DW_AT_decl_file
	.byte	208                     # DW_AT_decl_line
	.byte	23                      # Abbrev [23] 0x3f8:0xc DW_TAG_member
	.word	.Linfo_string48         # DW_AT_name
	.word	106                     # DW_AT_type
	.byte	1                       # DW_AT_decl_file
	.byte	210                     # DW_AT_decl_line
	.byte	0                       # DW_AT_data_member_location
	.byte	23                      # Abbrev [23] 0x404:0xc DW_TAG_member
	.word	.Linfo_string49         # DW_AT_name
	.word	106                     # DW_AT_type
	.byte	1                       # DW_AT_decl_file
	.byte	211                     # DW_AT_decl_line
	.byte	4                       # DW_AT_data_member_location
	.byte	23                      # Abbrev [23] 0x410:0xc DW_TAG_member
	.word	.Linfo_string50         # DW_AT_name
	.word	106                     # DW_AT_type
	.byte	1                       # DW_AT_decl_file
	.byte	212                     # DW_AT_decl_line
	.byte	8                       # DW_AT_data_member_location
	.byte	23                      # Abbrev [23] 0x41c:0xc DW_TAG_member
	.word	.Linfo_string51         # DW_AT_name
	.word	106                     # DW_AT_type
	.byte	1                       # DW_AT_decl_file
	.byte	213                     # DW_AT_decl_line
	.byte	12                      # DW_AT_data_member_location
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x429:0xc DW_TAG_array_type
	.word	997                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0x42e:0x6 DW_TAG_subrange_type
	.word	142                     # DW_AT_type
	.byte	5                       # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
.Ldebug_info_end0:
	.ident	"clang version 10.0.0-4ubuntu1 "
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym get_time
	.addrsig_sym set_motor
	.addrsig_sym set_motor_contr
	.addrsig_sym seguePista
	.addrsig_sym read_sensors
	.addrsig_sym get_rotation
	.addrsig_sym dentroArea
	.addrsig_sym get_position
	.addrsig_sym set_handbreak
	.addrsig_sym timeCtrAtual
	.addrsig_sym timeCtrInicio
	.addrsig_sym lum
	.addrsig_sym ax
	.addrsig_sym ay
	.addrsig_sym az
	.addrsig_sym x
	.addrsig_sym y
	.addrsig_sym z
	.section	.debug_line,"",@progbits
.Lline_table_start0:
