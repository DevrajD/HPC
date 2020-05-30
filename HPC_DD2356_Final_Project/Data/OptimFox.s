	.file	"optimFox.c"
# GNU C11 (Ubuntu 7.5.0-3ubuntu1~18.04) version 7.5.0 (x86_64-linux-gnu)
#	compiled by GNU C version 7.5.0, GMP version 6.1.2, MPFR version 4.0.1, MPC version 1.1.0, isl version isl-0.19-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -I /usr/include/mpich -imultiarch x86_64-linux-gnu
# -D EBUG=0 optimFox.c -march=haswell -O3 -fverbose-asm
# -fstack-protector-strong -Wformat -Wformat-security
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
	xorl	%r13d, %r13d	# ivtmp.53
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
	vmovsd	%xmm0, (%r12,%r13)	# tmp129, MEM[symbol: MatA, index: ivtmp.45_28, offset: 0B]
# optimFox.c:36:             MatB[i][j] = (double) random() / (double) RAND_MAX;
	call	random@PLT	#
	vxorpd	%xmm0, %xmm0, %xmm0	# tmp132
	vcvtsi2sdq	%rax, %xmm0, %xmm0	# _7, tmp132, tmp132
	vdivsd	.LC0(%rip), %xmm0, %xmm0	#, tmp132, tmp133
	vmovsd	%xmm0, 0(%rbp,%r13)	# tmp133, MEM[symbol: MatB, index: ivtmp.45_28, offset: 0B]
	addq	$8, %r13	#, ivtmp.53
# optimFox.c:33:         for(int j = 0; j < N ; j++)
	cmpq	%rbx, %r13	# _33, ivtmp.53
	jne	.L3	#,
# optimFox.c:31:     for(int i = 0; i < N ; i++)
	cmpq	$288, %r13	#, ivtmp.53
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
	movq	%rdi, %rbx	# Mat, ivtmp.70
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
	addq	$8, %rbx	#, ivtmp.70
	movl	$1, %eax	#,
	call	__printf_chk@PLT	#
# optimFox.c:54:         for(int j = 0; j < N ; j++)
	cmpq	%rbx, %rbp	# ivtmp.70, _16
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
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"Incorrect number of Process alocated, refer instructions for correct # of Process"
	.align 8
.LC5:
	.string	"MPI_Wtime measured for total run by process %d = %f\n"
	.align 8
.LC6:
	.string	"Total time by each process = %f  And Average = %f "
	.section	.rodata.str1.1
.LC7:
	.string	"\nPrinting Matrix A"
.LC8:
	.string	"\nPrinting Matrix B"
.LC9:
	.string	"\nPrinting Matrix C"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB54:
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
# optimFox.c:106: int main(int argc, char* argv[]) {
	movl	%edi, -388(%rbp)	# argc, argc
	movq	%fs:40, %rax	#, tmp384
	movq	%rax, -56(%rbp)	# tmp384, D.9765
	xorl	%eax, %eax	# tmp384
	movq	%rsi, -400(%rbp)	# argv, argv
# optimFox.c:111:     InitiateMatrix();
	call	InitiateMatrix	#
# optimFox.c:113:     MPI_Init_thread(&argc, &argv, MPI_THREAD_SINGLE, &provided);
	xorl	%edx, %edx	#
	leaq	-372(%rbp), %rcx	#, tmp188
	leaq	-400(%rbp), %rsi	#, tmp189
	leaq	-388(%rbp), %rdi	#, tmp190
	call	MPI_Init_thread@PLT	#
# optimFox.c:114:     MPI_Comm_size(MPI_COMM_WORLD, &size);
	leaq	-376(%rbp), %rsi	#, tmp191
	movl	$1140850688, %edi	#,
	call	MPI_Comm_size@PLT	#
# optimFox.c:115:     MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	leaq	-380(%rbp), %rsi	#, tmp192
	movl	$1140850688, %edi	#,
	call	MPI_Comm_rank@PLT	#
# optimFox.c:118:     t1 = MPI_Wtime();
	call	MPI_Wtime@PLT	#
	vxorpd	%xmm2, %xmm2, %xmm2	# tmp193
	vmovsd	%xmm0, -416(%rbp)	#, %sfp
# optimFox.c:119:     size_root = sqrt((double) size);
	vxorpd	%xmm0, %xmm0, %xmm0	# _2
	vcvtsi2sd	-376(%rbp), %xmm0, %xmm0	# size, _2, _2
	vucomisd	%xmm0, %xmm2	# _2, tmp193
	vsqrtsd	%xmm0, %xmm1, %xmm1	# _2, size_root
	ja	.L61	#,
.L17:
# optimFox.c:120:     q = (int) size_root;
	vcvttsd2si	%xmm1, %r12d	# size_root, q
# optimFox.c:122:     if (!((N % q == 0) && (size_root == round(size_root))))
	movl	$6, %eax	#, tmp194
	cltd
	idivl	%r12d	# q
	movl	%edx, %r13d	# <retval>, <retval>
	testl	%edx, %edx	# <retval>
	jne	.L18	#,
# optimFox.c:122:     if (!((N % q == 0) && (size_root == round(size_root))))
	vmovapd	%xmm1, %xmm0	# size_root,
	vmovsd	%xmm1, -408(%rbp)	# size_root, %sfp
	call	round@PLT	#
	vmovsd	-408(%rbp), %xmm1	# %sfp, size_root
	vucomisd	%xmm1, %xmm0	# size_root, _4
	jp	.L18	#,
	je	.L56	#,
.L18:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC3(%rip), %rsi	#,
	movl	$1, %edi	#,
	xorl	%eax, %eax	#
# optimFox.c:126:         return 1;
	movl	$1, %r13d	#, <retval>
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	__printf_chk@PLT	#
# optimFox.c:125:         MPI_Finalize();
	call	MPI_Finalize@PLT	#
.L16:
# optimFox.c:282: }
	movq	-56(%rbp), %rbx	# D.9765, tmp385
	xorq	%fs:40, %rbx	#, tmp385
	movl	%r13d, %eax	# <retval>,
	jne	.L62	#,
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
.L56:
	.cfi_restore_state
# optimFox.c:131:     MPI_Dims_create(size, 2, dims);
	leaq	-312(%rbp), %rbx	#, tmp197
	movl	$2, %esi	#,
	movl	-376(%rbp), %edi	# size,
# optimFox.c:130:     int dims[2] = {0, 0};               // Ask MPI to decompose our processes in a 2D cartesian grid for us
	movq	$0, -312(%rbp)	#, MEM[(int *)&dims]
# optimFox.c:131:     MPI_Dims_create(size, 2, dims);
	movq	%rbx, %rdx	# tmp197,
	call	MPI_Dims_create@PLT	#
# optimFox.c:135:     MPI_Cart_create(MPI_COMM_WORLD, 2, dims, periods, reorder, &cart_comm);
	leaq	-368(%rbp), %r9	#,
	movq	%rbx, %rdx	# tmp197,
	movl	$1, %r8d	#,
	leaq	-304(%rbp), %rcx	#, tmp201
	movl	$2, %esi	#,
	movl	$1140850688, %edi	#,
# optimFox.c:132:     int periods[2] = {1, 1};      //Mesh Topology, set to True for Torus Topology
	movabsq	$4294967297, %rax	#, tmp387
	movq	%rax, -304(%rbp)	# tmp387, MEM[(int *)&periods]
# optimFox.c:135:     MPI_Cart_create(MPI_COMM_WORLD, 2, dims, periods, reorder, &cart_comm);
	call	MPI_Cart_create@PLT	#
# optimFox.c:139:     MPI_Comm_rank(cart_comm, &cart_rank);
	movl	-368(%rbp), %edi	# cart_comm,
	leaq	-364(%rbp), %rsi	#, tmp203
	call	MPI_Comm_rank@PLT	#
# optimFox.c:140:     int x = cart_rank / q;
	movl	-364(%rbp), %esi	# cart_rank, cart_rank.3_7
# optimFox.c:146:     MPI_Comm_split(cart_comm, row, cart_rank, &row_comm);
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
# optimFox.c:149:     MPI_Comm_rank(row_comm, &row_rank);
	movl	-360(%rbp), %edi	# row_comm,
	leaq	-356(%rbp), %rsi	#, tmp209
	call	MPI_Comm_rank@PLT	#
# optimFox.c:150:     MPI_Comm_size(row_comm, &row_size);
	movl	-360(%rbp), %edi	# row_comm,
	leaq	-352(%rbp), %rsi	#, tmp211
	call	MPI_Comm_size@PLT	#
# optimFox.c:156:     MPI_Cart_shift(cart_comm, 0, 1, &send_to, &receive_from);
	movl	-368(%rbp), %edi	# cart_comm,
	xorl	%esi, %esi	#
	movl	$1, %edx	#,
	leaq	-344(%rbp), %rcx	#, tmp214
	leaq	-348(%rbp), %r8	#,
	call	MPI_Cart_shift@PLT	#
# optimFox.c:159:     double BufMatA[N_BAR][N_BAR], BufMatB[N_BAR][N_BAR], BufMatBtemp[N_BAR][N_BAR], BufMatC[N_BAR][N_BAR]={0}; //Local Buffers
	movl	%r13d, %eax	# <retval>, <retval>
	movl	$8, %ecx	#, tmp218
	leaq	-208(%rbp), %rdi	#, tmp367
	movq	%rdi, -432(%rbp)	# tmp367, %sfp
	rep stosl
# optimFox.c:168:     omp_set_num_threads(OMP_THREADS);
	movl	$2, %edi	#,
	call	omp_set_num_threads@PLT	#
# optimFox.c:174:             BufMatB[i][j] = MatB[x*N_BAR + j][y*N_BAR + i]; //Transposed matrix generation
	leal	(%rbx,%rbx), %edx	#, _298
	leal	(%r14,%r14), %eax	#, _300
	movslq	%edx, %rdx	# _298, _298
	cltq
	imulq	$6, %rdx, %rdx	#, _298, tmp221
	addq	%rdx, %rax	# tmp221, tmp222
	leaq	MatB(%rip), %rdx	#, tmp224
	salq	$3, %rax	#, tmp223
	addq	%rax, %rdx	# tmp223, vectp.78
	vmovupd	(%rdx), %ymm0	# MEM[(double *)vectp.78_281], vect__302.79
	vperm2f128	$48, 32(%rdx), %ymm0, %ymm0	#, MEM[(double *)vectp.78_281 + 32B], vect__302.79, tmp228
	vpermpd	$216, %ymm0, %ymm0	#, tmp228, vect__302.81
	vmovapd	%ymm0, -240(%rbp)	# vect__302.81, MEM[(double *)&BufMatB]
# optimFox.c:178:     for(int i = 0; i < q; i++) //Control stages and compute multiple for the submatrices **Should not be mulltithreaded**
	testl	%r12d, %r12d	# q
	jle	.L57	#,
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
.L24:
# optimFox.c:180:         if ((x + i) % row_size == y) //True if this is sender
	movl	%ebx, %eax	# ivtmp.122, tmp230
	movl	-360(%rbp), %r8d	# row_comm, pretmp_260
	cltd
	idivl	-352(%rbp)	# row_size
# optimFox.c:195:             MPI_Bcast(BufMatA,N_BAR*N_BAR,MPI_DOUBLE,(x + i) % row_size, row_comm);
	movl	%edx, %ecx	# tmp229,
