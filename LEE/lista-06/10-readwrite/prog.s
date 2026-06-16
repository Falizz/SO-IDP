.intel_syntax noprefix
.global _start

.section .text

_start:
    mov edi, 133        
    mov esi, 0x404100   
    mov edx, 256        
    xor eax, eax        
    syscall             

    mov rdx, rax        
    mov edi, 1          
    mov esi, 0x404100   
    mov eax, 1          
    syscall             
    
    syscall