.intel_syntax noprefix
.global _start

.section .text

_start:
    mov r13, 0x7FFFFFFFFFFFFFFF
    add r13, 1