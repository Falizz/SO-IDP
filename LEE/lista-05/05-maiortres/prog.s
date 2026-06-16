.intel_syntax noprefix
.global _start

.section .text

_start:
    mov rax, QWORD PTR [r12]
    mov rcx, QWORD PTR [r12 + 8]
    mov rdx, QWORD PTR [r12 + 16]

    cmp rax, rcx
    jge testa_terceiro

    mov rax, rcx

testa_terceiro:
    cmp rax, rdx
    jge fim

    mov rax, rdx

fim: