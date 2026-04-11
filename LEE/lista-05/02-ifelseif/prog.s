.intel_syntax noprefix
.global _start

.section .text

_start:
    mov eax, DWORD PTR [r13]

    cmp eax, 0x7f45cafe
    jne teste_else_if

    mov eax,  DWORD PTR [r13 + 4]
    mov ecx,  DWORD PTR [r13 + 8]
    mov edx,  DWORD PTR [r13 + 12]
    add eax, ecx
    add eax, edx
    mov eax, eax
    jmp fim

teste_else_if:
    cmp eax, 0x00005AAD
    jne bloco_else

    mov eax,  DWORD PTR [r13 + 4]
    mov ecx,  DWORD PTR [r13 + 8]
    mov edx,  DWORD PTR [r13 + 12]
    sub eax, ecx
    sub eax, edx
    mov eax, eax
    jmp fim

bloco_else:
    mov eax,  DWORD PTR [r13 + 4]
    mov ecx,  DWORD PTR [r13 + 8]
    mov edx,  DWORD PTR [r13 + 12]
    imul eax, ecx
    imul eax, edx
    mov eax, eax
    jmp fim

fim: