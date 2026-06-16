.intel_syntax noprefix
.global _start

.section .text

_start:
    and r8, 1
    and r9, 1
    and r12, 1

    // 1. Calcula A AND B AND C (guardando em rax)
    and rax, 0
    or rax, r8
    and rax, r9
    and rax, r12

    // 2. Inverte o valor (XOR 1 equivale a NOT para 1 bit, restando limpo)
    xor rax, 1

    // 3. Calcula A XOR B XOR C (aproveitando r8)
    and rsi,
    or rsi, r8

    xor rsi, r9
    xor rsi, r12

    // 4. Junta as duas partes: rax = (A ^ B ^ C) AND ~(A & B & C)
    and rax, rsi