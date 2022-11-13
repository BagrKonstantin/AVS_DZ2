	.file	"foo.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%s"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 1040
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	DWORD PTR -1036[rbp], 0
.L2:
	mov	rax, QWORD PTR stdin[rip]
	mov	rdi, rax
	call	fgetc@PLT
	mov	BYTE PTR -1037[rbp], al
	mov	eax, DWORD PTR -1036[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -1036[rbp], edx
	cdqe
	movzx	edx, BYTE PTR -1037[rbp]
	mov	BYTE PTR -1008[rbp+rax], dl
	cmp	BYTE PTR -1037[rbp], -1
	jne	.L2
	mov	eax, DWORD PTR -1036[rbp]
	sub	eax, 1
	cdqe
	mov	BYTE PTR -1008[rbp+rax], 0
	mov	eax, DWORD PTR -1036[rbp]
	mov	DWORD PTR -1016[rbp], eax
	mov	DWORD PTR -1032[rbp], 0
	mov	DWORD PTR -1036[rbp], 0
	jmp	.L3
.L11:
	cmp	DWORD PTR -1032[rbp], 1
	jne	.L4
	mov	eax, DWORD PTR -1036[rbp]
	cdqe
	movzx	eax, BYTE PTR -1008[rbp+rax]
	cmp	al, 64
	jle	.L5
	mov	eax, DWORD PTR -1036[rbp]
	cdqe
	movzx	eax, BYTE PTR -1008[rbp+rax]
	cmp	al, 122
	jg	.L5
	mov	eax, DWORD PTR -1036[rbp]
	cdqe
	movzx	eax, BYTE PTR -1008[rbp+rax]
	cmp	al, 90
	jle	.L6
	mov	eax, DWORD PTR -1036[rbp]
	cdqe
	movzx	eax, BYTE PTR -1008[rbp+rax]
	cmp	al, 96
	jg	.L6
.L5:
	mov	eax, DWORD PTR -1036[rbp]
	sub	eax, 1
	mov	DWORD PTR -1012[rbp], eax
	mov	DWORD PTR -1032[rbp], 0
	mov	eax, DWORD PTR -1028[rbp]
	mov	DWORD PTR -1024[rbp], eax
	mov	eax, DWORD PTR -1012[rbp]
	mov	DWORD PTR -1020[rbp], eax
	jmp	.L7
.L8:
	mov	eax, DWORD PTR -1024[rbp]
	cdqe
	movzx	eax, BYTE PTR -1008[rbp+rax]
	mov	BYTE PTR -1037[rbp], al
	mov	eax, DWORD PTR -1020[rbp]
	cdqe
	movzx	edx, BYTE PTR -1008[rbp+rax]
	mov	eax, DWORD PTR -1024[rbp]
	cdqe
	mov	BYTE PTR -1008[rbp+rax], dl
	mov	eax, DWORD PTR -1020[rbp]
	cdqe
	movzx	edx, BYTE PTR -1037[rbp]
	mov	BYTE PTR -1008[rbp+rax], dl
	add	DWORD PTR -1024[rbp], 1
	sub	DWORD PTR -1020[rbp], 1
.L7:
	mov	eax, DWORD PTR -1024[rbp]
	cmp	eax, DWORD PTR -1020[rbp]
	jl	.L8
	jmp	.L6
.L4:
	mov	eax, DWORD PTR -1036[rbp]
	cdqe
	movzx	eax, BYTE PTR -1008[rbp+rax]
	cmp	al, 64
	jle	.L9
	mov	eax, DWORD PTR -1036[rbp]
	cdqe
	movzx	eax, BYTE PTR -1008[rbp+rax]
	cmp	al, 90
	jle	.L10
.L9:
	mov	eax, DWORD PTR -1036[rbp]
	cdqe
	movzx	eax, BYTE PTR -1008[rbp+rax]
	cmp	al, 96
	jle	.L6
	mov	eax, DWORD PTR -1036[rbp]
	cdqe
	movzx	eax, BYTE PTR -1008[rbp+rax]
	cmp	al, 122
	jg	.L6
.L10:
	mov	eax, DWORD PTR -1036[rbp]
	mov	DWORD PTR -1028[rbp], eax
	mov	DWORD PTR -1032[rbp], 1
.L6:
	add	DWORD PTR -1036[rbp], 1
.L3:
	mov	eax, DWORD PTR -1036[rbp]
	cmp	eax, DWORD PTR -1016[rbp]
	jl	.L11
	mov	edi, 10
	call	putchar@PLT
	lea	rax, -1008[rbp]
	mov	rsi, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
