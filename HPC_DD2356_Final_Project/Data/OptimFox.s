	.file	"optimFox.c"
# GNU C11 (Ubuntu 7.5.0-3ubuntu1~18.04) version 7.5.0 (x86_64-linux-gnu)
#	compiled by GNU C version 7.5.0, GMP version 6.1.2, MPFR version 4.0.1, MPC version 1.1.0, isl version isl-0.19-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -I /usr/include/mpich -imultiarch x86_64-linux-gnu
# optimFox.c -march=haswell -O3 -fverbose-asm -fstack-protector-strong
# -Wformat -Wformat-security
# options enabled:  -fPIC -fPIE -faggressive-loop-optimizations
# -falign-labels -fasynchronous-unwind-tables -fauto-inc-dec
# -fbranch-count-reg -fcaller-saves -fchkp-check-incomplete-type
# -fchkp-check-read -fchkp-check-write -fchkp-instrument-calls
# -fchkp-narrow-bounds -fchkp-optimize -fchkp-store-bounds
# -fchkp-use-static-bounds -fchkp-use-static-const-bounds
# -fchkp-use-wrappers -fcode-hoisting -fcombine-stack-adjustments -fcommon
# -fcompare-elim -fcprop-registers -fcrossjumping -fcse-follow-jumps
# -fdefer-pop -fdelete-null-pointer-checks -fdevirtualize
# -fdevirtualize-speculatively -fdwarf2-cfi-asm -fearly-inlining
# -feliminate-unused-debug-types -fexpensive-optimizations
# -fforward-propagate -ffp-int-builtin-inexact -ffunction-cse -fgcse
# -fgcse-after-reload -fgcse-lm -fgnu-runtime -fgnu-unique
# -fguess-branch-probability -fhoist-adjacent-loads -fident -fif-conversion
# -fif-conversion2 -findirect-inlining -finline -finline-atomics
# -finline-functions -finline-functions-called-once
# -finline-small-functions -fipa-bit-cp -fipa-cp -fipa-cp-clone -fipa-icf
# -fipa-icf-functions -fipa-icf-variables -fipa-profile -fipa-pure-const
# -fipa-ra -fipa-reference -fipa-sra -fipa-vrp -fira-hoist-pressure
# -fira-share-save-slots -fira-share-spill-slots
# -fisolate-erroneous-paths-dereference -fivopts -fkeep-static-consts
# -fleading-underscore -flifetime-dse -flra-remat -flto-odr-type-merging
# -fmath-errno -fmerge-constants -fmerge-debug-strings
# -fmove-loop-invariants -fomit-frame-pointer -foptimize-sibling-calls
# -foptimize-strlen -fpartial-inlining -fpeel-loops -fpeephole -fpeephole2
# -fplt -fpredictive-commoning -fprefetch-loop-arrays -free
# -freg-struct-return -freorder-blocks -freorder-functions
# -frerun-cse-after-loop -fsched-critical-path-heuristic
# -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
# -fsched-last-insn-heuristic -fsched-rank-heuristic -fsched-spec
# -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fschedule-fusion
# -fschedule-insns2 -fsemantic-interposition -fshow-column -fshrink-wrap
# -fshrink-wrap-separate -fsigned-zeros -fsplit-ivs-in-unroller
# -fsplit-loops -fsplit-paths -fsplit-wide-types -fssa-backprop
# -fssa-phiopt -fstack-protector-strong -fstdarg-opt -fstore-merging
# -fstrict-aliasing -fstrict-overflow -fstrict-volatile-bitfields
# -fsync-libcalls -fthread-jumps -ftoplevel-reorder -ftrapping-math
# -ftree-bit-ccp -ftree-builtin-call-dce -ftree-ccp -ftree-ch
# -ftree-coalesce-vars -ftree-copy-prop -ftree-cselim -ftree-dce
# -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
# -ftree-loop-distribute-patterns -ftree-loop-if-convert -ftree-loop-im
# -ftree-loop-ivcanon -ftree-loop-optimize -ftree-loop-vectorize
# -ftree-parallelize-loops= -ftree-partial-pre -ftree-phiprop -ftree-pre
# -ftree-pta -ftree-reassoc -ftree-scev-cprop -ftree-sink
# -ftree-slp-vectorize -ftree-slsr -ftree-sra -ftree-switch-conversion
# -ftree-tail-merge -ftree-ter -ftree-vrp -funit-at-a-time -funswitch-loops
# -funwind-tables -fverbose-asm -fzero-initialized-in-bss
# -m128bit-long-double -m64 -m80387 -maes -malign-stringops -mavx -mavx2
# -mbmi -mbmi2 -mcx16 -mf16c -mfancy-math-387 -mfma -mfp-ret-in-387
# -mfsgsbase -mfxsr -mglibc -mhle -mieee-fp -mlong-double-80 -mlzcnt -mmmx
# -mmovbe -mpclmul -mpopcnt -mpush-args -mrdrnd -mred-zone -msahf -msse
# -msse2 -msse3 -msse4 -msse4.1 -msse4.2 -mssse3 -mstv
# -mtls-direct-seg-refs -mvzeroupper -mxsave -mxsaveopt

	.text
	.p2align 4,,15
	.globl	InitiateMatrix
	.type	InitiateMatrix, @function
InitiateMatrix:
.LFB52:
	.cfi_startproc
	pushq	%r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
# optimFox.c:30:     srand(time(NULL) + 14876);
	xorl	%edi, %edi	#
	xorl	%r13d, %r13d	# ivtmp.54
# optimFox.c:29: {
	pushq	%r12	#
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	MatA(%rip), %r12	#, tmp136
	pushq	%rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	leaq	MatB(%rip), %rbp	#, tmp137
	pushq	%rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 48
# optimFox.c:30:     srand(time(NULL) + 14876);
	call	time@PLT	#
	leal	14876(%rax), %edi	#, tmp126
	call	srand@PLT	#
	.p2align 4,,10
	.p2align 3
.L2:
	leaq	48(%r13), %rbx	#, _33
	.p2align 4,,10
	.p2align 3
.L3:
# optimFox.c:35:             MatA[i][j] = (double) random() / (double) RAND_MAX;
	call	random@PLT	#
	vxorpd	%xmm0, %xmm0, %xmm0	# tmp128
	vcvtsi2sdq	%rax, %xmm0, %xmm0	# _4, tmp128, tmp128
	vdivsd	.LC0(%rip), %xmm0, %xmm0	#, tmp128, tmp129
	vmovsd	%xmm0, (%r12,%r13)	# tmp129, MEM[symbol: MatA, index: ivtmp.46_28, offset: 0B]
# optimFox.c:36:             MatB[i][j] = (double) random() / (double) RAND_MAX;
	call	random@PLT	#
	vxorpd	%xmm0, %xmm0, %xmm0	# tmp132
	vcvtsi2sdq	%rax, %xmm0, %xmm0	# _7, tmp132, tmp132
	vdivsd	.LC0(%rip), %xmm0, %xmm0	#, tmp132, tmp133
	vmovsd	%xmm0, 0(%rbp,%r13)	# tmp133, MEM[symbol: MatB, index: ivtmp.46_28, offset: 0B]
	addq	$8, %r13	#, ivtmp.54
# optimFox.c:33:         for(int j = 0; j < N ; j++)
	cmpq	%rbx, %r13	# _33, ivtmp.54
	jne	.L3	#,
# optimFox.c:31:     for(int i = 0; i < N ; i++)
	cmpq	$288, %r13	#, ivtmp.54
	jne	.L2	#,
# optimFox.c:48: }
	addq	$8, %rsp	#,
	.cfi_def_cfa_offset 40
	popq	%rbx	#
	.cfi_def_cfa_offset 32
	popq	%rbp	#
	.cfi_def_cfa_offset 24
	popq	%r12	#
	.cfi_def_cfa_offset 16
	popq	%r13	#
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE52:
	.size	InitiateMatrix, .-InitiateMatrix
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"%.6f\t"
	.text
	.p2align 4,,15
	.globl	PrintMatrix
	.type	PrintMatrix, @function
PrintMatrix:
.LFB53:
	.cfi_startproc
	pushq	%r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	288(%rdi), %r13	#, _29
	pushq	%r12	#
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC1(%rip), %r12	#, tmp99
# optimFox.c:51: {
	pushq	%rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx	# Mat, ivtmp.71
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 48
	.p2align 4,,10
	.p2align 3
.L10:
	leaq	48(%rbx), %rbp	#, _16
	.p2align 4,,10
	.p2align 3
.L11:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vmovsd	(%rbx), %xmm0	# MEM[base: _7, offset: 0B],
	movq	%r12, %rsi	# tmp99,
	movl	$1, %edi	#,
	addq	$8, %rbx	#, ivtmp.71
	movl	$1, %eax	#,
	call	__printf_chk@PLT	#
# optimFox.c:54:         for(int j = 0; j < N ; j++)
	cmpq	%rbx, %rbp	# ivtmp.71, _16
	jne	.L11	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$10, %edi	#,
	call	putchar@PLT	#
# optimFox.c:52:     for(int i = 0; i < N ; i++)
	cmpq	%r13, %rbp	# _29, _16
	jne	.L10	#,
# optimFox.c:60: }
	addq	$8, %rsp	#,
	.cfi_def_cfa_offset 40
	popq	%rbx	#
	.cfi_def_cfa_offset 32
	popq	%rbp	#
	.cfi_def_cfa_offset 24
	popq	%r12	#
	.cfi_def_cfa_offset 16
	popq	%r13	#
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE53:
	.size	PrintMatrix, .-PrintMatrix
	.section	.rodata.str1.1
.LC4:
	.string	"The results Matches"
.LC5:
	.string	"The results do not match"
	.text
	.p2align 4,,15
	.globl	Debug
	.type	Debug, @function
Debug:
.LFB54:
	.cfi_startproc
	pushq	%r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	16(%rsp), %r13	#,
	.cfi_def_cfa 13, 0
	andq	$-32, %rsp	#,
	pushq	-8(%r13)	#
	pushq	%rbp	#
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp	#,
	pushq	%r13	#
	.cfi_escape 0xf,0x3,0x76,0x78,0x6
	subq	$616, %rsp	#,
	vmovsd	16+MatB(%rip), %xmm4	# MatB, tmp591
	vmovsd	32+MatB(%rip), %xmm3	# MatB, tmp590
	vmovsd	48+MatB(%rip), %xmm1	# MatB, tmp597
	vmovsd	128+MatB(%rip), %xmm2	# MatB, tmp598
	vmovhpd	24+MatB(%rip), %xmm4, %xmm0	# MatB, tmp591, tmp327
	vmovsd	MatB(%rip), %xmm4	# MatB, tmp593
	vmovhpd	40+MatB(%rip), %xmm3, %xmm9	# MatB, tmp590, tmp326
	vmovsd	80+MatB(%rip), %xmm5	# MatB, tmp594
# optimFox.c:62: void Debug(){
	movq	%fs:40, %rax	#, tmp587
	movq	%rax, -24(%rbp)	# tmp587, D.9831
	xorl	%eax, %eax	# tmp587
	vinsertf128	$0x1, %xmm9, %ymm0, %ymm3	# tmp326, tmp327, tmp325
	vmovsd	96+MatB(%rip), %xmm7	# MatB, tmp601
	vmovhpd	8+MatB(%rip), %xmm4, %xmm12	# MatB, tmp593, tmp329
	vmovsd	64+MatB(%rip), %xmm4	# MatB, tmp595
	vmovhpd	88+MatB(%rip), %xmm5, %xmm8	# MatB, tmp594, tmp335
	vmovapd	%ymm3, -368(%rbp)	# tmp325, %sfp
	vinsertf128	$0x1, %xmm12, %ymm9, %ymm9	# tmp329, tmp326, tmp328
	vinsertf128	$0x1, %xmm0, %ymm12, %ymm12	# tmp327, tmp329, tmp331
	vmovhpd	104+MatB(%rip), %xmm7, %xmm3	# MatB, tmp601, tmp347
	vmovsd	176+MatB(%rip), %xmm7	# MatB, tmp602
	vmovhpd	72+MatB(%rip), %xmm4, %xmm0	# MatB, tmp595, tmp336
	vmovhpd	56+MatB(%rip), %xmm1, %xmm4	# MatB, tmp597, tmp338
	vmovhpd	136+MatB(%rip), %xmm2, %xmm1	# MatB, tmp598, tmp344
	vmovsd	112+MatB(%rip), %xmm2	# MatB, tmp599
	vinsertf128	$0x1, %xmm8, %ymm0, %ymm5	# tmp335, tmp336, tmp334
	vinsertf128	$0x1, %xmm4, %ymm8, %ymm8	# tmp338, tmp335, tmp337
	vinsertf128	$0x1, %xmm0, %ymm4, %ymm4	# tmp336, tmp338, tmp340
	vmovhpd	120+MatB(%rip), %xmm2, %xmm0	# MatB, tmp599, tmp345
	vmovapd	%ymm5, -400(%rbp)	# tmp334, %sfp
	vinsertf128	$0x1, %xmm1, %ymm0, %ymm2	# tmp344, tmp345, tmp343
	vinsertf128	$0x1, %xmm3, %ymm1, %ymm1	# tmp347, tmp344, tmp346
	vinsertf128	$0x1, %xmm0, %ymm3, %ymm3	# tmp345, tmp347, tmp349
	vmovapd	%ymm2, -432(%rbp)	# tmp343, %sfp
	vmovhpd	184+MatB(%rip), %xmm7, %xmm2	# MatB, tmp602, tmp353
	vmovsd	160+MatB(%rip), %xmm7	# MatB, tmp603
	vmovhpd	168+MatB(%rip), %xmm7, %xmm0	# MatB, tmp603, tmp354
	vinsertf128	$0x1, %xmm2, %ymm0, %ymm7	# tmp353, tmp354, tmp352
	vmovapd	%ymm7, -464(%rbp)	# tmp352, %sfp
	vmovsd	144+MatB(%rip), %xmm6	# MatB, tmp605
	vmovsd	192+MatB(%rip), %xmm10	# MatB, tmp610
	vmovhpd	152+MatB(%rip), %xmm6, %xmm11	# MatB, tmp605, tmp356
	vmovsd	224+MatB(%rip), %xmm6	# MatB, tmp607
	vinsertf128	$0x1, %xmm11, %ymm2, %ymm15	# tmp356, tmp353, tmp355
	vinsertf128	$0x1, %xmm0, %ymm11, %ymm11	# tmp354, tmp356, tmp358
	vmovhpd	200+MatB(%rip), %xmm10, %xmm2	# MatB, tmp610, tmp365
	vmovhpd	232+MatB(%rip), %xmm6, %xmm5	# MatB, tmp607, tmp362
	vmovsd	208+MatB(%rip), %xmm6	# MatB, tmp608
	vinsertf128	$0x1, %xmm2, %ymm5, %ymm10	# tmp365, tmp362, tmp364
	vmovhpd	216+MatB(%rip), %xmm6, %xmm0	# MatB, tmp608, tmp363
	vmovapd	%ymm10, -528(%rbp)	# tmp364, %sfp
	vmovapd	240+MatB(%rip), %xmm10	# MatB, tmp374
	vinsertf128	$0x1, %xmm0, %ymm2, %ymm2	# tmp363, tmp365, tmp367
	vinsertf128	$0x1, %xmm5, %ymm0, %ymm6	# tmp362, tmp363, tmp361
	vmovsd	272+MatB(%rip), %xmm0	# MatB, tmp612
	vmovapd	%ymm6, -496(%rbp)	# tmp361, %sfp
