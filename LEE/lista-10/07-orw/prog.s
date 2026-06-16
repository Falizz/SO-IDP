.intel_syntax noprefix
.global _start

.section .text

_start:
    # open("/desafio/recompensa.txt", O_RDONLY)
    lea rdi, [rip + filename]   # pathname
    xor esi, esi                # flags = O_RDONLY (0)
    xor edx, edx                # mode = 0
    mov eax, 2                  # syscall: open
    syscall

    # Guarda o fd retornado
    mov r12, rax

    # read(fd, rsp-256, 256)
    mov rdi, r12                # fd
    mov rsi, rsp                # buffer na stack (área RW sem variável global)
    sub rsi, 256
    mov rdx, 256                # count
    mov eax, 0                  # syscall: read
    syscall

    # write(1, buffer, bytes_lidos)
    mov rdx, rax                # bytes lidos pelo read
    mov rdi, 1                  # fd = stdout
    mov rsi, rsp                # mesmo buffer
    sub rsi, 256
    mov eax, 1                  # syscall: write
    syscall

    # exit(0) — não exigida, mas encerra limpo
    xor edi, edi
    mov eax, 60
    syscall

filename:
    .asciz "/desafio/recompensa.txt"