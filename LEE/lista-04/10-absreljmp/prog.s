.intel_syntax noprefix
.global _start

.section .text
_start:
    jmp .+0x59
    .rept 0x57
    nop
    .endr
    pop rdi
    mov rax, 0x403000
    jmp rax