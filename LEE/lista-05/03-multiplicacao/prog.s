.intel_syntax noprefix
.global _start

.section .text

_start:
    pop rax
    pop rcx

    imul rcx

    jo overflow

    jmp fim

overflow:
    mov rax, -1

fim: