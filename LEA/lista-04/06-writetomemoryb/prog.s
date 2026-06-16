.intel_syntax noprefix
.global _start

.section .text

_start:
    mov dword ptr [rdi], 0xF3C4FECA
    inc rdi
    inc rdi
    inc rdi
    inc rdi
    mov dword ptr [rdi], 0x1AC0C4C0