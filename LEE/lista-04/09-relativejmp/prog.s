.intel_syntax noprefix
.global _start

.section .text
_start:
    jmp .+0x4a
    .rept 0x48
        nop
    .endr
    mov rdi, 0xb8130267