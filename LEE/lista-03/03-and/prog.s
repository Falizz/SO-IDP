.intel_syntax noprefix
.global _start

.section .text

_start:
    xor rax, rax
    or rax, rsi
    and rax, r12