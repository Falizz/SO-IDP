.intel_syntax noprefix
.global _start

.section .text

_start:
    xor eax, eax

    cmp r13, r11
    jle testa_invertido
    cmp r13, r8
    jge testa_invertido
    mov eax, 1
    jmp fim

testa_invertido:
    cmp r13, r8
    jle fim
    cmp r13, r11
    jge fim
    mov eax, 1

fim: