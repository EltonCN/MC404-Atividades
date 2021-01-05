	.text
	.file	"loco.c"
	.file	1 "/mnt/c/Users/Elton/Documents/GitHub/MC404/Trabalho 02/src" "loco.c"
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
	.section	.sdata,"aw",@progbits
	.p2align	3               # -- Begin function raiz
.LCPI2_0:
	.quad	4611686018427387904     # double 2
.LCPI2_1:
	.quad	4602678819172646912     # double 0.5
.LCPI2_2:
	.quad	4591870180066957722     # double 0.10000000000000001
	.text
	.globl	raiz
	.p2align	1
	.type	raiz,@function
raiz:                                   # @raiz
.Lfunc_begin2:
	.loc	1 52 0                  # loco.c:52:0
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
	fmv.w.x	ft0, a0
	sw	a0, -12(s0)
.Ltmp12:
	.loc	1 53 20 prologue_end    # loco.c:53:20
	flw	ft1, -12(s0)
	fcvt.d.s	ft2, ft1
	lui	a0, %hi(.LCPI2_0)
	addi	a0, a0, %lo(.LCPI2_0)
	fld	ft3, 0(a0)
	.loc	1 53 23 is_stmt 0       # loco.c:53:23
	fdiv.d	ft2, ft2, ft3
	.loc	1 53 20                 # loco.c:53:20
	fcvt.s.d	ft1, ft2
	.loc	1 53 11                 # loco.c:53:11
	fsw	ft1, -16(s0)
	.loc	1 55 5 is_stmt 1        # loco.c:55:5
	j	.LBB2_1
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
.Ltmp13:
	.loc	1 57 23                 # loco.c:57:23
	flw	ft0, -16(s0)
	.loc	1 57 31 is_stmt 0       # loco.c:57:31
	flw	ft1, -12(s0)
	.loc	1 57 34                 # loco.c:57:34
	fdiv.s	ft1, ft1, ft0
	.loc	1 57 29                 # loco.c:57:29
	fadd.s	ft0, ft0, ft1
	.loc	1 57 22                 # loco.c:57:22
	fcvt.d.s	ft2, ft0
	lui	a0, %hi(.LCPI2_1)
	addi	a0, a0, %lo(.LCPI2_1)
	fld	ft3, 0(a0)
	.loc	1 57 21                 # loco.c:57:21
	fmul.d	ft2, ft2, ft3
	.loc	1 57 18                 # loco.c:57:18
	fcvt.s.d	ft0, ft2
	.loc	1 57 16                 # loco.c:57:16
	fsw	ft0, -16(s0)
.Ltmp14:
	.loc	1 59 14 is_stmt 1       # loco.c:59:14
	flw	ft0, -16(s0)
	.loc	1 59 20 is_stmt 0       # loco.c:59:20
	fmul.s	ft0, ft0, ft0
	.loc	1 59 29                 # loco.c:59:29
	flw	ft1, -12(s0)
	.loc	1 59 28                 # loco.c:59:28
	fsub.s	ft0, ft0, ft1
	.loc	1 59 13                 # loco.c:59:13
	fcvt.d.s	ft2, ft0
	lui	a0, %hi(.LCPI2_2)
	addi	a0, a0, %lo(.LCPI2_2)
	fld	ft3, 0(a0)
	.loc	1 59 33                 # loco.c:59:33
	flt.d	a0, ft2, ft3
	xori	a0, a0, 1
.Ltmp15:
	.loc	1 59 13                 # loco.c:59:13
	bnez	a0, .LBB2_3
	j	.LBB2_2
.LBB2_2:
.Ltmp16:
	.loc	1 61 13 is_stmt 1       # loco.c:61:13
	lw	a0, -16(s0)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Ltmp17:
.LBB2_3:                                #   in Loop: Header=BB2_1 Depth=1
	.loc	1 55 5                  # loco.c:55:5
	j	.LBB2_1
.Ltmp18:
.Lfunc_end2:
	.size	raiz, .Lfunc_end2-raiz
	.cfi_endproc
                                        # -- End function
	.section	.sdata,"aw",@progbits
	.p2align	3               # -- Begin function user_code
.LCPI3_0:
	.quad	4652007308841189376     # double 1000
.LCPI3_1:
	.quad	4621819117588971520     # double 10
.LCPI3_2:
	.word	1085392678              # float 5.55556011
	.zero	4
.LCPI3_3:
	.quad	4637376943239211254     # double 109.09
	.text
	.globl	user_code
	.p2align	1
	.type	user_code,@function
user_code:                              # @user_code
.Lfunc_begin3:
	.loc	1 92 0                  # loco.c:92:0
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -96
	.cfi_def_cfa_offset 96
	sw	ra, 92(sp)
	sw	s0, 88(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 96
	.cfi_def_cfa s0, 0
	addi	a0, s0, -24
	addi	a1, s0, -28
	addi	a2, s0, -32
.Ltmp19:
	.loc	1 97 5 prologue_end     # loco.c:97:5
	call	get_position
	addi	a0, zero, 100
	.loc	1 99 45                 # loco.c:99:45
	sw	a0, -44(s0)
	.loc	1 101 20                # loco.c:101:20
	call	get_time
	.loc	1 101 18 is_stmt 0      # loco.c:101:18
	sw	a0, -36(s0)
	.loc	1 103 5 is_stmt 1       # loco.c:103:5
	j	.LBB3_1
.LBB3_1:                                # =>This Inner Loop Header: Depth=1
.Ltmp20:
	.loc	1 105 23                # loco.c:105:23
	call	get_time
	.loc	1 105 21 is_stmt 0      # loco.c:105:21
	sw	a0, -40(s0)
.Ltmp21:
	.loc	1 107 12 is_stmt 1      # loco.c:107:12
	lw	a0, -40(s0)
	.loc	1 107 26 is_stmt 0      # loco.c:107:26
	lw	a1, -36(s0)
	.loc	1 107 24                # loco.c:107:24
	sub	a0, a0, a1
	.loc	1 107 41                # loco.c:107:41
	lw	a1, -44(s0)
.Ltmp22:
	.loc	1 107 12                # loco.c:107:12
	bgeu	a0, a1, .LBB3_3
	j	.LBB3_2
.LBB3_2:                                #   in Loop: Header=BB3_1 Depth=1
	.loc	1 0 12                  # loco.c:0:12
	addi	a0, zero, 1
	mv	a1, zero
.Ltmp23:
	.loc	1 109 13 is_stmt 1      # loco.c:109:13
	call	set_motor
	.loc	1 110 9                 # loco.c:110:9
	j	.LBB3_12
.Ltmp24:
.LBB3_3:                                #   in Loop: Header=BB3_1 Depth=1
	.loc	1 111 18                # loco.c:111:18
	lw	a0, -40(s0)
	.loc	1 111 32 is_stmt 0      # loco.c:111:32
	lw	a1, -36(s0)
	.loc	1 111 30                # loco.c:111:30
	sub	a0, a0, a1
	addi	a1, zero, 999
.Ltmp25:
	.loc	1 111 18                # loco.c:111:18
	bltu	a1, a0, .LBB3_5
	j	.LBB3_4
.LBB3_4:                                #   in Loop: Header=BB3_1 Depth=1
	.loc	1 0 18                  # loco.c:0:18
	mv	a0, zero
.Ltmp26:
	.loc	1 113 13 is_stmt 1      # loco.c:113:13
	sw	a0, -84(s0)
	lw	a1, -84(s0)
	call	set_motor
	.loc	1 114 9                 # loco.c:114:9
	j	.LBB3_11
.Ltmp27:
.LBB3_5:                                #   in Loop: Header=BB3_1 Depth=1
	.loc	1 0 9 is_stmt 0         # loco.c:0:9
	addi	a0, s0, -12
	addi	a1, s0, -16
	addi	a2, s0, -20
.Ltmp28:
	.loc	1 117 13 is_stmt 1      # loco.c:117:13
	call	get_position
	.loc	1 120 37                # loco.c:120:37
	lw	a0, -40(s0)
	.loc	1 120 51 is_stmt 0      # loco.c:120:51
	lw	a1, -36(s0)
	.loc	1 120 49                # loco.c:120:49
	sub	a0, a0, a1
	.loc	1 120 29                # loco.c:120:29
	fcvt.s.wu	ft0, a0
	.loc	1 120 28                # loco.c:120:28
	fcvt.d.s	ft1, ft0
	lui	a0, %hi(.LCPI3_0)
	addi	a0, a0, %lo(.LCPI3_0)
	fld	ft2, 0(a0)
	.loc	1 120 65                # loco.c:120:65
	fdiv.d	ft1, ft1, ft2
	.loc	1 120 28                # loco.c:120:28
	fcvt.s.d	ft0, ft1
	.loc	1 120 19                # loco.c:120:19
	fsw	ft0, -60(s0)
	.loc	1 122 40 is_stmt 1      # loco.c:122:40
	lw	a0, -12(s0)
	.loc	1 122 44 is_stmt 0      # loco.c:122:44
	lw	a1, -24(s0)
	.loc	1 122 42                # loco.c:122:42
	sub	a0, a0, a1
	.loc	1 122 31                # loco.c:122:31
	fcvt.s.w	ft0, a0
	.loc	1 122 30                # loco.c:122:30
	fcvt.d.s	ft1, ft0
	lui	a0, %hi(.LCPI3_1)
	addi	a0, a0, %lo(.LCPI3_1)
	fld	ft2, 0(a0)
	.loc	1 122 51                # loco.c:122:51
	fdiv.d	ft1, ft1, ft2
	.loc	1 122 58                # loco.c:122:58
	flw	ft0, -60(s0)
	fcvt.d.s	ft3, ft0
	.loc	1 122 57                # loco.c:122:57
	fdiv.d	ft1, ft1, ft3
	.loc	1 122 29                # loco.c:122:29
	fcvt.s.d	ft0, ft1
	.loc	1 122 27                # loco.c:122:27
	fsw	ft0, -56(s0)
	.loc	1 123 40 is_stmt 1      # loco.c:123:40
	lw	a0, -16(s0)
	.loc	1 123 44 is_stmt 0      # loco.c:123:44
	lw	a1, -28(s0)
	.loc	1 123 42                # loco.c:123:42
	sub	a0, a0, a1
	.loc	1 123 31                # loco.c:123:31
	fcvt.s.w	ft0, a0
	.loc	1 123 30                # loco.c:123:30
	fcvt.d.s	ft1, ft0
	.loc	1 123 51                # loco.c:123:51
	fdiv.d	ft1, ft1, ft2
	.loc	1 123 58                # loco.c:123:58
	flw	ft0, -60(s0)
	fcvt.d.s	ft3, ft0
	.loc	1 123 57                # loco.c:123:57
	fdiv.d	ft1, ft1, ft3
	.loc	1 123 29                # loco.c:123:29
	fcvt.s.d	ft0, ft1
	.loc	1 123 27                # loco.c:123:27
	fsw	ft0, -52(s0)
	.loc	1 124 40 is_stmt 1      # loco.c:124:40
	lw	a0, -20(s0)
	.loc	1 124 44 is_stmt 0      # loco.c:124:44
	lw	a1, -32(s0)
	.loc	1 124 42                # loco.c:124:42
	sub	a0, a0, a1
	.loc	1 124 31                # loco.c:124:31
	fcvt.s.w	ft0, a0
	.loc	1 124 30                # loco.c:124:30
	fcvt.d.s	ft1, ft0
	.loc	1 124 51                # loco.c:124:51
	fdiv.d	ft1, ft1, ft2
	.loc	1 124 58                # loco.c:124:58
	flw	ft0, -60(s0)
	fcvt.d.s	ft2, ft0
	.loc	1 124 57                # loco.c:124:57
	fdiv.d	ft1, ft1, ft2
	.loc	1 124 29                # loco.c:124:29
	fcvt.s.d	ft0, ft1
	.loc	1 124 27                # loco.c:124:27
	fsw	ft0, -48(s0)
	.loc	1 126 25 is_stmt 1      # loco.c:126:25
	flw	ft0, -56(s0)
	.loc	1 126 38 is_stmt 0      # loco.c:126:38
	fmul.s	ft0, ft0, ft0
	.loc	1 126 55                # loco.c:126:55
	flw	ft4, -48(s0)
	.loc	1 126 68                # loco.c:126:68
	fmul.s	ft4, ft4, ft4
	.loc	1 126 53                # loco.c:126:53
	fadd.s	ft0, ft0, ft4
	.loc	1 126 22                # loco.c:126:22
	lui	a0, %hi(magVel2D)
	fsw	ft0, %lo(magVel2D)(a0)
	.loc	1 127 24 is_stmt 1      # loco.c:127:24
	lw	a1, %lo(magVel2D)(a0)
	sw	a0, -88(s0)
	add	a0, zero, a1
	call	raiz
	.loc	1 127 22 is_stmt 0      # loco.c:127:22
	lw	a1, -88(s0)
	sw	a0, %lo(magVel2D)(a1)
	.loc	1 129 41 is_stmt 1      # loco.c:129:41
	flw	ft0, %lo(magVel2D)(a1)
	lui	a0, %hi(.LCPI3_2)
	addi	a0, a0, %lo(.LCPI3_2)
	flw	ft4, 0(a0)
	.loc	1 129 39 is_stmt 0      # loco.c:129:39
	fsub.s	ft0, ft4, ft0
	.loc	1 129 19                # loco.c:129:19
	fsw	ft0, -64(s0)
	.loc	1 131 42 is_stmt 1      # loco.c:131:42
	flw	ft0, -64(s0)
	fcvt.d.s	ft1, ft0
	lui	a0, %hi(.LCPI3_3)
	addi	a0, a0, %lo(.LCPI3_3)
	fld	ft2, 0(a0)
	.loc	1 131 41 is_stmt 0      # loco.c:131:41
	fmul.d	ft1, ft1, ft2
	.loc	1 131 28                # loco.c:131:28
	fcvt.w.d	a0, ft1, rtz
	.loc	1 131 25                # loco.c:131:25
	sw	a0, -44(s0)
.Ltmp29:
	.loc	1 133 16 is_stmt 1      # loco.c:133:16
	lw	a0, -44(s0)
	addi	a2, zero, 1001
.Ltmp30:
	.loc	1 133 16 is_stmt 0      # loco.c:133:16
	bltu	a0, a2, .LBB3_7
	j	.LBB3_6
.LBB3_6:                                #   in Loop: Header=BB3_1 Depth=1
	.loc	1 0 16                  # loco.c:0:16
	addi	a0, zero, 1000
.Ltmp31:
	.loc	1 135 29 is_stmt 1      # loco.c:135:29
	sw	a0, -44(s0)
	.loc	1 136 13                # loco.c:136:13
	j	.LBB3_10
.Ltmp32:
.LBB3_7:                                #   in Loop: Header=BB3_1 Depth=1
	.loc	1 0 13 is_stmt 0        # loco.c:0:13
	addi	a0, zero, 1
	.loc	1 137 21 is_stmt 1      # loco.c:137:21
	bnez	a0, .LBB3_9
	j	.LBB3_8
.LBB3_8:                                #   in Loop: Header=BB3_1 Depth=1
	.loc	1 0 21 is_stmt 0        # loco.c:0:21
	mv	a0, zero
.Ltmp33:
	.loc	1 139 29 is_stmt 1      # loco.c:139:29
	sw	a0, -44(s0)
	.loc	1 140 13                # loco.c:140:13
	j	.LBB3_9
.Ltmp34:
.LBB3_9:                                #   in Loop: Header=BB3_1 Depth=1
	.loc	1 0 13 is_stmt 0        # loco.c:0:13
	j	.LBB3_10
.LBB3_10:                               #   in Loop: Header=BB3_1 Depth=1
	.loc	1 142 17 is_stmt 1      # loco.c:142:17
	lw	a0, -24(s0)
	.loc	1 142 15 is_stmt 0      # loco.c:142:15
	sw	a0, -12(s0)
	.loc	1 143 17 is_stmt 1      # loco.c:143:17
	lw	a0, -28(s0)
	.loc	1 143 15 is_stmt 0      # loco.c:143:15
	sw	a0, -16(s0)
	.loc	1 144 17 is_stmt 1      # loco.c:144:17
	lw	a0, -32(s0)
	.loc	1 144 15 is_stmt 0      # loco.c:144:15
	sw	a0, -20(s0)
	.loc	1 146 28 is_stmt 1      # loco.c:146:28
	call	get_time
	.loc	1 146 26 is_stmt 0      # loco.c:146:26
	sw	a0, -36(s0)
	j	.LBB3_11
.Ltmp35:
.LBB3_11:                               #   in Loop: Header=BB3_1 Depth=1
	.loc	1 0 26                  # loco.c:0:26
	j	.LBB3_12
.LBB3_12:                               #   in Loop: Header=BB3_1 Depth=1
	.loc	1 103 5 is_stmt 1       # loco.c:103:5
	j	.LBB3_1
.Ltmp36:
.Lfunc_end3:
	.size	user_code, .Lfunc_end3-user_code
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

	.type	setpoint_vel,@object    # @setpoint_vel
	.globl	setpoint_vel
	.p2align	2
setpoint_vel:
	.word	1085392678              # float 5.55556011
	.size	setpoint_vel, 4

	.type	magVel2D,@object        # @magVel2D
	.comm	magVel2D,4,4
	.type	accel,@object           # @accel
	.comm	accel,4,4
	.type	steering,@object        # @steering
	.comm	steering,4,4
	.type	lum,@object             # @lum
	.comm	lum,256,1
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 10.0.0-4ubuntu1 " # string offset=0
.Linfo_string1:
	.asciz	"loco.c"                # string offset=31
.Linfo_string2:
	.asciz	"/mnt/c/Users/Elton/Documents/GitHub/MC404/Trabalho 02/src" # string offset=38
.Linfo_string3:
	.asciz	"kp"                    # string offset=96
.Linfo_string4:
	.asciz	"float"                 # string offset=99
.Linfo_string5:
	.asciz	"kd"                    # string offset=105
.Linfo_string6:
	.asciz	"max_steering"          # string offset=108
.Linfo_string7:
	.asciz	"int"                   # string offset=121
.Linfo_string8:
	.asciz	"setpoint_vel"          # string offset=125
.Linfo_string9:
	.asciz	"accel"                 # string offset=138
.Linfo_string10:
	.asciz	"steering"              # string offset=144
.Linfo_string11:
	.asciz	"lum"                   # string offset=153
.Linfo_string12:
	.asciz	"unsigned char"         # string offset=157
.Linfo_string13:
	.asciz	"__ARRAY_SIZE_TYPE__"   # string offset=171
.Linfo_string14:
	.asciz	"magVel2D"              # string offset=191
.Linfo_string15:
	.asciz	"delay"                 # string offset=200
.Linfo_string16:
	.asciz	"delayMotor"            # string offset=206
.Linfo_string17:
	.asciz	"raiz"                  # string offset=217
.Linfo_string18:
	.asciz	"user_code"             # string offset=222
.Linfo_string19:
	.asciz	"duracao"               # string offset=232
.Linfo_string20:
	.asciz	"unsigned int"          # string offset=240
.Linfo_string21:
	.asciz	"time"                  # string offset=253
.Linfo_string22:
	.asciz	"num"                   # string offset=258
.Linfo_string23:
	.asciz	"result"                # string offset=262
.Linfo_string24:
	.asciz	"x"                     # string offset=269
.Linfo_string25:
	.asciz	"y"                     # string offset=271
.Linfo_string26:
	.asciz	"z"                     # string offset=273
.Linfo_string27:
	.asciz	"x_ant"                 # string offset=275
.Linfo_string28:
	.asciz	"y_ant"                 # string offset=281
.Linfo_string29:
	.asciz	"z_ant"                 # string offset=287
.Linfo_string30:
	.asciz	"tempo_inicio"          # string offset=293
.Linfo_string31:
	.asciz	"tempo_final"           # string offset=306
.Linfo_string32:
	.asciz	"tempo_accel"           # string offset=318
.Linfo_string33:
	.asciz	"velocidade"            # string offset=330
.Linfo_string34:
	.asciz	"deltaT"                # string offset=341
.Linfo_string35:
	.asciz	"erro"                  # string offset=348
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
	.byte	5                       # DW_FORM_data2
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
	.byte	9                       # Abbreviation Code
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
	.byte	10                      # Abbreviation Code
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
	.byte	11                      # Abbreviation Code
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
	.byte	12                      # Abbreviation Code
	.byte	11                      # DW_TAG_lexical_block
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	13                      # Abbreviation Code
	.byte	33                      # DW_TAG_subrange_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	55                      # DW_AT_count
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
	.byte	1                       # Abbrev [1] 0xb:0x258 DW_TAG_compile_unit
	.word	.Linfo_string0          # DW_AT_producer
	.half	12                      # DW_AT_language
	.word	.Linfo_string1          # DW_AT_name
	.word	.Lline_table_start0     # DW_AT_stmt_list
	.word	.Linfo_string2          # DW_AT_comp_dir
	.word	.Lfunc_begin0           # DW_AT_low_pc
	.word	.Lfunc_end3-.Lfunc_begin0 # DW_AT_high_pc
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
	.word	55                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	12                      # DW_AT_decl_line
	.byte	5                       # DW_AT_location
	.byte	3
	.word	setpoint_vel
	.byte	2                       # Abbrev [2] 0x82:0x11 DW_TAG_variable
	.word	.Linfo_string9          # DW_AT_name
	.word	106                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.byte	5                       # DW_AT_location
	.byte	3
	.word	accel
	.byte	2                       # Abbrev [2] 0x93:0x11 DW_TAG_variable
	.word	.Linfo_string10         # DW_AT_name
	.word	106                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.byte	5                       # DW_AT_location
	.byte	3
	.word	steering
	.byte	2                       # Abbrev [2] 0xa4:0x11 DW_TAG_variable
	.word	.Linfo_string11         # DW_AT_name
	.word	181                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.byte	5                       # DW_AT_location
	.byte	3
	.word	lum
	.byte	5                       # Abbrev [5] 0xb5:0xd DW_TAG_array_type
	.word	194                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0xba:0x7 DW_TAG_subrange_type
	.word	201                     # DW_AT_type
	.half	256                     # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	4                       # Abbrev [4] 0xc2:0x7 DW_TAG_base_type
	.word	.Linfo_string12         # DW_AT_name
	.byte	8                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	7                       # Abbrev [7] 0xc9:0x7 DW_TAG_base_type
	.word	.Linfo_string13         # DW_AT_name
	.byte	8                       # DW_AT_byte_size
	.byte	7                       # DW_AT_encoding
	.byte	2                       # Abbrev [2] 0xd0:0x11 DW_TAG_variable
	.word	.Linfo_string14         # DW_AT_name
	.word	60                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	85                      # DW_AT_decl_line
	.byte	5                       # DW_AT_location
	.byte	3
	.word	magVel2D
	.byte	8                       # Abbrev [8] 0xe1:0x2e DW_TAG_subprogram
	.word	.Lfunc_begin0           # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	19                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	9                       # Abbrev [9] 0xf2:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	116
	.word	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	19                      # DW_AT_decl_line
	.word	591                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x100:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	112
	.word	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	21                      # DW_AT_decl_line
	.word	591                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	8                       # Abbrev [8] 0x10f:0x4a DW_TAG_subprogram
	.word	.Lfunc_begin1           # DW_AT_low_pc
	.word	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	9                       # Abbrev [9] 0x120:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	116
	.word	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
	.word	591                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0x12e:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	112
	.word	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0x13c:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	108
	.word	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x14a:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	104
	.word	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	37                      # DW_AT_decl_line
	.word	591                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	11                      # Abbrev [11] 0x159:0x32 DW_TAG_subprogram
	.word	.Lfunc_begin2           # DW_AT_low_pc
	.word	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.word	60                      # DW_AT_type
                                        # DW_AT_external
	.byte	9                       # Abbrev [9] 0x16e:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	116
	.word	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
	.word	60                      # DW_AT_type
	.byte	10                      # Abbrev [10] 0x17c:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	112
	.word	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	53                      # DW_AT_decl_line
	.word	60                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	8                       # Abbrev [8] 0x18b:0xc4 DW_TAG_subprogram
	.word	.Lfunc_begin3           # DW_AT_low_pc
	.word	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	91                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	10                      # Abbrev [10] 0x19c:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	116
	.word	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	93                      # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x1aa:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	112
	.word	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	93                      # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x1b8:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	108
	.word	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	93                      # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x1c6:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	104
	.word	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	95                      # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x1d4:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	100
	.word	.Linfo_string28         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	95                      # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x1e2:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	96
	.word	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	95                      # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x1f0:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	92
	.word	.Linfo_string30         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	99                      # DW_AT_decl_line
	.word	591                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x1fe:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	88
	.word	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	99                      # DW_AT_decl_line
	.word	591                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x20c:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	84
	.word	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	99                      # DW_AT_decl_line
	.word	591                     # DW_AT_type
	.byte	12                      # Abbrev [12] 0x21a:0x34 DW_TAG_lexical_block
	.word	.Ltmp28                 # DW_AT_low_pc
	.word	.Ltmp35-.Ltmp28         # DW_AT_high_pc
	.byte	10                      # Abbrev [10] 0x223:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	72
	.word	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	119                     # DW_AT_decl_line
	.word	598                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x231:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	68
	.word	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	120                     # DW_AT_decl_line
	.word	60                      # DW_AT_type
	.byte	10                      # Abbrev [10] 0x23f:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	64
	.word	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	129                     # DW_AT_decl_line
	.word	60                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	4                       # Abbrev [4] 0x24f:0x7 DW_TAG_base_type
	.word	.Linfo_string20         # DW_AT_name
	.byte	7                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	5                       # Abbrev [5] 0x256:0xc DW_TAG_array_type
	.word	60                      # DW_AT_type
	.byte	13                      # Abbrev [13] 0x25b:0x6 DW_TAG_subrange_type
	.word	201                     # DW_AT_type
	.byte	3                       # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
.Ldebug_info_end0:
	.ident	"clang version 10.0.0-4ubuntu1 "
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym get_time
	.addrsig_sym set_motor
	.addrsig_sym raiz
	.addrsig_sym get_position
	.addrsig_sym magVel2D
	.section	.debug_line,"",@progbits
.Lline_table_start0:
