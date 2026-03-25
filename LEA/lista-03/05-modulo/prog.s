.intel_syntax noprefix
.global _start

.section .text

_start:
    mov  rsi, rdx
    mov rdx, 0
    mov rax, rsi
    div rbx
    mov rax, rdx
    mov rdx, rsi
    