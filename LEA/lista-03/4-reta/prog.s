.intel_syntax noprefix
.global _start

.section .text

_start:
    mov rax, r13
    imul rax, r8
    add rax, rcx