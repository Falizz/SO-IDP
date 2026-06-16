.intel_syntax noprefix
.global _start

.section .text

_start:
    mov rax, 0x4042b8
    mov rax, [rax]
    call rax