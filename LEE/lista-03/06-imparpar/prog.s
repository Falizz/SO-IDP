.intel_syntax noprefix
.global _start

.section .text

_start:
    and rax, 0
    or rax, rbx
    and rax, 1
    xor rax, 1