.intel_syntax noprefix
.global _start
.section .text

_start:
    mov rax, 42
    mov rdi, 0x7777
    mov r11, 0xFEEDF00DC0CACAFE