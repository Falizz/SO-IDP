.intel_syntax noprefix
.global _start

.section .text

_start:
    xor rax, rax

    test rdi, rdi
    jz fim

loop:
    cmp BYTE PTR [rdi + rax], 0
    je fim

    inc rax
    jmp loop

fim: