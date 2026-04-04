.intel_syntax noprefix
.global _start

.section .text

_start:
    pop rax
    pop rbx

    mov rsi, rax
    xor rsi, rbx

    push rax
    push rsi
    push rbx