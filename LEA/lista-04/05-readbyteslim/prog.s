.intel_syntax noprefix
.global _start

.section .text

_start:
    mov r9, [0x404000]

    and rbp, 0
    or  rbp, r9
    and rbp, 0xff

    shr r9, 8
    and rsi, 0
    or  rsi, r9
    and rsi, 0xff

    shr r9, 8
    and rax, 0
    or  rax, r9
    and rax, 0xff

    shr r9, 8
    and r9, 0xff