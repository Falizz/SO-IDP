.intel_syntax noprefix
.global _start

.section .text

_start:
    mov rdi, [0x404000]
    add rdi, 0x42
    mov [0x404000], rdi
    sub rdi, 0x42