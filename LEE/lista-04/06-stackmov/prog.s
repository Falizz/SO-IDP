.intel_syntax noprefix
.global _start

.section .text

_start:
    mov rax, [rsp]
    add rsp, 8

    mov rbx, [rsp]
    add rsp, 8

    mov rcx, [rsp]
    add rsp, 8

    mov rdx, [rsp]
    add rsp, 8

    mov rsi, [rsp]
    add rsp, 8

    add rsi, rax
    add rsi, rbx
    add rsi, rcx
    add rsi, rdx

    mov rdx, 0
    mov rax, rsi

    mov rdi, 5
    div rdi

    sub rsp, 8
    mov [rsp], rax