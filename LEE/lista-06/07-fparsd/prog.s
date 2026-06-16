.intel_syntax noprefix
.global _start

.section .text

_start:
    mov edi, 8038449
    mov esi, 0x41
    movabs rax, 0x4083736872b020c5
    movq xmm0, rax

    mov rax, 0x404438
    mov rax, [rax]
    call rax