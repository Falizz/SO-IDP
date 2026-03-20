.intel_syntax noprefix
.section .text
.global _start

_start:
    xor rbx, r8
    xor r8, rbx
    xor rbx, r8