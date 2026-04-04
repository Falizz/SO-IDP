.intel_syntax noprefix
.global _start

.section .text

_start:
    mov rax, [rdx]
    mov rbx, [rdx + 8]
    

    mov rcx, rax
    add rcx, rbx
    mov [r15], rcx

    xor rax, rbx
    mov [r15 + 8], rax
