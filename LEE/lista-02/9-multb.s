.intel_syntax noprefix
.global _start
.section .text

_start:
    mov rbx, rax
    mov rsi, rdx
    mov rcx, r9
    mov rax, rsi
    imul rcx
    mov r8, rdx
    mov rdi, rax
    mov rax, rbx
    mov rdx, rsi
    