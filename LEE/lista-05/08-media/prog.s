.intel_syntax noprefix
.global _start

.section .text

_start:
    xor rax, rax
    xor rcx, rcx

loop:
    add rax, QWORD PTR [rdi + rcx * 8]
    inc rcx
    cmp rcx, rsi
    jl loop

    cqo
    idiv rsi

fim: