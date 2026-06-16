.intel_syntax noprefix
.global _start

.section .text

_start:
    pop rax
    imul rax, r13
    push rax