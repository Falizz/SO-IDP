.intel_syntax noprefix
.global _start

.section .text

_start:

    mov rdx, [0x404000]
    add rdx, 0x42
    mov [0x404000], rdx
    sub rdx, 0x42