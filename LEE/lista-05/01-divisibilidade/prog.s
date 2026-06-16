.intel_syntax noprefix
.global _start

.section .text

_start:
    test dword ptr [rdx], 15
    je is_divisible
    mov rax, 0
    jmp end_if
is_divisible:
    mov rax, 1
end_if: