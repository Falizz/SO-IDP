.intel_syntax noprefix
.global _start

.section .text

_start:
    sub rsp, 8
    mov [rsp], rdi