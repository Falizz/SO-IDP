.intel_syntax noprefix
.global _start

.section .text
_start:
    mov rax, 0x1AC0C4C0F3C4FECA
    mov [rsi], rax