# optimFox.c:180:         if ((x + i) % row_size == y) //True if this is sender
	cmpl	%r14d, %edx	# tmp206, tmp229
	jne	.L60	#,
	leaq	MatA(%rip), %rax	#, vectp.85
	addq	-424(%rbp), %rax	# %sfp, vectp.85
# optimFox.c:191:             MPI_Bcast(BufMatA,N_BAR*N_BAR,MPI_DOUBLE,row_rank, row_comm);
	movl	-356(%rbp), %ecx	# row_rank,
# optimFox.c:187:                     BufMatA[j][i] = MatA[x*N_BAR + j][y*N_BAR + i];
	vmovupd	(%rax), %ymm0	# MEM[(double *)vectp.85_55], vect__270.86
	vperm2f128	$48, 32(%rax), %ymm0, %ymm0	#, MEM[(double *)vectp.85_55 + 32B], vect__270.86, vect__270.88
	vmovapd	%ymm0, -272(%rbp)	# vect__270.88, MEM[(double *)&BufMatA]
.L60:
# optimFox.c:191:             MPI_Bcast(BufMatA,N_BAR*N_BAR,MPI_DOUBLE,row_rank, row_comm);
	movl	$1275070475, %edx	#,
	movl	$4, %esi	#,
	movq	%r13, %rdi	# tmp369,
	vzeroupper
	call	MPI_Bcast@PLT	#
# optimFox.c:207:                 sum += BufMatA[c][k]*BufMatB[d][k];
	vxorpd	%xmm3, %xmm3, %xmm3	# tmp246
# optimFox.c:224:         MPI_Sendrecv(   BufMatB,      N_BAR*N_BAR, MPI_DOUBLE, send_to,       0,
	pushq	$1	#
	movl	-368(%rbp), %eax	# cart_comm, cart_comm
	movl	-344(%rbp), %ecx	# send_to,
	movq	%r12, %r9	# tmp368,
	xorl	%r8d, %r8d	#
# optimFox.c:207:                 sum += BufMatA[c][k]*BufMatB[d][k];
	vmovapd	-240(%rbp), %ymm1	# MEM[(double *)&BufMatB], vect__331.97
# optimFox.c:224:         MPI_Sendrecv(   BufMatB,      N_BAR*N_BAR, MPI_DOUBLE, send_to,       0,
	movl	$1275070475, %edx	#,
	movl	$4, %esi	#,
# optimFox.c:207:                 sum += BufMatA[c][k]*BufMatB[d][k];
	vmovapd	-272(%rbp), %ymm0	# MEM[(double *)&BufMatA], vect__330.93
# optimFox.c:224:         MPI_Sendrecv(   BufMatB,      N_BAR*N_BAR, MPI_DOUBLE, send_to,       0,
	pushq	%rax	# cart_comm
	movl	-348(%rbp), %eax	# receive_from, receive_from
# optimFox.c:207:                 sum += BufMatA[c][k]*BufMatB[d][k];
	vpermpd	$221, %ymm1, %ymm2	#, vect__331.97, vect__335.108
	vpermpd	$160, %ymm0, %ymm4	#, vect__330.93, vect__330.94
# optimFox.c:224:         MPI_Sendrecv(   BufMatB,      N_BAR*N_BAR, MPI_DOUBLE, send_to,       0,
	pushq	$0	#
# optimFox.c:207:                 sum += BufMatA[c][k]*BufMatB[d][k];
	vpermpd	$136, %ymm1, %ymm1	#, vect__331.97, vect__331.98
	vfmadd132pd	%ymm4, %ymm3, %ymm1	# vect__330.94, tmp246, vect_sum_333.100
	vpermpd	$245, %ymm0, %ymm0	#, vect__330.93, vect__334.104