# optimFox.c:80:                 mult[i][j] += MatA[i][k] * MatB[k][j];
	vmovupd	MatA(%rip), %ymm6	# MEM[(double *)&MatA], MEM[(double *)&MatA]
	vmovhpd	280+MatB(%rip), %xmm0, %xmm5	# MatB, tmp612, tmp371
	vmovapd	256+MatB(%rip), %xmm0	# MatB, tmp372
	vpermpd	$0, %ymm6, %ymm13	#, MEM[(double *)&MatA], vect__178.86
	vpermpd	$85, %ymm6, %ymm14	#, MEM[(double *)&MatA], vect__184.96
	vinsertf128	$0x1, %xmm5, %ymm0, %ymm7	# tmp371, tmp372, tmp370
	vinsertf128	$0x1, %xmm10, %ymm5, %ymm5	# tmp374, tmp371, tmp373
	vinsertf128	$0x1, %xmm0, %ymm10, %ymm10	# tmp372, tmp374, tmp376
	vmovupd	32+MatA(%rip), %ymm0	# MEM[(double *)&MatA + 32B], MEM[(double *)&MatA + 32B]
	vmovapd	%ymm5, -592(%rbp)	# tmp373, %sfp
	vxorpd	%xmm5, %xmm5, %xmm5	# tmp387
	vfmadd132pd	%ymm12, %ymm5, %ymm13	# tmp331, tmp387, vect__181.90
	vmovapd	%ymm7, -560(%rbp)	# tmp370, %sfp
	vmovupd	64+MatA(%rip), %ymm7	# MEM[(double *)&MatA + 64B], MEM[(double *)&MatA + 64B]
	vfmadd231pd	%ymm14, %ymm4, %ymm13	# vect__184.96, tmp340, vect__187.100
	vpermpd	$170, %ymm6, %ymm14	#, MEM[(double *)&MatA], vect__190.106
	vfmadd231pd	%ymm14, %ymm3, %ymm13	# vect__190.106, tmp349, vect__193.110
	vpermpd	$255, %ymm6, %ymm14	#, MEM[(double *)&MatA], vect__196.116
	vfmadd231pd	%ymm14, %ymm11, %ymm13	# vect__196.116, tmp358, vect__199.120
	vpermpd	$0, %ymm0, %ymm14	#, MEM[(double *)&MatA + 32B], vect__202.126
	vfmadd231pd	%ymm14, %ymm2, %ymm13	# vect__202.126, tmp367, vect__205.130
	vpermpd	$85, %ymm0, %ymm14	#, MEM[(double *)&MatA + 32B], vect__208.136
	vfmadd231pd	%ymm14, %ymm10, %ymm13	# vect__208.136, tmp376, vect__211.140
	vmovapd	%ymm13, -336(%rbp)	# vect__211.140, MEM[(double *)&mult]
	vperm2f128	$48, %ymm0, %ymm6, %ymm13	#, MEM[(double *)&MatA + 32B], MEM[(double *)&MatA], tmp399
	vperm2f128	$33, %ymm7, %ymm6, %ymm6	#, MEM[(double *)&MatA + 64B], MEM[(double *)&MatA], tmp406
	vpermpd	$160, %ymm13, %ymm14	#, tmp399, vect__178.87
	vpermpd	$245, %ymm13, %ymm13	#, tmp399, vect__184.97
	vfmadd132pd	%ymm9, %ymm5, %ymm14	# tmp328, tmp387, vect__181.90
	vfmadd132pd	%ymm8, %ymm14, %ymm13	# tmp337, vect__181.90, vect__187.100
	vpermpd	$160, %ymm6, %ymm14	#, tmp406, vect__190.107
	vpermpd	$245, %ymm6, %ymm6	#, tmp406, vect__196.117
	vfmadd231pd	%ymm14, %ymm1, %ymm13	# vect__190.107, tmp346, vect__193.110
	vfmadd132pd	%ymm15, %ymm13, %ymm6	# tmp355, vect__193.110, vect__199.120
	vperm2f128	$48, %ymm7, %ymm0, %ymm13	#, MEM[(double *)&MatA + 64B], MEM[(double *)&MatA + 32B], tmp412
	vpermpd	$160, %ymm13, %ymm14	#, tmp412, vect__202.127
	vpermpd	$245, %ymm13, %ymm13	#, tmp412, vect__208.137
	vfmadd231pd	-528(%rbp), %ymm14, %ymm6	# %sfp, vect__202.127, vect__205.130
	vfmadd231pd	-592(%rbp), %ymm13, %ymm6	# %sfp, vect__208.137, vect__211.140
	vmovapd	%ymm6, -304(%rbp)	# vect__211.140, MEM[(double *)&mult + 32B]
	vpermpd	$170, %ymm0, %ymm6	#, MEM[(double *)&MatA + 32B], vect__178.88
	vpermpd	$255, %ymm0, %ymm0	#, MEM[(double *)&MatA + 32B], vect__184.98
	vfmadd132pd	-368(%rbp), %ymm5, %ymm6	# %sfp, tmp387, vect__181.90
	vfmadd132pd	-400(%rbp), %ymm6, %ymm0	# %sfp, vect__181.90, vect__187.100
	vpermpd	$0, %ymm7, %ymm6	#, MEM[(double *)&MatA + 64B], vect__190.108
	vfmadd231pd	-432(%rbp), %ymm6, %ymm0	# %sfp, vect__190.108, vect__193.110
	vpermpd	$85, %ymm7, %ymm6	#, MEM[(double *)&MatA + 64B], vect__196.118
	vfmadd231pd	-464(%rbp), %ymm6, %ymm0	# %sfp, vect__196.118, vect__199.120
	vpermpd	$170, %ymm7, %ymm6	#, MEM[(double *)&MatA + 64B], vect__202.128
	vpermpd	$255, %ymm7, %ymm7	#, MEM[(double *)&MatA + 64B], vect__208.138
	vfmadd231pd	-496(%rbp), %ymm6, %ymm0	# %sfp, vect__202.128, vect__205.130
	vmovupd	96+MatA(%rip), %ymm6	# MEM[(double *)&MatA + 96B], MEM[(double *)&MatA + 96B]
	vfmadd231pd	-560(%rbp), %ymm7, %ymm0	# %sfp, vect__208.138, vect__211.140
	vpermpd	$0, %ymm6, %ymm13	#, MEM[(double *)&MatA + 96B], vect__178.86
	vpermpd	$85, %ymm6, %ymm14	#, MEM[(double *)&MatA + 96B], vect__184.96
	vfmadd132pd	%ymm12, %ymm5, %ymm13	# tmp331, tmp387, vect__181.90
	vmovapd	%ymm0, -272(%rbp)	# vect__211.140, MEM[(double *)&mult + 64B]
	vmovupd	128+MatA(%rip), %ymm0	# MEM[(double *)&MatA + 128B], MEM[(double *)&MatA + 128B]
	vmovupd	160+MatA(%rip), %ymm7	# MEM[(double *)&MatA + 160B], MEM[(double *)&MatA + 160B]
	vmovapd	%ymm15, -624(%rbp)	# tmp355, %sfp
	vfmadd231pd	%ymm14, %ymm4, %ymm13	# vect__184.96, tmp340, vect__187.100
	vpermpd	$170, %ymm6, %ymm14	#, MEM[(double *)&MatA + 96B], vect__190.106
	vfmadd231pd	%ymm14, %ymm3, %ymm13	# vect__190.106, tmp349, vect__193.110
	vpermpd	$255, %ymm6, %ymm14	#, MEM[(double *)&MatA + 96B], vect__196.116
	vfmadd231pd	%ymm14, %ymm11, %ymm13	# vect__196.116, tmp358, vect__199.120
	vpermpd	$0, %ymm0, %ymm14	#, MEM[(double *)&MatA + 128B], vect__202.126
	vfmadd231pd	%ymm14, %ymm2, %ymm13	# vect__202.126, tmp367, vect__205.130
	vpermpd	$85, %ymm0, %ymm14	#, MEM[(double *)&MatA + 128B], vect__208.136
	vfmadd231pd	%ymm14, %ymm10, %ymm13	# vect__208.136, tmp376, vect__211.140
	vmovapd	%ymm13, -240(%rbp)	# vect__211.140, MEM[(double *)&mult + 96B]
	vperm2f128	$48, %ymm0, %ymm6, %ymm13	#, MEM[(double *)&MatA + 128B], MEM[(double *)&MatA + 96B], tmp450
	vperm2f128	$33, %ymm7, %ymm6, %ymm6	#, MEM[(double *)&MatA + 160B], MEM[(double *)&MatA + 96B], tmp457
	vpermpd	$160, %ymm13, %ymm14	#, tmp450, vect__178.87
	vpermpd	$245, %ymm13, %ymm13	#, tmp450, vect__184.97
	vfmadd132pd	%ymm9, %ymm5, %ymm14	# tmp328, tmp387, vect__181.90
	vfmadd132pd	%ymm8, %ymm14, %ymm13	# tmp337, vect__181.90, vect__187.100
	vpermpd	$160, %ymm6, %ymm14	#, tmp457, vect__190.107
	vpermpd	$245, %ymm6, %ymm6	#, tmp457, vect__196.117
	vfmadd231pd	%ymm14, %ymm1, %ymm13	# vect__190.107, tmp346, vect__193.110
	vfmadd132pd	%ymm15, %ymm13, %ymm6	# tmp355, vect__193.110, vect__199.120
	vperm2f128	$48, %ymm7, %ymm0, %ymm13	#, MEM[(double *)&MatA + 160B], MEM[(double *)&MatA + 128B], tmp463
	vpermpd	$160, %ymm13, %ymm14	#, tmp463, vect__202.127
	vpermpd	$245, %ymm13, %ymm13	#, tmp463, vect__208.137
	vfmadd231pd	-528(%rbp), %ymm14, %ymm6	# %sfp, vect__202.127, vect__205.130
	vfmadd231pd	-592(%rbp), %ymm13, %ymm6	# %sfp, vect__208.137, vect__211.140
	vmovapd	%ymm6, -208(%rbp)	# vect__211.140, MEM[(double *)&mult + 128B]
	vpermpd	$170, %ymm0, %ymm6	#, MEM[(double *)&MatA + 128B], vect__178.88
	vpermpd	$255, %ymm0, %ymm0	#, MEM[(double *)&MatA + 128B], vect__184.98
	vfmadd132pd	-368(%rbp), %ymm5, %ymm6	# %sfp, tmp387, vect__181.90
	vfmadd132pd	-400(%rbp), %ymm6, %ymm0	# %sfp, vect__181.90, vect__187.100
	vpermpd	$0, %ymm7, %ymm6	#, MEM[(double *)&MatA + 160B], vect__190.108
	vfmadd231pd	-432(%rbp), %ymm6, %ymm0	# %sfp, vect__190.108, vect__193.110
	vpermpd	$85, %ymm7, %ymm6	#, MEM[(double *)&MatA + 160B], vect__196.118
	vfmadd231pd	-464(%rbp), %ymm6, %ymm0	# %sfp, vect__196.118, vect__199.120
	vpermpd	$170, %ymm7, %ymm6	#, MEM[(double *)&MatA + 160B], vect__202.128
	vpermpd	$255, %ymm7, %ymm7	#, MEM[(double *)&MatA + 160B], vect__208.138
	vfmadd231pd	-496(%rbp), %ymm6, %ymm0	# %sfp, vect__202.128, vect__205.130
	vmovupd	256+MatA(%rip), %ymm6	# MEM[(double *)&MatA + 256B], MEM[(double *)&MatA + 256B]
	vfmadd231pd	-560(%rbp), %ymm7, %ymm0	# %sfp, vect__208.138, vect__211.140
	vmovupd	224+MatA(%rip), %ymm7	# MEM[(double *)&MatA + 224B], MEM[(double *)&MatA + 224B]
	vpermpd	$85, %ymm7, %ymm13	#, MEM[(double *)&MatA + 224B], vect__208.136
	vmovapd	%ymm0, -176(%rbp)	# vect__211.140, MEM[(double *)&mult + 160B]
	vmovupd	192+MatA(%rip), %ymm0	# MEM[(double *)&MatA + 192B], MEM[(double *)&MatA + 192B]
	vpermpd	$0, %ymm0, %ymm15	#, MEM[(double *)&MatA + 192B], vect__178.86
	vpermpd	$255, %ymm0, %ymm14	#, MEM[(double *)&MatA + 192B], vect__196.116
	vfmadd132pd	%ymm15, %ymm5, %ymm12	# vect__178.86, tmp387, vect__181.90
	vpermpd	$85, %ymm0, %ymm15	#, MEM[(double *)&MatA + 192B], vect__184.96
	vfmadd231pd	%ymm15, %ymm4, %ymm12	# vect__184.96, tmp340, vect__187.100
	vpermpd	$170, %ymm0, %ymm4	#, MEM[(double *)&MatA + 192B], vect__190.106
	vfmadd132pd	%ymm3, %ymm12, %ymm4	# tmp349, vect__187.100, vect__193.110
	vpermpd	$0, %ymm7, %ymm3	#, MEM[(double *)&MatA + 224B], vect__202.126
	vfmadd231pd	%ymm11, %ymm14, %ymm4	# tmp358, vect__196.116, vect__199.120
	vfmadd231pd	%ymm3, %ymm2, %ymm4	# vect__202.126, tmp367, vect__205.130
	vperm2f128	$33, %ymm6, %ymm0, %ymm3	#, MEM[(double *)&MatA + 256B], MEM[(double *)&MatA + 192B], tmp503
	vperm2f128	$48, %ymm7, %ymm0, %ymm0	#, MEM[(double *)&MatA + 224B], MEM[(double *)&MatA + 192B], tmp505
	vpermpd	$160, %ymm0, %ymm11	#, tmp505, vect__178.87
	vpermpd	$245, %ymm0, %ymm0	#, tmp505, vect__184.97
	vperm2f128	$48, %ymm6, %ymm7, %ymm2	#, MEM[(double *)&MatA + 256B], MEM[(double *)&MatA + 224B], tmp501
	vfmadd132pd	%ymm11, %ymm5, %ymm9	# vect__178.87, tmp387, vect__181.90
	vfmadd231pd	%ymm10, %ymm13, %ymm4	# tmp376, vect__208.136, vect__211.140
	vpermpd	$245, %ymm3, %ymm10	#, tmp503, vect__196.117
	vpermpd	$160, %ymm3, %ymm3	#, tmp503, vect__190.107
	vfmadd132pd	%ymm8, %ymm9, %ymm0	# tmp337, vect__181.90, vect__187.100
	vmovapd	%ymm4, -144(%rbp)	# vect__211.140, MEM[(double *)&mult + 192B]
	vpermpd	$245, %ymm2, %ymm4	#, tmp501, vect__208.137
	vfmadd231pd	%ymm3, %ymm1, %ymm0	# vect__190.107, tmp346, vect__193.110
	vmovapd	-624(%rbp), %ymm1	# %sfp, tmp355
	vpermpd	$170, %ymm7, %ymm3	#, MEM[(double *)&MatA + 224B], vect__178.88
	vpermpd	$255, %ymm7, %ymm7	#, MEM[(double *)&MatA + 224B], vect__184.98
	vfmadd231pd	-368(%rbp), %ymm3, %ymm5	# %sfp, vect__178.88, vect__181.90
	vfmadd132pd	-400(%rbp), %ymm5, %ymm7	# %sfp, vect__181.90, vect__187.100
	vfmadd132pd	%ymm10, %ymm0, %ymm1	# vect__196.117, vect__193.110, tmp355
	vpermpd	$160, %ymm2, %ymm0	#, tmp501, vect__202.127
	vpermpd	$85, %ymm6, %ymm2	#, MEM[(double *)&MatA + 256B], vect__196.118
	vfmadd132pd	-528(%rbp), %ymm1, %ymm0	# %sfp, vect__199.120, vect__205.130
	vpermpd	$170, %ymm6, %ymm1	#, MEM[(double *)&MatA + 256B], vect__202.128
	vfmadd231pd	-592(%rbp), %ymm4, %ymm0	# %sfp, vect__208.137, vect__211.140
	vmovapd	%ymm0, -112(%rbp)	# vect__211.140, MEM[(double *)&mult + 224B]
	vpermpd	$255, %ymm6, %ymm0	#, MEM[(double *)&MatA + 256B], vect__208.138
	vpermpd	$0, %ymm6, %ymm6	#, MEM[(double *)&MatA + 256B], vect__190.108
	vfmadd132pd	-432(%rbp), %ymm7, %ymm6	# %sfp, vect__187.100, vect__193.110
	vfmadd231pd	-464(%rbp), %ymm2, %ymm6	# %sfp, vect__196.118, vect__199.120
# optimFox.c:91:             matches = fabs(mult[i][j] - MatC[i][j]) <= EPSILON;
	vmovq	.LC2(%rip), %xmm2	#, tmp535
# optimFox.c:80:                 mult[i][j] += MatA[i][k] * MatB[k][j];
	vfmadd132pd	-496(%rbp), %ymm6, %ymm1	# %sfp, vect__199.120, vect__205.130
	vfmadd132pd	-560(%rbp), %ymm1, %ymm0	# %sfp, vect__205.130, vect__211.140
# optimFox.c:92:             if (!matches)
	vmovsd	.LC3(%rip), %xmm1	#, tmp536
# optimFox.c:80:                 mult[i][j] += MatA[i][k] * MatB[k][j];
	vmovapd	%ymm0, -80(%rbp)	# vect__211.140, MEM[(double *)&mult + 256B]
# optimFox.c:91:             matches = fabs(mult[i][j] - MatC[i][j]) <= EPSILON;
	vmovsd	-96(%rbp), %xmm0	# mult, mult
	vsubsd	240+MatC(%rip), %xmm0, %xmm0	# MatC, mult, tmp533
	vandpd	%xmm2, %xmm0, %xmm0	# tmp535, tmp533, _47
# optimFox.c:92:             if (!matches)
	vucomisd	%xmm0, %xmm1	# _47, tmp536
	jb	.L30	#,
# optimFox.c:91:             matches = fabs(mult[i][j] - MatC[i][j]) <= EPSILON;
	vmovsd	-88(%rbp), %xmm0	# mult, mult
	vsubsd	248+MatC(%rip), %xmm0, %xmm0	# MatC, mult, tmp542
	vandpd	%xmm2, %xmm0, %xmm0	# tmp535, tmp542, _56
# optimFox.c:92:             if (!matches)
	vucomisd	%xmm0, %xmm1	# _56, tmp536
	jb	.L30	#,
# optimFox.c:91:             matches = fabs(mult[i][j] - MatC[i][j]) <= EPSILON;
	vmovsd	-80(%rbp), %xmm0	# mult, mult
	vsubsd	256+MatC(%rip), %xmm0, %xmm0	# MatC, mult, tmp551
	vandpd	%xmm2, %xmm0, %xmm0	# tmp535, tmp551, _65
# optimFox.c:92:             if (!matches)
	vucomisd	%xmm0, %xmm1	# _65, tmp536
	jb	.L30	#,
# optimFox.c:91:             matches = fabs(mult[i][j] - MatC[i][j]) <= EPSILON;
	vmovsd	-72(%rbp), %xmm0	# mult, mult
	vsubsd	264+MatC(%rip), %xmm0, %xmm0	# MatC, mult, tmp560
	vandpd	%xmm2, %xmm0, %xmm0	# tmp535, tmp560, _74
# optimFox.c:92:             if (!matches)
	vucomisd	%xmm0, %xmm1	# _74, tmp536
	jb	.L30	#,
# optimFox.c:91:             matches = fabs(mult[i][j] - MatC[i][j]) <= EPSILON;
	vmovsd	-64(%rbp), %xmm0	# mult, mult
	vsubsd	272+MatC(%rip), %xmm0, %xmm0	# MatC, mult, tmp569
	vandpd	%xmm2, %xmm0, %xmm0	# tmp535, tmp569, _83
# optimFox.c:92:             if (!matches)
	vucomisd	%xmm0, %xmm1	# _83, tmp536
	jb	.L30	#,
# optimFox.c:91:             matches = fabs(mult[i][j] - MatC[i][j]) <= EPSILON;
	vmovsd	-56(%rbp), %xmm0	# mult, mult
	vsubsd	280+MatC(%rip), %xmm0, %xmm0	# MatC, mult, tmp578
	xorl	%eax, %eax	# matches
	vandpd	%xmm0, %xmm2, %xmm2	# tmp578, tmp535, tmp580
	vucomisd	%xmm2, %xmm1	# tmp580, tmp536
	setnb	%al	#, matches
.L21:
# optimFox.c:96:     if (matches)
	testl	%eax, %eax	# matches
	jne	.L33	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movq	-24(%rbp), %rax	# D.9831, tmp589
	xorq	%fs:40, %rax	#, tmp589
	jne	.L32	#,
	leaq	.LC5(%rip), %rdi	#,
.L31:
	vzeroupper
# optimFox.c:100: }
	addq	$616, %rsp	#,
	popq	%r13	#
	.cfi_remember_state
	.cfi_def_cfa 13, 0
	popq	%rbp	#
	leaq	-16(%r13), %rsp	#,
	.cfi_def_cfa 7, 16
	popq	%r13	#
	.cfi_def_cfa_offset 8
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	jmp	puts@PLT	#
	.p2align 4,,10
	.p2align 3
.L33:
	.cfi_restore_state
	movq	-24(%rbp), %rax	# D.9831, tmp588
	xorq	%fs:40, %rax	#, tmp588
	jne	.L32	#,
	leaq	.LC4(%rip), %rdi	#,
	jmp	.L31	#
	.p2align 4,,10
	.p2align 3
.L30:
# optimFox.c:91:             matches = fabs(mult[i][j] - MatC[i][j]) <= EPSILON;
	setnb	%al	#, matches
	movzbl	%al, %eax	# matches, matches
	jmp	.L21	#
.L32:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	vzeroupper
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE54:
	.size	Debug, .-Debug
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC7:
	.string	"Incorrect number of Process alocated, refer instructions for correct # of Process"
	.align 8
.LC9:
	.string	"MPI_Wtime measured for total run by process %d = %f\n"
	.align 8
.LC10:
	.string	"Total time by each process = %f  And Average = %f "
	.section	.rodata.str1.1
.LC11:
	.string	"\nPrinting Matrix A"
.LC12:
	.string	"\nPrinting Matrix B"
.LC13:
	.string	"\nPrinting Matrix C"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB55:
	.cfi_startproc
	leaq	8(%rsp), %r10	#,
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp	#,
	pushq	-8(%r10)	#
	pushq	%rbp	#
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp	#,
	pushq	%r15	#
	pushq	%r14	#
	pushq	%r13	#
	pushq	%r12	#
	pushq	%r10	#
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx	#
	subq	$416, %rsp	#,
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
# optimFox.c:102: int main(int argc, char* argv[]) {
	movl	%edi, -388(%rbp)	# argc, argc
	movq	%fs:40, %rax	#, tmp384
	movq	%rax, -56(%rbp)	# tmp384, D.9886
	xorl	%eax, %eax	# tmp384
	movq	%rsi, -400(%rbp)	# argv, argv
# optimFox.c:107:     InitiateMatrix();
	call	InitiateMatrix	#
# optimFox.c:109:     MPI_Init_thread(&argc, &argv, MPI_THREAD_SINGLE, &provided);
	xorl	%edx, %edx	#
	leaq	-372(%rbp), %rcx	#, tmp188
	leaq	-400(%rbp), %rsi	#, tmp189
	leaq	-388(%rbp), %rdi	#, tmp190
	call	MPI_Init_thread@PLT	#
# optimFox.c:110:     MPI_Comm_size(MPI_COMM_WORLD, &size);
	leaq	-376(%rbp), %rsi	#, tmp191
	movl	$1140850688, %edi	#,
	call	MPI_Comm_size@PLT	#
# optimFox.c:111:     MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	leaq	-380(%rbp), %rsi	#, tmp192
	movl	$1140850688, %edi	#,
	call	MPI_Comm_rank@PLT	#
# optimFox.c:114:     t1 = MPI_Wtime();
	call	MPI_Wtime@PLT	#
	vxorpd	%xmm2, %xmm2, %xmm2	# tmp193
	vmovsd	%xmm0, -416(%rbp)	#, %sfp
# optimFox.c:115:     size_root = sqrt((double) size);
	vxorpd	%xmm0, %xmm0, %xmm0	# _2
	vcvtsi2sd	-376(%rbp), %xmm0, %xmm0	# size, _2, _2
	vucomisd	%xmm0, %xmm2	# _2, tmp193
	vsqrtsd	%xmm0, %xmm1, %xmm1	# _2, size_root
	ja	.L79	#,
.L35:
# optimFox.c:116:     q = (int) size_root;
	vcvttsd2si	%xmm1, %r12d	# size_root, q
# optimFox.c:118:     if (!((N % q == 0) && (size_root == round(size_root))))
	movl	$6, %eax	#, tmp194
	cltd
	idivl	%r12d	# q
	movl	%edx, %r13d	# <retval>, <retval>
	testl	%edx, %edx	# <retval>
	jne	.L36	#,
# optimFox.c:118:     if (!((N % q == 0) && (size_root == round(size_root))))
	vmovapd	%xmm1, %xmm0	# size_root,
	vmovsd	%xmm1, -408(%rbp)	# size_root, %sfp
	call	round@PLT	#
	vmovsd	-408(%rbp), %xmm1	# %sfp, size_root
	vucomisd	%xmm1, %xmm0	# size_root, _4
	jp	.L36	#,
	je	.L74	#,
.L36:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC7(%rip), %rsi	#,
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
# optimFox.c:122:         return 1;
	movl	$1, %r13d	#, <retval>
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	__printf_chk@PLT	#
# optimFox.c:121:         MPI_Finalize();
	call	MPI_Finalize@PLT	#
.L34:
# optimFox.c:278: }
	movq	-56(%rbp), %rbx	# D.9886, tmp385
	xorq	%fs:40, %rbx	#, tmp385
	movl	%r13d, %eax	# <retval>,
	jne	.L80	#,
	leaq	-48(%rbp), %rsp	#,
	popq	%rbx	#
	popq	%r10	#
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	leaq	-8(%r10), %rsp	#,
	.cfi_def_cfa 7, 8
	ret
.L74:
	.cfi_restore_state
# optimFox.c:127:     MPI_Dims_create(size, 2, dims);
	leaq	-312(%rbp), %rbx	#, tmp197
	movl	$2, %esi	#,
	movl	-376(%rbp), %edi	# size,
# optimFox.c:126:     int dims[2] = {0, 0};               // Ask MPI to decompose our processes in a 2D cartesian grid for us
	movq	$0, -312(%rbp)	#, MEM[(int *)&dims]
# optimFox.c:127:     MPI_Dims_create(size, 2, dims);
	movq	%rbx, %rdx	# tmp197,
	call	MPI_Dims_create@PLT	#
# optimFox.c:131:     MPI_Cart_create(MPI_COMM_WORLD, 2, dims, periods, reorder, &cart_comm);
	leaq	-368(%rbp), %r9	#,
	movq	%rbx, %rdx	# tmp197,
	movl	$1, %r8d	#,
	leaq	-304(%rbp), %rcx	#, tmp201
	movl	$2, %esi	#,
	movl	$1140850688, %edi	#,
# optimFox.c:128:     int periods[2] = {1, 1};      //Mesh Topology, set to True for Torus Topology
	movabsq	$4294967297, %rax	#, tmp387
	movq	%rax, -304(%rbp)	# tmp387, MEM[(int *)&periods]
# optimFox.c:131:     MPI_Cart_create(MPI_COMM_WORLD, 2, dims, periods, reorder, &cart_comm);
	call	MPI_Cart_create@PLT	#
# optimFox.c:135:     MPI_Comm_rank(cart_comm, &cart_rank);
	movl	-368(%rbp), %edi	# cart_comm,
	leaq	-364(%rbp), %rsi	#, tmp203
	call	MPI_Comm_rank@PLT	#
# optimFox.c:136:     int x = cart_rank / q;
	movl	-364(%rbp), %esi	# cart_rank, cart_rank.3_7
# optimFox.c:142:     MPI_Comm_split(cart_comm, row, cart_rank, &row_comm);
	movl	-368(%rbp), %edi	# cart_comm,
	leaq	-360(%rbp), %rcx	#, tmp207
	movl	%esi, %eax	# cart_rank.3_7, tmp205
	cltd
	idivl	%r12d	# q
	movl	%edx, %r14d	# tmp206, tmp206
	movl	%esi, %edx	# cart_rank.3_7,
	movl	%eax, %esi	# tmp205,
	movl	%eax, %ebx	# tmp205, tmp205
	call	MPI_Comm_split@PLT	#
# optimFox.c:145:     MPI_Comm_rank(row_comm, &row_rank);
	movl	-360(%rbp), %edi	# row_comm,
	leaq	-356(%rbp), %rsi	#, tmp209
	call	MPI_Comm_rank@PLT	#
# optimFox.c:146:     MPI_Comm_size(row_comm, &row_size);
	movl	-360(%rbp), %edi	# row_comm,
	leaq	-352(%rbp), %rsi	#, tmp211
	call	MPI_Comm_size@PLT	#
# optimFox.c:152:     MPI_Cart_shift(cart_comm, 0, 1, &send_to, &receive_from);
	movl	-368(%rbp), %edi	# cart_comm,
	xorl	%esi, %esi	#
	movl	$1, %edx	#,
	leaq	-344(%rbp), %rcx	#, tmp214
	leaq	-348(%rbp), %r8	#,
	call	MPI_Cart_shift@PLT	#
# optimFox.c:155:     double BufMatA[N_BAR][N_BAR], BufMatB[N_BAR][N_BAR], BufMatBtemp[N_BAR][N_BAR], BufMatC[N_BAR][N_BAR]={0}; //Local Buffers
	movl	%r13d, %eax	# <retval>, <retval>
	movl	$8, %ecx	#, tmp218
	leaq	-208(%rbp), %rdi	#, tmp367
	movq	%rdi, -432(%rbp)	# tmp367, %sfp
	rep stosl
# optimFox.c:164:     omp_set_num_threads(OMP_THREADS);
	movl	$2, %edi	#,
	call	omp_set_num_threads@PLT	#
# optimFox.c:170:             BufMatB[i][j] = MatB[x*N_BAR + j][y*N_BAR + i]; //Transposed matrix generation
	leal	(%rbx,%rbx), %edx	#, _298
	leal	(%r14,%r14), %eax	#, _300
	movslq	%edx, %rdx	# _298, _298
	cltq
	imulq	$6, %rdx, %rdx	#, _298, tmp221
	addq	%rdx, %rax	# tmp221, tmp222
	leaq	MatB(%rip), %rdx	#, tmp224
	salq	$3, %rax	#, tmp223
	addq	%rax, %rdx	# tmp223, vectp.153
	vmovupd	(%rdx), %ymm0	# MEM[(double *)vectp.153_281], vect__302.154
	vperm2f128	$48, 32(%rdx), %ymm0, %ymm0	#, MEM[(double *)vectp.153_281 + 32B], vect__302.154, tmp228
	vpermpd	$216, %ymm0, %ymm0	#, tmp228, vect__302.156
	vmovapd	%ymm0, -240(%rbp)	# vect__302.156, MEM[(double *)&BufMatB]
# optimFox.c:174:     for(int i = 0; i < q; i++) //Control stages and compute multiple for the submatrices **Should not be mulltithreaded**
	testl	%r12d, %r12d	# q
	jle	.L75	#,
	leaq	-240(%rbp), %rdx	#, tmp372
	movq	%rax, -424(%rbp)	# tmp223, %sfp
	leal	(%r12,%rbx), %r15d	#, _117
	movq	%rdx, -408(%rbp)	# tmp372, %sfp
	leaq	-272(%rbp), %rcx	#, tmp369
	leaq	-176(%rbp), %rdi	#, tmp368
	movl	%r12d, -392(%rbp)	# q, %sfp
	movq	%rdi, %r12	# tmp368, tmp368
	movl	%r13d, -436(%rbp)	# <retval>, %sfp
	movq	%rcx, %r13	# tmp369, tmp369
	.p2align 4,,10
	.p2align 3
.L42:
# optimFox.c:176:         if ((x + i) % row_size == y) //True if this is sender
	movl	%ebx, %eax	# ivtmp.197, tmp230
	movl	-360(%rbp), %r8d	# row_comm, pretmp_260
	cltd
	idivl	-352(%rbp)	# row_size
# optimFox.c:191:             MPI_Bcast(BufMatA,N_BAR*N_BAR,MPI_DOUBLE,(x + i) % row_size, row_comm);
	movl	%edx, %ecx	# tmp229,
# optimFox.c:176:         if ((x + i) % row_size == y) //True if this is sender
	cmpl	%r14d, %edx	# tmp206, tmp229
	jne	.L78	#,
	leaq	MatA(%rip), %rax	#, vectp.160
	addq	-424(%rbp), %rax	# %sfp, vectp.160
# optimFox.c:187:             MPI_Bcast(BufMatA,N_BAR*N_BAR,MPI_DOUBLE,row_rank, row_comm);
	movl	-356(%rbp), %ecx	# row_rank,
# optimFox.c:183:                     BufMatA[j][i] = MatA[x*N_BAR + j][y*N_BAR + i];
	vmovupd	(%rax), %ymm0	# MEM[(double *)vectp.160_55], vect__270.161
	vperm2f128	$48, 32(%rax), %ymm0, %ymm0	#, MEM[(double *)vectp.160_55 + 32B], vect__270.161, vect__270.163
	vmovapd	%ymm0, -272(%rbp)	# vect__270.163, MEM[(double *)&BufMatA]
.L78:
# optimFox.c:187:             MPI_Bcast(BufMatA,N_BAR*N_BAR,MPI_DOUBLE,row_rank, row_comm);
	movl	$1275070475, %edx	#,
	movl	$4, %esi	#,
	movq	%r13, %rdi	# tmp369,
	vzeroupper
	call	MPI_Bcast@PLT	#
# optimFox.c:203:                 sum += BufMatA[c][k]*BufMatB[d][k];
	vxorpd	%xmm3, %xmm3, %xmm3	# tmp246
# optimFox.c:220:         MPI_Sendrecv(   BufMatB,      N_BAR*N_BAR, MPI_DOUBLE, send_to,       0,
	pushq	$1	#
	movl	-368(%rbp), %eax	# cart_comm, cart_comm
	movl	-344(%rbp), %ecx	# send_to,
	movq	%r12, %r9	# tmp368,
	xorl	%r8d, %r8d	#
# optimFox.c:203:                 sum += BufMatA[c][k]*BufMatB[d][k];
	vmovapd	-240(%rbp), %ymm1	# MEM[(double *)&BufMatB], vect__331.172
# optimFox.c:220:         MPI_Sendrecv(   BufMatB,      N_BAR*N_BAR, MPI_DOUBLE, send_to,       0,
	movl	$1275070475, %edx	#,
	movl	$4, %esi	#,
# optimFox.c:203:                 sum += BufMatA[c][k]*BufMatB[d][k];
	vmovapd	-272(%rbp), %ymm0	# MEM[(double *)&BufMatA], vect__330.168
# optimFox.c:220:         MPI_Sendrecv(   BufMatB,      N_BAR*N_BAR, MPI_DOUBLE, send_to,       0,
	pushq	%rax	# cart_comm
	movl	-348(%rbp), %eax	# receive_from, receive_from
# optimFox.c:203:                 sum += BufMatA[c][k]*BufMatB[d][k];
	vpermpd	$221, %ymm1, %ymm2	#, vect__331.172, vect__335.183
	vpermpd	$160, %ymm0, %ymm4	#, vect__330.168, vect__330.169
# optimFox.c:220:         MPI_Sendrecv(   BufMatB,      N_BAR*N_BAR, MPI_DOUBLE, send_to,       0,
	pushq	$0	#
# optimFox.c:203:                 sum += BufMatA[c][k]*BufMatB[d][k];
	vpermpd	$136, %ymm1, %ymm1	#, vect__331.172, vect__331.173
	vfmadd132pd	%ymm4, %ymm3, %ymm1	# vect__330.169, tmp246, vect_sum_333.175
	vpermpd	$245, %ymm0, %ymm0	#, vect__330.168, vect__334.179
# optimFox.c:220:         MPI_Sendrecv(   BufMatB,      N_BAR*N_BAR, MPI_DOUBLE, send_to,       0,
	pushq	%rax	# receive_from
	movq	-408(%rbp), %rdi	# %sfp,
	pushq	$1275070475	#
	pushq	$4	#
# optimFox.c:203:                 sum += BufMatA[c][k]*BufMatB[d][k];
	vfmadd132pd	%ymm2, %ymm1, %ymm0	# vect__335.183, vect_sum_333.175, vect_sum_337.185
# optimFox.c:205:                 BufMatC[c][d] += sum;
	vaddpd	-208(%rbp), %ymm0, %ymm0	# MEM[(double *)&BufMatC], vect_sum_337.185, vect__339.189
	vmovapd	%ymm0, -208(%rbp)	# vect__339.189, MEM[(double *)&BufMatC]
# optimFox.c:220:         MPI_Sendrecv(   BufMatB,      N_BAR*N_BAR, MPI_DOUBLE, send_to,       0,
	vzeroupper
	addl	$1, %ebx	#, ivtmp.197
	call	MPI_Sendrecv@PLT	#
	vmovdqa	-176(%rbp), %xmm0	# MEM[(char * {ref-all})&BufMatBtemp], MEM[(char * {ref-all})&BufMatBtemp]
# optimFox.c:174:     for(int i = 0; i < q; i++) //Control stages and compute multiple for the submatrices **Should not be mulltithreaded**
	addq	$48, %rsp	#,
	vmovaps	%xmm0, -240(%rbp)	# MEM[(char * {ref-all})&BufMatBtemp], MEM[(char * {ref-all})&BufMatB]
	vmovdqa	-160(%rbp), %xmm0	# MEM[(char * {ref-all})&BufMatBtemp], MEM[(char * {ref-all})&BufMatBtemp]
	vmovaps	%xmm0, -224(%rbp)	# MEM[(char * {ref-all})&BufMatBtemp], MEM[(char * {ref-all})&BufMatB]
	cmpl	%ebx, %r15d	# ivtmp.197, _117
	jne	.L42	#,
	movl	-392(%rbp), %r12d	# %sfp, q
	movl	-436(%rbp), %r13d	# %sfp, <retval>
.L40:
# optimFox.c:231:     MPI_Type_contiguous(N_BAR*N_BAR, MPI_DOUBLE, &block2d);
	leaq	-340(%rbp), %rbx	#, tmp260
	movl	$1275070475, %esi	#,
	movl	$4, %edi	#,
# optimFox.c:226:     int sizes[2] = {N,N};
	movabsq	$25769803782, %rax	#, tmp399
# optimFox.c:231:     MPI_Type_contiguous(N_BAR*N_BAR, MPI_DOUBLE, &block2d);
	movq	%rbx, %rdx	# tmp260,
# optimFox.c:226:     int sizes[2] = {N,N};
	movq	%rax, -296(%rbp)	# tmp399, MEM[(int *)&sizes]
# optimFox.c:227:     int subsizes[2] = {N_BAR,N_BAR};
	movabsq	$8589934594, %rax	#, tmp400
	movq	%rax, -288(%rbp)	# tmp400, MEM[(int *)&subsizes]
# optimFox.c:228:     int starts[2] = {0,0};
	movq	$0, -280(%rbp)	#, MEM[(int *)&starts]
# optimFox.c:231:     MPI_Type_contiguous(N_BAR*N_BAR, MPI_DOUBLE, &block2d);
	call	MPI_Type_contiguous@PLT	#
# optimFox.c:232:     MPI_Type_commit(&block2d);
	movq	%rbx, %rdi	# tmp260,
# optimFox.c:235:     MPI_Type_create_subarray(2,sizes,subsizes,starts,MPI_ORDER_C,MPI_DOUBLE,&recvsubarray);
	leaq	-336(%rbp), %rbx	#, tmp265
# optimFox.c:232:     MPI_Type_commit(&block2d);
	call	MPI_Type_commit@PLT	#
# optimFox.c:235:     MPI_Type_create_subarray(2,sizes,subsizes,starts,MPI_ORDER_C,MPI_DOUBLE,&recvsubarray);
	subq	$8, %rsp	#,
	movl	$1275070475, %r9d	#,
	movl	$56, %r8d	#,
	pushq	%rbx	# tmp265
	leaq	-280(%rbp), %rcx	#, tmp262
	leaq	-288(%rbp), %rdx	#, tmp263
	movl	$2, %edi	#,
	leaq	-296(%rbp), %rsi	#, tmp264
	call	MPI_Type_create_subarray@PLT	#
# optimFox.c:236:     MPI_Type_commit(&recvsubarray);
	movq	%rbx, %rdi	# tmp265,
# optimFox.c:239:     MPI_Type_create_resized(recvsubarray, 0, 1*sizeof(double), &resizedrecvsubarray);
	leaq	-332(%rbp), %rbx	#, tmp267
# optimFox.c:236:     MPI_Type_commit(&recvsubarray);
	call	MPI_Type_commit@PLT	#
# optimFox.c:239:     MPI_Type_create_resized(recvsubarray, 0, 1*sizeof(double), &resizedrecvsubarray);
	movl	-336(%rbp), %edi	# recvsubarray,
	movq	%rbx, %rcx	# tmp267,
	xorl	%esi, %esi	#
	movl	$8, %edx	#,
	call	MPI_Type_create_resized@PLT	#
# optimFox.c:240:     MPI_Type_commit(&resizedrecvsubarray);
	movq	%rbx, %rdi	# tmp267,
	call	MPI_Type_commit@PLT	#
# optimFox.c:242:     int counts[]= { [0 ... (N*N/(N_BAR*N_BAR)-1)] = 1 };
	vmovdqa	.LC8(%rip), %ymm0	#, tmp270
# optimFox.c:244:     for (int i = 0; i < size; i++)
	popq	%rsi	#
# optimFox.c:242:     int counts[]= { [0 ... (N*N/(N_BAR*N_BAR)-1)] = 1 };
	movl	$1, -112(%rbp)	#, counts
# optimFox.c:244:     for (int i = 0; i < size; i++)
	movl	-376(%rbp), %ecx	# size, size.19_301
	popq	%rdi	#
# optimFox.c:242:     int counts[]= { [0 ... (N*N/(N_BAR*N_BAR)-1)] = 1 };
	vmovdqa	%ymm0, -144(%rbp)	# tmp270, MEM[(int *)&counts]
# optimFox.c:244:     for (int i = 0; i < size; i++)
	testl	%ecx, %ecx	# size.19_301
	jle	.L44	#,
# optimFox.c:246:         disps[i] = ( i % q ) * N_BAR + ( i / q) * N * N_BAR;
	movl	$0, -96(%rbp)	#, disps
# optimFox.c:244:     for (int i = 0; i < size; i++)
	cmpl	$1, %ecx	#, size.19_301
	je	.L44	#,
# optimFox.c:246:         disps[i] = ( i % q ) * N_BAR + ( i / q) * N * N_BAR;
	movl	$1, %eax	#, tmp274
	cltd
	idivl	%r12d	# q
	imull	$6, %eax, %eax	#, tmp272, tmp275
	addl	%edx, %eax	# tmp273, tmp280
	addl	%eax, %eax	# tmp281
	movl	%eax, -92(%rbp)	# tmp281, disps
# optimFox.c:244:     for (int i = 0; i < size; i++)
	cmpl	$2, %ecx	#, size.19_301
	je	.L44	#,
# optimFox.c:246:         disps[i] = ( i % q ) * N_BAR + ( i / q) * N * N_BAR;
	movl	$2, %eax	#, tmp285
	cltd
	idivl	%r12d	# q
	imull	$6, %eax, %eax	#, tmp283, tmp286
	addl	%edx, %eax	# tmp284, tmp291
	addl	%eax, %eax	# tmp292
	movl	%eax, -88(%rbp)	# tmp292, disps
# optimFox.c:244:     for (int i = 0; i < size; i++)
	cmpl	$3, %ecx	#, size.19_301
	je	.L44	#,
# optimFox.c:246:         disps[i] = ( i % q ) * N_BAR + ( i / q) * N * N_BAR;
	movl	$3, %eax	#, tmp296
	cltd
	idivl	%r12d	# q
	imull	$6, %eax, %eax	#, tmp294, tmp297
	addl	%edx, %eax	# tmp295, tmp302
	addl	%eax, %eax	# tmp303
	movl	%eax, -84(%rbp)	# tmp303, disps
# optimFox.c:244:     for (int i = 0; i < size; i++)
	cmpl	$4, %ecx	#, size.19_301
	je	.L44	#,
# optimFox.c:246:         disps[i] = ( i % q ) * N_BAR + ( i / q) * N * N_BAR;
	movl	$4, %eax	#, tmp307
	cltd
	idivl	%r12d	# q
	imull	$6, %eax, %eax	#, tmp305, tmp308
	addl	%edx, %eax	# tmp306, tmp313
	addl	%eax, %eax	# tmp314
	movl	%eax, -80(%rbp)	# tmp314, disps
# optimFox.c:244:     for (int i = 0; i < size; i++)
	cmpl	$5, %ecx	#, size.19_301
	je	.L44	#,
# optimFox.c:246:         disps[i] = ( i % q ) * N_BAR + ( i / q) * N * N_BAR;
	movl	$5, %eax	#, tmp318
	cltd
	idivl	%r12d	# q
	imull	$6, %eax, %eax	#, tmp316, tmp319
	addl	%edx, %eax	# tmp317, tmp324
	addl	%eax, %eax	# tmp325
	movl	%eax, -76(%rbp)	# tmp325, disps
# optimFox.c:244:     for (int i = 0; i < size; i++)
	cmpl	$6, %ecx	#, size.19_301
	je	.L44	#,
# optimFox.c:246:         disps[i] = ( i % q ) * N_BAR + ( i / q) * N * N_BAR;
	movl	$6, %eax	#, tmp329
	cltd
	idivl	%r12d	# q
	imull	$6, %eax, %eax	#, tmp327, tmp330
	addl	%eax, %eax	# tmp331
	movl	%eax, -72(%rbp)	# tmp331, disps
# optimFox.c:244:     for (int i = 0; i < size; i++)
	cmpl	$7, %ecx	#, size.19_301
	je	.L44	#,
# optimFox.c:246:         disps[i] = ( i % q ) * N_BAR + ( i / q) * N * N_BAR;
	movl	$7, %eax	#, tmp335
	cltd
	idivl	%r12d	# q
	imull	$6, %eax, %eax	#, tmp333, tmp336
	addl	%edx, %eax	# tmp334, tmp341
	addl	%eax, %eax	# tmp342
	movl	%eax, -68(%rbp)	# tmp342, disps
# optimFox.c:244:     for (int i = 0; i < size; i++)
	cmpl	$8, %ecx	#, size.19_301
	je	.L44	#,
# optimFox.c:246:         disps[i] = ( i % q ) * N_BAR + ( i / q) * N * N_BAR;
	movl	$8, %eax	#, tmp346
	cltd
	idivl	%r12d	# q
	imull	$6, %eax, %eax	#, tmp344, tmp347
	addl	%edx, %eax	# tmp345, tmp352
	addl	%eax, %eax	# tmp353
	movl	%eax, -64(%rbp)	# tmp353, disps
.L44:
# optimFox.c:249:     MPI_Gatherv(BufMatC,1,block2d,MatC,counts,disps,resizedrecvsubarray,0,MPI_COMM_WORLD);
	movl	-332(%rbp), %eax	# resizedrecvsubarray, resizedrecvsubarray
	subq	$8, %rsp	#,
	leaq	-96(%rbp), %r9	#,
	movl	-340(%rbp), %edx	# block2d,
	pushq	$1140850688	#
	movq	-432(%rbp), %rdi	# %sfp,
	leaq	-144(%rbp), %r8	#,
	leaq	MatC(%rip), %rcx	#,
	pushq	$0	#
	movl	$1, %esi	#,
	pushq	%rax	# resizedrecvsubarray
	vzeroupper
	call	MPI_Gatherv@PLT	#
# optimFox.c:252:     t2 = MPI_Wtime();
	addq	$32, %rsp	#,
	call	MPI_Wtime@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	-380(%rbp), %edx	# rank,
	movl	$1, %edi	#,
# optimFox.c:253:     t = t2-t1;
	vsubsd	-416(%rbp), %xmm0, %xmm0	# %sfp, t2, _47
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC9(%rip), %rsi	#,
	movl	$1, %eax	#,
# optimFox.c:253:     t = t2-t1;
	vmovsd	%xmm0, -328(%rbp)	# _47, t
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	__printf_chk@PLT	#
# optimFox.c:256:     MPI_Reduce(&t, &time_spent, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);
	subq	$8, %rsp	#,
	xorl	%r9d, %r9d	#
	movl	$1, %edx	#,
	pushq	$1140850688	#
	leaq	-320(%rbp), %rsi	#, tmp361
	movl	$1275070475, %ecx	#,
	leaq	-328(%rbp), %rdi	#, tmp362
	movl	$1476395011, %r8d	#,
# optimFox.c:255: 	double time_spent = 0;
	movq	$0x000000000, -320(%rbp)	#, time_spent
# optimFox.c:256:     MPI_Reduce(&t, &time_spent, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);
	call	MPI_Reduce@PLT	#
# optimFox.c:257: 	if(rank == 0)
	cmpl	$0, -380(%rbp)	#, rank
	popq	%rax	#
	popq	%rdx	#
	je	.L81	#,
.L46:
# optimFox.c:276:     MPI_Finalize();
	call	MPI_Finalize@PLT	#
# optimFox.c:277:     return 0;
	jmp	.L34	#
.L81:
# optimFox.c:258: 		printf("Total time by each process = %f  And Average = %f ", time_spent, time_spent/size);
	vxorpd	%xmm1, %xmm1, %xmm1	# tmp363
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %edi	#,
	movl	$2, %eax	#,
# optimFox.c:258: 		printf("Total time by each process = %f  And Average = %f ", time_spent, time_spent/size);
	vmovsd	-320(%rbp), %xmm0	# time_spent, time_spent.25_50
	vcvtsi2sd	-376(%rbp), %xmm1, %xmm1	# size, tmp363, tmp363
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC10(%rip), %rsi	#,
	vdivsd	%xmm1, %xmm0, %xmm1	# tmp363, time_spent.25_50,
	call	__printf_chk@PLT	#
# optimFox.c:260:     if (rank == 0)
	cmpl	$0, -380(%rbp)	#, rank
	jne	.L46	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC11(%rip), %rdi	#,
	call	puts@PLT	#
# optimFox.c:263:         PrintMatrix(MatA);
	leaq	MatA(%rip), %rdi	#,
	call	PrintMatrix	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC12(%rip), %rdi	#,
	call	puts@PLT	#
# optimFox.c:265:         PrintMatrix(MatB);
	leaq	MatB(%rip), %rdi	#,
	call	PrintMatrix	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC13(%rip), %rdi	#,
	call	puts@PLT	#
# optimFox.c:267:         PrintMatrix(MatC);
	leaq	MatC(%rip), %rdi	#,
	call	PrintMatrix	#
	jmp	.L46	#
.L75:
	vzeroupper
	jmp	.L40	#
.L79:
	vmovsd	%xmm1, -408(%rbp)	# size_root, %sfp
# optimFox.c:115:     size_root = sqrt((double) size);
	call	sqrt@PLT	#
	vmovsd	-408(%rbp), %xmm1	# %sfp, size_root
	jmp	.L35	#
.L80:
# optimFox.c:278: }
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE55:
	.size	main, .-main
	.comm	MatC,288,32
	.comm	MatB,288,32
	.comm	MatA,288,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	4290772992
	.long	1105199103
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC2:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC3:
	.long	2696277389
	.long	1051772663
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC8:
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits