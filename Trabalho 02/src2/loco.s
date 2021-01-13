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
	.p2align	2               # -- Begin function user_code
.LCPI2_0:
	.word	1067030938              # float 1.20000005
.LCPI2_1:
	.word	1056964608              # float 0.5
	.text
	.globl	user_code
	.p2align	1
	.type	user_code,@function
user_code:                              # @user_code
.Lfunc_begin2:
	.loc	1 69 0                  # loco.c:69:0
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sw	ra, 44(sp)
	sw	s0, 40(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 48
	.cfi_def_cfa s0, 0
	addi	a0, zero, 128
.Ltmp12:
	.loc	1 71 9 prologue_end     # loco.c:71:9
	sw	a0, -12(s0)
	mv	a0, zero
	.loc	1 72 9                  # loco.c:72:9
	sw	a0, -16(s0)
	.loc	1 74 25                 # loco.c:74:25
	call	get_time
	.loc	1 74 18 is_stmt 0       # loco.c:74:18
	sw	a0, -20(s0)
	.loc	1 76 32 is_stmt 1       # loco.c:76:32
	lw	a0, -20(s0)
	.loc	1 76 18 is_stmt 0       # loco.c:76:18
	sw	a0, -24(s0)
	.loc	1 78 5 is_stmt 1        # loco.c:78:5
	j	.LBB2_1
.LBB2_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_2 Depth 2
.Ltmp13:
	.loc	1 81 9                  # loco.c:81:9
	lui	a0, %hi(lum)
	addi	a0, a0, %lo(lum)
	call	read_sensors
	mv	a0, zero
	.loc	1 83 13                 # loco.c:83:13
	sw	a0, -28(s0)
	.loc	1 84 29                 # loco.c:84:29
	lw	a1, -12(s0)
	.loc	1 84 13 is_stmt 0       # loco.c:84:13
	sw	a1, -32(s0)
	.loc	1 85 16 is_stmt 1       # loco.c:85:16
	sw	a0, -12(s0)
.Ltmp14:
	.loc	1 87 17                 # loco.c:87:17
	sw	a0, -36(s0)
	.loc	1 87 13 is_stmt 0       # loco.c:87:13
	j	.LBB2_2
.LBB2_2:                                #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp15:
	.loc	1 87 24                 # loco.c:87:24
	lw	a0, -36(s0)
	addi	a1, zero, 255
.Ltmp16:
	.loc	1 87 9                  # loco.c:87:9
	blt	a1, a0, .LBB2_8
	j	.LBB2_3
.LBB2_3:                                #   in Loop: Header=BB2_2 Depth=2
.Ltmp17:
	.loc	1 89 20 is_stmt 1       # loco.c:89:20
	lw	a0, -36(s0)
	.loc	1 89 16 is_stmt 0       # loco.c:89:16
	lui	a1, %hi(lum)
	addi	a1, a1, %lo(lum)
	add	a0, a0, a1
	lbu	a0, 0(a0)
	addi	a1, zero, 126
	.loc	1 89 27                 # loco.c:89:27
	blt	a0, a1, .LBB2_6
	j	.LBB2_4
.LBB2_4:                                #   in Loop: Header=BB2_2 Depth=2
	.loc	1 89 34                 # loco.c:89:34
	lw	a0, -36(s0)
	.loc	1 89 30                 # loco.c:89:30
	lui	a1, %hi(lum)
	addi	a1, a1, %lo(lum)
	add	a0, a0, a1
	lbu	a0, 0(a0)
	addi	a1, zero, 149
.Ltmp18:
	.loc	1 89 16                 # loco.c:89:16
	blt	a1, a0, .LBB2_6
	j	.LBB2_5
.LBB2_5:                                #   in Loop: Header=BB2_2 Depth=2
.Ltmp19:
	.loc	1 91 19 is_stmt 1       # loco.c:91:19
	lw	a0, -28(s0)
	addi	a0, a0, 1
	sw	a0, -28(s0)
	.loc	1 92 27                 # loco.c:92:27
	lw	a0, -36(s0)
	.loc	1 92 24 is_stmt 0       # loco.c:92:24
	lw	a1, -12(s0)
	add	a0, a0, a1
	sw	a0, -12(s0)
	.loc	1 93 13 is_stmt 1       # loco.c:93:13
	j	.LBB2_6
.Ltmp20:
.LBB2_6:                                #   in Loop: Header=BB2_2 Depth=2
	.loc	1 94 9                  # loco.c:94:9
	j	.LBB2_7
.Ltmp21:
.LBB2_7:                                #   in Loop: Header=BB2_2 Depth=2
	.loc	1 87 32                 # loco.c:87:32
	lw	a0, -36(s0)
	addi	a0, a0, 1
	sw	a0, -36(s0)
	.loc	1 87 9 is_stmt 0        # loco.c:87:9
	j	.LBB2_2
.Ltmp22:
.LBB2_8:                                #   in Loop: Header=BB2_1 Depth=1
	.loc	1 96 12 is_stmt 1       # loco.c:96:12
	lw	a0, -28(s0)
	addi	a1, zero, 26
.Ltmp23:
	.loc	1 96 12 is_stmt 0       # loco.c:96:12
	blt	a0, a1, .LBB2_10
	j	.LBB2_9
.LBB2_9:                                #   in Loop: Header=BB2_1 Depth=1
.Ltmp24:
	.loc	1 98 23 is_stmt 1       # loco.c:98:23
	lw	a0, -28(s0)
	.loc	1 98 20 is_stmt 0       # loco.c:98:20
	lw	a1, -12(s0)
	div	a0, a1, a0
	sw	a0, -12(s0)
	.loc	1 99 9 is_stmt 1        # loco.c:99:9
	j	.LBB2_11
.Ltmp25:
.LBB2_10:                               #   in Loop: Header=BB2_1 Depth=1
	.loc	1 102 22                # loco.c:102:22
	lw	a0, -32(s0)
	.loc	1 102 20 is_stmt 0      # loco.c:102:20
	sw	a0, -12(s0)
	j	.LBB2_11
.Ltmp26:
.LBB2_11:                               #   in Loop: Header=BB2_1 Depth=1
	.loc	1 107 35 is_stmt 1      # loco.c:107:35
	call	get_time
	.loc	1 107 22 is_stmt 0      # loco.c:107:22
	sw	a0, -40(s0)
	.loc	1 110 20 is_stmt 1      # loco.c:110:20
	lw	a0, -12(s0)
	.loc	1 110 27 is_stmt 0      # loco.c:110:27
	addi	a0, a0, -128
	.loc	1 110 13                # loco.c:110:13
	sw	a0, -44(s0)
	.loc	1 112 27 is_stmt 1      # loco.c:112:27
	lw	a0, -44(s0)
	fcvt.s.w	ft0, a0
	lui	a0, %hi(.LCPI2_0)
	addi	a0, a0, %lo(.LCPI2_0)
	flw	ft1, 0(a0)
	.loc	1 112 26 is_stmt 0      # loco.c:112:26
	fmul.s	ft0, ft0, ft1
	.loc	1 112 24                # loco.c:112:24
	fcvt.w.s	a0, ft0, rtz
	.loc	1 112 13                # loco.c:112:13
	sw	a0, -48(s0)
	.loc	1 114 26 is_stmt 1      # loco.c:114:26
	lw	a0, -44(s0)
	.loc	1 114 31 is_stmt 0      # loco.c:114:31
	lw	a1, -16(s0)
	.loc	1 114 30                # loco.c:114:30
	sub	a0, a0, a1
	.loc	1 114 24                # loco.c:114:24
	fcvt.s.w	ft0, a0
	lui	a0, %hi(.LCPI2_1)
	addi	a0, a0, %lo(.LCPI2_1)
	flw	ft1, 0(a0)
	.loc	1 114 23                # loco.c:114:23
	fmul.s	ft0, ft0, ft1
	.loc	1 114 18                # loco.c:114:18
	lw	a0, -48(s0)
	fcvt.s.w	ft1, a0
	fadd.s	ft0, ft1, ft0
	fcvt.w.s	a0, ft0, rtz
	sw	a0, -48(s0)
.Ltmp27:
	.loc	1 117 12 is_stmt 1      # loco.c:117:12
	lw	a0, -48(s0)
	addi	a1, zero, 81
.Ltmp28:
	.loc	1 117 12 is_stmt 0      # loco.c:117:12
	blt	a0, a1, .LBB2_13
	j	.LBB2_12
.LBB2_12:                               #   in Loop: Header=BB2_1 Depth=1
	.loc	1 0 12                  # loco.c:0:12
	addi	a0, zero, 80
.Ltmp29:
	.loc	1 119 22 is_stmt 1      # loco.c:119:22
	sw	a0, -48(s0)
	.loc	1 120 9                 # loco.c:120:9
	j	.LBB2_16
.Ltmp30:
.LBB2_13:                               #   in Loop: Header=BB2_1 Depth=1
	.loc	1 121 17                # loco.c:121:17
	lw	a0, -48(s0)
	addi	a1, zero, -81
.Ltmp31:
	.loc	1 121 17 is_stmt 0      # loco.c:121:17
	blt	a1, a0, .LBB2_15
	j	.LBB2_14
.LBB2_14:                               #   in Loop: Header=BB2_1 Depth=1
	.loc	1 0 17                  # loco.c:0:17
	addi	a0, zero, -80
.Ltmp32:
	.loc	1 123 22 is_stmt 1      # loco.c:123:22
	sw	a0, -48(s0)
	.loc	1 124 9                 # loco.c:124:9
	j	.LBB2_15
.Ltmp33:
.LBB2_15:                               #   in Loop: Header=BB2_1 Depth=1
	.loc	1 0 9 is_stmt 0         # loco.c:0:9
	j	.LBB2_16
.LBB2_16:                               #   in Loop: Header=BB2_1 Depth=1
.Ltmp34:
	.loc	1 127 12 is_stmt 1      # loco.c:127:12
	lw	a0, -40(s0)
	.loc	1 127 25 is_stmt 0      # loco.c:127:25
	lw	a1, -20(s0)
	.loc	1 127 23                # loco.c:127:23
	sub	a0, a0, a1
	addi	a1, zero, 599
.Ltmp35:
	.loc	1 127 12                # loco.c:127:12
	bltu	a1, a0, .LBB2_18
	j	.LBB2_17
.LBB2_17:                               #   in Loop: Header=BB2_1 Depth=1
.Ltmp36:
	.loc	1 129 26 is_stmt 1      # loco.c:129:26
	lbu	a1, -48(s0)
	addi	a0, zero, 1
	.loc	1 129 13 is_stmt 0      # loco.c:129:13
	call	set_motor
	.loc	1 130 9 is_stmt 1       # loco.c:130:9
	j	.LBB2_22
.Ltmp37:
.LBB2_18:                               #   in Loop: Header=BB2_1 Depth=1
	.loc	1 131 18                # loco.c:131:18
	lw	a0, -40(s0)
	.loc	1 131 31 is_stmt 0      # loco.c:131:31
	lw	a1, -20(s0)
	.loc	1 131 29                # loco.c:131:29
	sub	a0, a0, a1
	addi	a1, zero, 999
.Ltmp38:
	.loc	1 131 18                # loco.c:131:18
	bltu	a1, a0, .LBB2_20
	j	.LBB2_19
.LBB2_19:                               #   in Loop: Header=BB2_1 Depth=1
.Ltmp39:
	.loc	1 133 26 is_stmt 1      # loco.c:133:26
	lbu	a1, -48(s0)
	mv	a0, zero
	.loc	1 133 13 is_stmt 0      # loco.c:133:13
	call	set_motor
	.loc	1 134 9 is_stmt 1       # loco.c:134:9
	j	.LBB2_21
.Ltmp40:
.LBB2_20:                               #   in Loop: Header=BB2_1 Depth=1
	.loc	1 137 20                # loco.c:137:20
	lw	a0, -40(s0)
	.loc	1 137 18 is_stmt 0      # loco.c:137:18
	sw	a0, -20(s0)
	.loc	1 138 26 is_stmt 1      # loco.c:138:26
	lbu	a1, -48(s0)
	addi	a0, zero, 1
	.loc	1 138 13 is_stmt 0      # loco.c:138:13
	call	set_motor
	j	.LBB2_21
.Ltmp41:
.LBB2_21:                               #   in Loop: Header=BB2_1 Depth=1
	.loc	1 0 13                  # loco.c:0:13
	j	.LBB2_22
.LBB2_22:                               #   in Loop: Header=BB2_1 Depth=1
	.loc	1 141 23 is_stmt 1      # loco.c:141:23
	lw	a0, -44(s0)
	.loc	1 141 21 is_stmt 0      # loco.c:141:21
	sw	a0, -16(s0)
	.loc	1 142 23 is_stmt 1      # loco.c:142:23
	lw	a0, -40(s0)
	.loc	1 142 21 is_stmt 0      # loco.c:142:21
	sw	a0, -24(s0)
.Ltmp42:
	.loc	1 78 5 is_stmt 1        # loco.c:78:5
	j	.LBB2_1
.Ltmp43:
.Lfunc_end2:
	.size	user_code, .Lfunc_end2-user_code
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

	.type	lum,@object             # @lum
	.comm	lum,256,1
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
	.asciz	"accel"                 # string offset=125
.Linfo_string9:
	.asciz	"steering"              # string offset=131
.Linfo_string10:
	.asciz	"lum"                   # string offset=140
.Linfo_string11:
	.asciz	"unsigned char"         # string offset=144
.Linfo_string12:
	.asciz	"__ARRAY_SIZE_TYPE__"   # string offset=158
.Linfo_string13:
	.asciz	"delay"                 # string offset=178
.Linfo_string14:
	.asciz	"delayMotor"            # string offset=184
.Linfo_string15:
	.asciz	"user_code"             # string offset=195
.Linfo_string16:
	.asciz	"duracao"               # string offset=205
.Linfo_string17:
	.asciz	"unsigned int"          # string offset=213
.Linfo_string18:
	.asciz	"time"                  # string offset=226
.Linfo_string19:
	.asciz	"centro"                # string offset=231
.Linfo_string20:
	.asciz	"ultimo_erro"           # string offset=238
.Linfo_string21:
	.asciz	"ultimo_time"           # string offset=250
.Linfo_string22:
	.asciz	"n"                     # string offset=262
.Linfo_string23:
	.asciz	"ultimo_centro"         # string offset=264
.Linfo_string24:
	.asciz	"i"                     # string offset=278
.Linfo_string25:
	.asciz	"time_atual"            # string offset=280
.Linfo_string26:
	.asciz	"erro"                  # string offset=291
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
	.byte	11                      # DW_TAG_lexical_block
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
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
	.byte	1                       # Abbrev [1] 0xb:0x1e6 DW_TAG_compile_unit
	.word	.Linfo_string0          # DW_AT_producer
	.half	12                      # DW_AT_language
	.word	.Linfo_string1          # DW_AT_name
	.word	.Lline_table_start0     # DW_AT_stmt_list
	.word	.Linfo_string2          # DW_AT_comp_dir
	.word	.Lfunc_begin0           # DW_AT_low_pc
	.word	.Lfunc_end2-.Lfunc_begin0 # DW_AT_high_pc
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
	.word	106                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.byte	5                       # DW_AT_location
	.byte	3
	.word	accel
	.byte	2                       # Abbrev [2] 0x82:0x11 DW_TAG_variable
	.word	.Linfo_string9          # DW_AT_name
	.word	106                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.byte	5                       # DW_AT_location
	.byte	3
	.word	steering
	.byte	2                       # Abbrev [2] 0x93:0x11 DW_TAG_variable
	.word	.Linfo_string10         # DW_AT_name
	.word	164                     # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_decl_file
	.byte	6                       # DW_AT_decl_line
	.byte	5                       # DW_AT_location
	.byte	3
	.word	lum
	.byte	5                       # Abbrev [5] 0xa4:0xd DW_TAG_array_type
	.word	177                     # DW_AT_type
	.byte	6                       # Abbrev [6] 0xa9:0x7 DW_TAG_subrange_type
	.word	184                     # DW_AT_type
	.half	256                     # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	4                       # Abbrev [4] 0xb1:0x7 DW_TAG_base_type
	.word	.Linfo_string11         # DW_AT_name
	.byte	8                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	7                       # Abbrev [7] 0xb8:0x7 DW_TAG_base_type
	.word	.Linfo_string12         # DW_AT_name
	.byte	8                       # DW_AT_byte_size
	.byte	7                       # DW_AT_encoding
	.byte	8                       # Abbrev [8] 0xbf:0x2e DW_TAG_subprogram
	.word	.Lfunc_begin0           # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	19                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	9                       # Abbrev [9] 0xd0:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	116
	.word	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	19                      # DW_AT_decl_line
	.word	489                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0xde:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	112
	.word	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	21                      # DW_AT_decl_line
	.word	489                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	8                       # Abbrev [8] 0xed:0x4a DW_TAG_subprogram
	.word	.Lfunc_begin1           # DW_AT_low_pc
	.word	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	9                       # Abbrev [9] 0xfe:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	116
	.word	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
	.word	489                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0x10c:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	112
	.word	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	9                       # Abbrev [9] 0x11a:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	108
	.word	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x128:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	104
	.word	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	37                      # DW_AT_decl_line
	.word	489                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	8                       # Abbrev [8] 0x137:0xb2 DW_TAG_subprogram
	.word	.Lfunc_begin2           # DW_AT_low_pc
	.word	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	68                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	10                      # Abbrev [10] 0x148:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	116
	.word	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	71                      # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x156:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	112
	.word	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	72                      # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x164:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	108
	.word	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	74                      # DW_AT_decl_line
	.word	489                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x172:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	104
	.word	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	76                      # DW_AT_decl_line
	.word	489                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x180:0x68 DW_TAG_lexical_block
	.word	.Ltmp13                 # DW_AT_low_pc
	.word	.Ltmp42-.Ltmp13         # DW_AT_high_pc
	.byte	10                      # Abbrev [10] 0x189:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	100
	.word	.Linfo_string22         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	83                      # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x197:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	96
	.word	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	84                      # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x1a5:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	88
	.word	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	107                     # DW_AT_decl_line
	.word	489                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x1b3:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	84
	.word	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	110                     # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	10                      # Abbrev [10] 0x1c1:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	80
	.word	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	112                     # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	11                      # Abbrev [11] 0x1cf:0x18 DW_TAG_lexical_block
	.word	.Ltmp14                 # DW_AT_low_pc
	.word	.Ltmp22-.Ltmp14         # DW_AT_high_pc
	.byte	10                      # Abbrev [10] 0x1d8:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	92
	.word	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	87                      # DW_AT_decl_line
	.word	106                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	4                       # Abbrev [4] 0x1e9:0x7 DW_TAG_base_type
	.word	.Linfo_string17         # DW_AT_name
	.byte	7                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	0                       # End Of Children Mark
.Ldebug_info_end0:
	.ident	"clang version 10.0.0-4ubuntu1 "
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym get_time
	.addrsig_sym set_motor
	.addrsig_sym read_sensors
	.addrsig_sym lum
	.section	.debug_line,"",@progbits
.Lline_table_start0:
