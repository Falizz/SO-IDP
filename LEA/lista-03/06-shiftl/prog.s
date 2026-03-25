.intel_syntax noprefix
.global _start

.section .text

_start:
    mov rax, r8
    shl rax, 14