# optimFox.c:224:         MPI_Sendrecv(   BufMatB,      N_BAR*N_BAR, MPI_DOUBLE, send_to,       0,
	pushq	%rax	# receive_from
	movq	-408(%rbp), %rdi	# %sfp,
	pushq	$1275070475	#
	pushq	$4	#
# optimFox.c:207:                 sum += BufMatA[c][k]*BufMatB[d][k];
	vfmadd132pd	%ymm2, %ymm1, %ymm0	# vect__335.108, vect_sum_333.100, vect_sum_337.110
# optimFox.c:209:                 BufMatC[c][d] += sum;
	vaddpd	-208(%rbp), %ymm0, %ymm0	# MEM[(double *)&BufMatC], vect_sum_337.110, vect__339.114
	vmovapd	%ymm0, -208(%rbp)	# vect__339.114, MEM[(double *)&BufMatC]
# optimFox.c:224:         MPI_Sendrecv(   BufMatB,      N_BAR*N_BAR, MPI_DOUBLE, send_to,       0,
	vzeroupper
	addl	$1, %ebx	#, ivtmp.122
	call	MPI_Sendrecv@PLT	#
	vmovdqa	-176(%rbp), %xmm0	# MEM[(char * {ref-all})&BufMatBtemp], MEM[(char * {ref-all})&BufMatBtemp]
# optimFox.c:178:     for(int i = 0; i < q; i++) //Control stages and compute multiple for the submatrices **Should not be mulltithreaded**
	addq	$48, %rsp	#,
	vmovaps	%xmm0, -240(%rbp)	# MEM[(char * {ref-all})&BufMatBtemp], MEM[(char * {ref-all})&BufMatB]
	vmovdqa	-160(%rbp), %xmm0	# MEM[(char * {ref-all})&BufMatBtemp], MEM[(char * {ref-all})&BufMatBtemp]
	vmovaps	%xmm0, -224(%rbp)	# MEM[(char * {ref-all})&BufMatBtemp], MEM[(char * {ref-all})&BufMatB]
	cmpl	%ebx, %r15d	# ivtmp.122, _117
	jne	.L24	#,
	movl	-392(%rbp), %r12d	# %sfp, q
	movl	-436(%rbp), %r13d	# %sfp, <retval>
.L22:
# optimFox.c:235:     MPI_Type_contiguous(N_BAR*N_BAR, MPI_DOUBLE, &block2d);
	leaq	-340(%rbp), %rbx	#, tmp260
	movl	$1275070475, %esi	#,
	movl	$4, %edi	#,
# optimFox.c:230:     int sizes[2] = {N,N};
	movabsq	$25769803782, %rax	#, tmp399
# optimFox.c:235:     MPI_Type_contiguous(N_BAR*N_BAR, MPI_DOUBLE, &block2d);
	movq	%rbx, %rdx	# tmp260,
# optimFox.c:230:     int sizes[2] = {N,N};
	movq	%rax, -296(%rbp)	# tmp399, MEM[(int *)&sizes]
# optimFox.c:231:     int subsizes[2] = {N_BAR,N_BAR};
	movabsq	$8589934594, %rax	#, tmp400
	movq	%rax, -288(%rbp)	# tmp400, MEM[(int *)&subsizes]
# optimFox.c:232:     int starts[2] = {0,0};
	movq	$0, -280(%rbp)	#, MEM[(int *)&starts]
# optimFox.c:235:     MPI_Type_contiguous(N_BAR*N_BAR, MPI_DOUBLE, &block2d);
	call	MPI_Type_contiguous@PLT	#
# optimFox.c:236:     MPI_Type_commit(&block2d);
	movq	%rbx, %rdi	# tmp260,
# optimFox.c:239:     MPI_Type_create_subarray(2,sizes,subsizes,starts,MPI_ORDER_C,MPI_DOUBLE,&recvsubarray);
	leaq	-336(%rbp), %rbx	#, tmp265
# optimFox.c:236:     MPI_Type_commit(&block2d);
	call	MPI_Type_commit@PLT	#
# optimFox.c:239:     MPI_Type_create_subarray(2,sizes,subsizes,starts,MPI_ORDER_C,MPI_DOUBLE,&recvsubarray);
	subq	$8, %rsp	#,
	movl	$1275070475, %r9d	#,
	movl	$56, %r8d	#,
	pushq	%rbx	# tmp265
	leaq	-280(%rbp), %rcx	#, tmp262
	leaq	-288(%rbp), %rdx	#, tmp263
	movl	$2, %edi	#,
	leaq	-296(%rbp), %rsi	#, tmp264
	call	MPI_Type_create_subarray@PLT	#
# optimFox.c:240:     MPI_Type_commit(&recvsubarray);
	movq	%rbx, %rdi	# tmp265,
# optimFox.c:243:     MPI_Type_create_resized(recvsubarray, 0, 1*sizeof(double), &resizedrecvsubarray);
	leaq	-332(%rbp), %rbx	#, tmp267
# optimFox.c:240:     MPI_Type_commit(&recvsubarray);
	call	MPI_Type_commit@PLT	#
# optimFox.c:243:     MPI_Type_create_resized(recvsubarray, 0, 1*sizeof(double), &resizedrecvsubarray);
	movl	-336(%rbp), %edi	# recvsubarray,
	movq	%rbx, %rcx	# tmp267,
	xorl	%esi, %esi	#
	movl	$8, %edx	#,
	call	MPI_Type_create_resized@PLT	#
# optimFox.c:244:     MPI_Type_commit(&resizedrecvsubarray);
	movq	%rbx, %rdi	# tmp267,
	call	MPI_Type_commit@PLT	#
# optimFox.c:246:     int counts[]= { [0 ... (N*N/(N_BAR*N_BAR)-1)] = 1 };
	vmovdqa	.LC4(%rip), %ymm0	#, tmp270
# optimFox.c:248:     for (int i = 0; i < size; i++)
	popq	%rsi	#
# optimFox.c:246:     int counts[]= { [0 ... (N*N/(N_BAR*N_BAR)-1)] = 1 };
	movl	$1, -112(%rbp)	#, counts
# optimFox.c:248:     for (int i = 0; i < size; i++)
	movl	-376(%rbp), %ecx	# size, size.19_301
	popq	%rdi	#
# optimFox.c:246:     int counts[]= { [0 ... (N*N/(N_BAR*N_BAR)-1)] = 1 };
	vmovdqa	%ymm0, -144(%rbp)	# tmp270, MEM[(int *)&counts]
# optimFox.c:248:     for (int i = 0; i < size; i++)
	testl	%ecx, %ecx	# size.19_301
	jle	.L26	#,
# optimFox.c:250:         disps[i] = ( i % q ) * N_BAR + ( i / q) * N * N_BAR;
	movl	$0, -96(%rbp)	#, disps
# optimFox.c:248:     for (int i = 0; i < size; i++)
	cmpl	$1, %ecx	#, size.19_301
	je	.L26	#,
# optimFox.c:250:         disps[i] = ( i % q ) * N_BAR + ( i / q) * N * N_BAR;
	movl	$1, %eax	#, tmp274
	cltd
	idivl	%r12d	# q
	imull	$6, %eax, %eax	#, tmp272, tmp275
	addl	%edx, %eax	# tmp273, tmp280
	addl	%eax, %eax	# tmp281
	movl	%eax, -92(%rbp)	# tmp281, disps
# optimFox.c:248:     for (int i = 0; i < size; i++)
	cmpl	$2, %ecx	#, size.19_301
	je	.L26	#,
# optimFox.c:250:         disps[i] = ( i % q ) * N_BAR + ( i / q) * N * N_BAR;
	movl	$2, %eax	#, tmp285
	cltd
	idivl	%r12d	# q
	imull	$6, %eax, %eax	#, tmp283, tmp286
	addl	%edx, %eax	# tmp284, tmp291
	addl	%eax, %eax	# tmp292
	movl	%eax, -88(%rbp)	# tmp292, disps
# optimFox.c:248:     for (int i = 0; i < size; i++)
	cmpl	$3, %ecx	#, size.19_301
	je	.L26	#,
# optimFox.c:250:         disps[i] = ( i % q ) * N_BAR + ( i / q) * N * N_BAR;
	movl	$3, %eax	#, tmp296
	cltd
	idivl	%r12d	# q
	imull	$6, %eax, %eax	#, tmp294, tmp297
	addl	%edx, %eax	# tmp295, tmp302
	addl	%eax, %eax	# tmp303
	movl	%eax, -84(%rbp)	# tmp303, disps
# optimFox.c:248:     for (int i = 0; i < size; i++)
	cmpl	$4, %ecx	#, size.19_301
	je	.L26	#,
# optimFox.c:250:         disps[i] = ( i % q ) * N_BAR + ( i / q) * N * N_BAR;
	movl	$4, %eax	#, tmp307
	cltd
	idivl	%r12d	# q
	imull	$6, %eax, %eax	#, tmp305, tmp308
	addl	%edx, %eax	# tmp306, tmp313
	addl	%eax, %eax	# tmp314
	movl	%eax, -80(%rbp)	# tmp314, disps
# optimFox.c:248:     for (int i = 0; i < size; i++)
	cmpl	$5, %ecx	#, size.19_301
	je	.L26	#,
# optimFox.c:250:         disps[i] = ( i % q ) * N_BAR + ( i / q) * N * N_BAR;
	movl	$5, %eax	#, tmp318
	cltd
	idivl	%r12d	# q
	imull	$6, %eax, %eax	#, tmp316, tmp319
	addl	%edx, %eax	# tmp317, tmp324
	addl	%eax, %eax	# tmp325
	movl	%eax, -76(%rbp)	# tmp325, disps
# optimFox.c:248:     for (int i = 0; i < size; i++)
	cmpl	$6, %ecx	#, size.19_301
	je	.L26	#,
# optimFox.c:250:         disps[i] = ( i % q ) * N_BAR + ( i / q) * N * N_BAR;
	movl	$6, %eax	#, tmp329
	cltd
	idivl	%r12d	# q
	imull	$6, %eax, %eax	#, tmp327, tmp330
	addl	%eax, %eax	# tmp331
	movl	%eax, -72(%rbp)	# tmp331, disps
# optimFox.c:248:     for (int i = 0; i < size; i++)
	cmpl	$7, %ecx	#, size.19_301
	je	.L26	#,
# optimFox.c:250:         disps[i] = ( i % q ) * N_BAR + ( i / q) * N * N_BAR;
	movl	$7, %eax	#, tmp335
	cltd
	idivl	%r12d	# q
	imull	$6, %eax, %eax	#, tmp333, tmp336
	addl	%edx, %eax	# tmp334, tmp341
	addl	%eax, %eax	# tmp342
	movl	%eax, -68(%rbp)	# tmp342, disps
# optimFox.c:248:     for (int i = 0; i < size; i++)
	cmpl	$8, %ecx	#, size.19_301
	je	.L26	#,
# optimFox.c:250:         disps[i] = ( i % q ) * N_BAR + ( i / q) * N * N_BAR;
	movl	$8, %eax	#, tmp346
	cltd
	idivl	%r12d	# q
	imull	$6, %eax, %eax	#, tmp344, tmp347
	addl	%edx, %eax	# tmp345, tmp352
	addl	%eax, %eax	# tmp353
	movl	%eax, -64(%rbp)	# tmp353, disps
.L26:
# optimFox.c:253:     MPI_Gatherv(BufMatC,1,block2d,MatC,counts,disps,resizedrecvsubarray,0,MPI_COMM_WORLD);
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
# optimFox.c:256:     t2 = MPI_Wtime();
	addq	$32, %rsp	#,
	call	MPI_Wtime@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	-380(%rbp), %edx	# rank,
	movl	$1, %edi	#,
# optimFox.c:257:     t = t2-t1;
	vsubsd	-416(%rbp), %xmm0, %xmm0	# %sfp, t2, _47
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC5(%rip), %rsi	#,
	movl	$1, %eax	#,
# optimFox.c:257:     t = t2-t1;
	vmovsd	%xmm0, -328(%rbp)	# _47, t
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	__printf_chk@PLT	#
# optimFox.c:260:     MPI_Reduce(&t, &time_spent, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);
	subq	$8, %rsp	#,
	xorl	%r9d, %r9d	#
	movl	$1, %edx	#,
	pushq	$1140850688	#
	leaq	-320(%rbp), %rsi	#, tmp361
	movl	$1275070475, %ecx	#,
	leaq	-328(%rbp), %rdi	#, tmp362
	movl	$1476395011, %r8d	#,
# optimFox.c:259: 	double time_spent = 0;
	movq	$0x000000000, -320(%rbp)	#, time_spent
# optimFox.c:260:     MPI_Reduce(&t, &time_spent, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);
	call	MPI_Reduce@PLT	#
# optimFox.c:261: 	if(rank == 0)
	cmpl	$0, -380(%rbp)	#, rank
	popq	%rax	#
	popq	%rdx	#
	je	.L63	#,
.L28:
# optimFox.c:280:     MPI_Finalize();
	call	MPI_Finalize@PLT	#
# optimFox.c:281:     return 0;
	jmp	.L16	#
.L63:
# optimFox.c:262: 		printf("Total time by each process = %f  And Average = %f ", time_spent, time_spent/size);
	vxorpd	%xmm1, %xmm1, %xmm1	# tmp363
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$1, %edi	#,
	movl	$2, %eax	#,
# optimFox.c:262: 		printf("Total time by each process = %f  And Average = %f ", time_spent, time_spent/size);
	vmovsd	-320(%rbp), %xmm0	# time_spent, time_spent.25_50
	vcvtsi2sd	-376(%rbp), %xmm1, %xmm1	# size, tmp363, tmp363
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC6(%rip), %rsi	#,
	vdivsd	%xmm1, %xmm0, %xmm1	# tmp363, time_spent.25_50,
	call	__printf_chk@PLT	#
# optimFox.c:264:     if (rank == 0)
	cmpl	$0, -380(%rbp)	#, rank
	jne	.L28	#,
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC7(%rip), %rdi	#,
	call	puts@PLT	#
# optimFox.c:267:         PrintMatrix(MatA);
	leaq	MatA(%rip), %rdi	#,
	call	PrintMatrix	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC8(%rip), %rdi	#,
	call	puts@PLT	#
# optimFox.c:269:         PrintMatrix(MatB);
	leaq	MatB(%rip), %rdi	#,
	call	PrintMatrix	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:104:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC9(%rip), %rdi	#,
	call	puts@PLT	#
# optimFox.c:271:         PrintMatrix(MatC);
	leaq	MatC(%rip), %rdi	#,
	call	PrintMatrix	#
	jmp	.L28	#
.L57:
	vzeroupper
	jmp	.L22	#
.L61:
	vmovsd	%xmm1, -408(%rbp)	# size_root, %sfp
# optimFox.c:119:     size_root = sqrt((double) size);
	call	sqrt@PLT	#
	vmovsd	-408(%rbp), %xmm1	# %sfp, size_root
	jmp	.L17	#
.L62:
# optimFox.c:282: }
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE54:
	.size	main, .-main
	.comm	MatC,288,32
	.comm	MatB,288,32
	.comm	MatA,288,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	4290772992
	.long	1105199103
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC4:
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