.intel_syntax noprefix
.global _start

.section .text

_start:
    mov eax, DWORD PTR [r15]
    mov ecx, DWORD PTR [r15 + 4]

    cmp eax, ecx
    jge fim

    mov eax, ecx

fim:
    mov eax, eax