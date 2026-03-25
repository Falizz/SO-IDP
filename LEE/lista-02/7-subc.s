.intel_syntax noprefix
.global _start
.section .text

_start:
    mov rax, 106498801202921
    not rax
    inc rax
    add r15, rax