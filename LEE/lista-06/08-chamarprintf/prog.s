.intel_syntax noprefix
.global _start

.section .text

_start:
    sub rsp, 8

    lea rdi, [rip + fmt_str]

    mov rsi, 0x4040c0
    mov rdx, 0x405400
    mov rcx, 0x408b40
    xor eax, eax

    mov r11, 0x40bcd8
    mov r11, [r11]

    call r11

    add rsp, 8
    ret

fmt_str:
    .asciz "%s%s%s\n"