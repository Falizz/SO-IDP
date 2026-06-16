.intel_syntax noprefix
.global _start

.section .text

//  a b c | a b     rsi rdx r11 | rsi rdx
//  d e f | d e     rbx rcx r8  | rbx rcx
//  g h i | g h     rdi r15 r13 | rdi r15

_start:
    // a * e * i
    mov rax, rsi
    imul rax, rcx
    imul rax, r13
    mov r12, rax
    
    // b * f * g
    mov rax, rdx
    imul rax, r8
    imul rax, rdi
    add r12, rax

    // c * d * h
    mov rax, r11
    imul rax, rbx
    imul rax, r15
    add r12, rax

    // -(c * e * g)
    mov rax, r11
    imul rax, rcx
    imul rax, rdi
    sub r12, rax

    // -(a * f * h)
    mov rax, rsi
    imul rax, r8
    imul rax, r15
    sub r12, rax

    // -(b * d * i)
    mov rax, rdx
    imul rax, rbx
    imul rax, r13
    sub r12, rax

    mov rax, r12