.intel_syntax noprefix
.global _start

.section .text

_start:
    mov r8, [rsp]
    add rsp, 8