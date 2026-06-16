.intel_syntax noprefix
.global _start
.section .text

_start:
    mov rax, rdi
    mov rdx, 0
    div rsi