.intel_syntax noprefix
.global _start

.section .text

_start:
    mov r14b, [0x404000]
    mov bl, [0x404001]
    mov sil, [0x404002]
    mov dl, [0x404003]