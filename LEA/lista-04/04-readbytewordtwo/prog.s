.intel_syntax noprefix
.global _section

.section .text

_start:
    movzx ebx, byte ptr [0x404000]
    movzx r15, word ptr [0x404004]