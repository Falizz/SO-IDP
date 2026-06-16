.intel_syntax noprefix
.global _start

.section .text

_start:
    mov rax, QWORD PTR [rdi]
    mov rcx, 1

loop:
    cmp rcx, rsi
    jge fim

    mov rdx, QWORD PTR [rdi + rcx * 8]
    cmp rdx, rax
    jle proximo

    mov rax, rdx

proximo:
    inc rcx
    jmp loop

fim: