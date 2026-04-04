.intel_syntax noprefix
.global _start

.section .text
_start:
    # --- TERMOS POSITIVOS (Soma das Diagonais Principais) ---
    # T1: aei (r15 * rdi * rcx)
    mov rax, r15
    imul rax, rdi
    imul rax, rcx
    push rax

    # T2: bfg (r10 * r11 * rdx)
    mov rax, r10
    imul rax, r11
    imul rax, rdx
    push rax

    # T3: cdh (rbx * r13 * r14)
    mov rax, rbx
    imul rax, r13
    imul rax, r14
    push rax

    # --- TERMOS NEGATIVOS (Soma das Diagonais Secundárias) ---
    # T4: ceg (rbx * rdi * rdx)
    mov rax, rbx
    imul rax, rdi
    imul rax, rdx
    push rax

    # T5: afh (r15 * r11 * r14)
    mov rax, r15
    imul rax, r11
    imul rax, r14
    push rax

    # T6: bdi (r10 * r13 * rcx)
    mov rax, r10
    imul rax, r13
    imul rax, rcx
    # Não damos push no T6, vamos usá-lo como base para as subtrações
    
    # --- CONSOLIDAÇÃO FINAL ---
    # Atualmente: RAX = T6. Pilha (topo->base): T5, T4, T3, T2, T1
    
    # Vamos acumular todos os negativos primeiro
    add rax, [rsp]      # rax = T6 + T5
    add rsp, 8          # "pop" manual sem usar registrador extra
    add rax, [rsp]      # rax = T6 + T5 + T4
    add rsp, 8
    
    # Agora rax = (T4 + T5 + T6). Vamos guardar isso e pegar os positivos.
    mov r11, rax        # r11 = Soma dos Negativos
    
    pop rax             # rax = T3 (Positivo)
    pop rbx             # rbx = T2 (Positivo)
    add rax, rbx
    pop rbx             # rbx = T1 (Positivo)
    add rax, rbx        # rax = T1 + T2 + T3
    
    # Final: Positivos - Negativos
    sub rax, r11