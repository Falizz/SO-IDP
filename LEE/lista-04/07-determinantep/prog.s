.intel_syntax noprefix
.global _start

.section .text
_start:
    push r10

    mov rax, rdi
    imul rax, rcx

    mov r10, r11
    imul r10, r14

    sub rax, r10

    mov r10, r15
    imul r10, rax
    push r10

    mov rax, r13
    imul rax, rcx

    mov r10, r11
    imul r10, rdx

    sub rax, r10

    mov r10, [rsp+8]
    imul r10, rax
    push r10

    mov rax, r13
    imul rax, r14

    mov r10, rdi
    imul r10, rdx

    sub rax, r10
    imul rax, rbx

    pop r10
    sub rax, r10

    pop r10
    add rax, r10

    pop r10