.intel_syntax noprefix
.global _start

.section .text

_start:
    cmp rdi, 3
    ja default

    jmp QWORD PTR [rsi + rdi * 8]

default:
    jmp QWORD PTR [rsi + 0x20]