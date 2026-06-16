.intel_syntax noprefix
.global _start

.section .text

_start:
    mov rax, rbx
    shl rax, 24
    shr rax, 56