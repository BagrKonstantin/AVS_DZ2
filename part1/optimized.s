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
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 1040
	mov	DWORD PTR -4[rbp], 0
.L2:
	mov	rax, QWORD PTR stdin[rip]
	mov	rdi, rax
	call	fgetc@PLT
	mov	BYTE PTR -21[rbp], al
	mov	eax, DWORD PTR -4[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -4[rbp], edx
	cdqe
	movzx	edx, BYTE PTR -21[rbp]
	mov	BYTE PTR -1040[rbp+rax], dl
	cmp	BYTE PTR -21[rbp], -1
	jne	.L2
	mov	eax, DWORD PTR -4[rbp]
	sub	eax, 1
	cdqe
	mov	BYTE PTR -1040[rbp+rax], 0
	mov	eax, DWORD PTR -4[rbp]
	mov	DWORD PTR -28[rbp], eax
	mov	DWORD PTR -8[rbp], 0
	mov	DWORD PTR -4[rbp], 0
	jmp	.L3
.L11:
	cmp	DWORD PTR -8[rbp], 1
	jne	.L4
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	movzx	eax, BYTE PTR -1040[rbp+rax]
	cmp	al, 64
	jle	.L5
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	movzx	eax, BYTE PTR -1040[rbp+rax]
	cmp	al, 122
	jg	.L5
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	movzx	eax, BYTE PTR -1040[rbp+rax]
	cmp	al, 90
	jle	.L6
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	movzx	eax, BYTE PTR -1040[rbp+rax]
	cmp	al, 96
	jg	.L6
.L5:
	mov	eax, DWORD PTR -4[rbp]
	sub	eax, 1
	mov	DWORD PTR -32[rbp], eax
	mov	DWORD PTR -8[rbp], 0
	mov	eax, DWORD PTR -12[rbp]
	mov	DWORD PTR -16[rbp], eax
	mov	eax, DWORD PTR -32[rbp]
	mov	DWORD PTR -20[rbp], eax
	jmp	.L7
.L8:
	mov	eax, DWORD PTR -16[rbp]
	cdqe
	movzx	eax, BYTE PTR -1040[rbp+rax]
	mov	BYTE PTR -21[rbp], al
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	movzx	edx, BYTE PTR -1040[rbp+rax]
	mov	eax, DWORD PTR -16[rbp]
	cdqe
	mov	BYTE PTR -1040[rbp+rax], dl
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	movzx	edx, BYTE PTR -21[rbp]
	mov	BYTE PTR -1040[rbp+rax], dl
	add	DWORD PTR -16[rbp], 1
	sub	DWORD PTR -20[rbp], 1
.L7:
	mov	eax, DWORD PTR -16[rbp]
	cmp	eax, DWORD PTR -20[rbp]
	jl	.L8
	jmp	.L6
.L4:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	movzx	eax, BYTE PTR -1040[rbp+rax]
	cmp	al, 64
	jle	.L9
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	movzx	eax, BYTE PTR -1040[rbp+rax]
	cmp	al, 90
	jle	.L10
.L9:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	movzx	eax, BYTE PTR -1040[rbp+rax]
	cmp	al, 96
	jle	.L6
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	movzx	eax, BYTE PTR -1040[rbp+rax]
	cmp	al, 122
	jg	.L6
.L10:
	mov	eax, DWORD PTR -4[rbp]
	mov	DWORD PTR -12[rbp], eax
	mov	DWORD PTR -8[rbp], 1
.L6:
	add	DWORD PTR -4[rbp], 1
.L3:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L11
	mov	edi, 10
	call	putchar@PLT
	lea	rax, -1040[rbp]
	mov	rsi, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	leave
	ret
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
