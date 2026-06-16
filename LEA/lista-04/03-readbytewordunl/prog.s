.intel_syntax noprefix
.global _section

.section .text

_start:
    xor rax, rax
    xor rcx, rcx
    mov al, [0x404000]
    mov cx, [0x404004]