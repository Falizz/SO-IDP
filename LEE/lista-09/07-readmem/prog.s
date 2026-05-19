.intel_syntax noprefix
.global _start

.section .text

_start:

mov rax, 1
mov rdi, 1

mov rsi, 0x554495ddb000

mov rdx, 128
syscall

mov rax, 60
xor rdi, rdi
syscall