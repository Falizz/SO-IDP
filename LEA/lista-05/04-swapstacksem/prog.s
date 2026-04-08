.intel_syntax noprefix
.global _start

.section .text

_start:
    mov rax, [rsp]
    add rsp, 8

    mov rbx, [rsp]

    mov [rsp], rax

    sub rsp, 8
    mov [rsp], rbx