.file	"foo.c"
	.intel_syntax noprefix
	.text
	.globl	str
	.bss
	.align 32
	.type	str, @object
	.size	str, 1000
str:
	.zero	1000
	.text
	.globl	reverse
	.type	reverse, @function
reverse:
	endbr64
	push	rbp
	mov	rbp, rsp
	jmp	.L2
.L3:
	mov	eax, edi
	cdqe
	lea	rdx, str[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	mov	BYTE PTR -9[rbp], al
	mov	eax, esi
	cdqe
	lea	rdx, str[rip]
	movzx	edx, BYTE PTR [rax+rdx]
	mov	eax, edi
	cdqe
	lea	rcx, str[rip]
	mov	BYTE PTR [rax+rcx], dl
	mov	eax, esi
	cdqe
	lea	rcx, str[rip]
	movzx	edx, BYTE PTR -9[rbp]
	mov	BYTE PTR [rax+rcx], dl
	add	edi, 1                              # j += 1
	sub	esi, 1                              # t -= 1
.L2:
	cmp	edi, esi                            # j < t
	jl	.L3
	mov	eax, 0                              # return 0
	pop	rbp
	ret
	.size	reverse, .-reverse
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
	sub	rsp, 32
	mov	ebx, 0                              #  i = 0
.L6:
	mov	rax, QWORD PTR stdin[rip]
	mov	rdi, rax
	call	fgetc@PLT
	mov	BYTE PTR -13[rbp], al
	mov	eax, ebx
	lea	edx, 1[rax]
	mov	ebx, edx
	cdqe
	lea	rcx, str[rip]
	movzx	edx, BYTE PTR -13[rbp]
	mov	BYTE PTR [rax+rcx], dl
	cmp	BYTE PTR -13[rbp], -1
	jne	.L6
	mov	eax, ebx
	sub	eax, 1
	cdqe
	lea	rdx, str[rip]
	mov	BYTE PTR [rax+rdx], 0
	mov	eax, ebx
	mov	DWORD PTR -20[rbp], eax
	mov	ecx, 0
	mov	ebx, 0
	jmp	.L7
.L13:
	cmp	ecx, 1
	jne	.L8
	mov	eax, ebx
	cdqe
	lea	rdx, str[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, 64
	jle	.L9
	mov	eax, ebx
	cdqe
	lea	rdx, str[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, 122
	jg	.L9
	mov	eax, ebx
	cdqe
	lea	rdx, str[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, 90
	jle	.L10
	mov	eax, ebx
	cdqe
	lea	rdx, str[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, 96
	jg	.L10
.L9:
	mov	eax, ebx
	lea	esi, -1[rax]                                # r
	mov	edi, DWORD PTR -12[rbp]                     # l
	call	reverse
	mov	ecx, eax                                    # isword = 0
	jmp	.L10
.L8:
	mov	eax, ebx
	cdqe
	lea	rdx, str[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, 64
	jle	.L11
	mov	eax, ebx
	cdqe
	lea	rdx, str[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, 90
	jle	.L12
.L11:
	mov	eax, ebx
	cdqe
	lea	rdx, str[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, 96
	jle	.L10
	mov	eax, ebx
	cdqe
	lea	rdx, str[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, 122
	jg	.L10
.L12:
	mov	eax, ebx
	mov	DWORD PTR -12[rbp], eax
	mov	ecx, 1
.L10:
	add	ebx, 1
.L7:
	mov	eax, ebx
	cmp	eax, DWORD PTR -20[rbp]
	jl	.L13
	mov	edi, 10
	call	putchar@PLT
	lea	rax, str[rip]
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
