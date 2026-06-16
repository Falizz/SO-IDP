.intel_syntax noprefix
.global _start

.section .text

_start:
    lea rdi, [rip + caminho]
    xor esi, esi
    mov eax, 2
    syscall

    mov edi, eax    
    sub rsp, 256
    mov rsi, rsp
    mov edx, 256
    xor eax, eax
    syscall

    mov edx, eax
    mov edi, 1
    mov rsi, rsp
    mov eax, 1
    syscall

    mov eax, 60
    xor edi, edi
    syscall
caminho:
    .asciz "/desafio/recompensa.txt"