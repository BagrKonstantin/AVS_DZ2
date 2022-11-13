.file	"foo.c"
	.intel_syntax noprefix
	.text
	.globl	str
	.bss
	.align 32
	.type	str, @object
	.size	str, 1000
str:
        .zero   1000
reverse:
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR [rbp-20], edi
        mov     DWORD PTR [rbp-24], esi
        mov     eax, DWORD PTR [rbp-20]
        mov     DWORD PTR [rbp-4], eax
        mov     eax, DWORD PTR [rbp-24]
        mov     DWORD PTR [rbp-8], eax
        jmp     .L2
.L3:
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        movzx   eax, BYTE PTR str[rax]
        mov     BYTE PTR [rbp-9], al
        mov     eax, DWORD PTR [rbp-8]
        cdqe
        movzx   edx, BYTE PTR str[rax]
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        mov     BYTE PTR str[rax], dl
        mov     eax, DWORD PTR [rbp-8]
        cdqe
        movzx   edx, BYTE PTR [rbp-9]
        mov     BYTE PTR str[rax], dl
        add     DWORD PTR [rbp-4], 1
        sub     DWORD PTR [rbp-8], 1
.L2:
        mov     eax, DWORD PTR [rbp-4]
        cmp     eax, DWORD PTR [rbp-8]
        jl      .L3
        mov     eax, 0
        pop     rbp
        ret
.LC0:
        .string "%s"
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     DWORD PTR [rbp-4], 0
.L6:
        mov     rax, QWORD PTR stdin[rip]
        mov     rdi, rax
        call    fgetc
        mov     BYTE PTR [rbp-13], al
        movzx   edx, BYTE PTR [rbp-13]
        mov     eax, DWORD PTR [rbp-4]
        lea     ecx, [rax+1]
        mov     DWORD PTR [rbp-4], ecx
        cdqe
        mov     BYTE PTR str[rax], dl
        cmp     BYTE PTR [rbp-13], -1
        jne     .L6
        mov     eax, DWORD PTR [rbp-4]
        sub     eax, 1
        cdqe
        mov     BYTE PTR str[rax], 0
        mov     eax, DWORD PTR [rbp-4]
        mov     DWORD PTR [rbp-20], eax
        mov     DWORD PTR [rbp-8], 0
        mov     DWORD PTR [rbp-4], 0
        jmp     .L7
.L13:
        cmp     DWORD PTR [rbp-8], 1
        jne     .L8
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        movzx   eax, BYTE PTR str[rax]
        cmp     al, 64
        jle     .L9
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        movzx   eax, BYTE PTR str[rax]
        cmp     al, 122
        jg      .L9
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        movzx   eax, BYTE PTR str[rax]
        cmp     al, 90
        jle     .L10
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        movzx   eax, BYTE PTR str[rax]
        cmp     al, 96
        jg      .L10
.L9:
        mov     eax, DWORD PTR [rbp-4]
        lea     edx, [rax-1]
        mov     eax, DWORD PTR [rbp-12]
        mov     esi, edx
        mov     edi, eax
        call    reverse
        mov     DWORD PTR [rbp-8], eax
        jmp     .L10
.L8:
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        movzx   eax, BYTE PTR str[rax]
        cmp     al, 64
        jle     .L11
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        movzx   eax, BYTE PTR str[rax]
        cmp     al, 90
        jle     .L12
.L11:
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        movzx   eax, BYTE PTR str[rax]
        cmp     al, 96
        jle     .L10
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        movzx   eax, BYTE PTR str[rax]
        cmp     al, 122
        jg      .L10
.L12:
        mov     eax, DWORD PTR [rbp-4]
        mov     DWORD PTR [rbp-12], eax
        mov     DWORD PTR [rbp-8], 1
.L10:
        add     DWORD PTR [rbp-4], 1
.L7:
        mov     eax, DWORD PTR [rbp-4]
        cmp     eax, DWORD PTR [rbp-20]
        jl      .L13
        mov     edi, 10
        call    putchar
        mov     esi, OFFSET FLAT:str
        mov     edi, OFFSET FLAT:.LC0
        mov     eax, 0
        call    printf
        mov     eax, 0
        leave
        ret
