.intel_syntax noprefix
.global _start

.section .text

_start:
    and rax, 0
    or rax, r8
    or rax, r13
    and rbx, 0
    and rsi, 0
    or rsi, r8
    or rbx, r13
    and rbx, rsi
    not rbx
    and rax, rbx
    