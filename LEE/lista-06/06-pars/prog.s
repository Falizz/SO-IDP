.intel_syntax noprefix
.global _start

.section .text

_start:
    mov edi, 1962583
    mov esi, 'G'
    mov edx, 'y'

    mov rax, 0x404220
    mov rax, [rax]
    call rax
