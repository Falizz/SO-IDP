.intel_syntax noprefix
.global _start

.section .text

_start:
    mov rsi, 0x554488ef9000
    mov rdx, 0x1000

    mov rdi, 1
    mov rax, 1
    syscall

    xor rdi, rdi
    mov rax, 60
    syscall