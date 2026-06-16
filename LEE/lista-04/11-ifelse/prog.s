.intel_syntax noprefix
.global _start

.section .text
_start:
    mov eax, [r9]
    and eax, 1
    jz par
    mov rax, 0
    jmp fim
par:
    mov rax, 1
fim: