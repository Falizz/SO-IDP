.intel_syntax noprefix
.global _start

.section .text

_start:
    mov edi, 10831
    mov rax, 0x404718
    mov rax, [rax]
    call rax