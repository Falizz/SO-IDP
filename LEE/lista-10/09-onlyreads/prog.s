.intel_syntax noprefix
.global _start

.section .text

_start:

    xor     eax, eax
    xor     edi, edi
    inc     edi

    mov     rsi, 0x5544707f2000

    xor     edx, edx
    mov     dl, 0xff

    syscall

    mov     eax, 60
    xor     edi, edi
    syscall