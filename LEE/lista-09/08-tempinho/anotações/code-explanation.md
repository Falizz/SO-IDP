# 🔬 Análise de Código: Desafio de Ataque de Canal Lateral por Tempo (Timing Attack)

Este documento contém a explicação detalhada do funcionamento do código em C (`desafio.c`) utilizado para estudos de **Timing Attacks** em competições de CTF.

---

## 📌 Visão Geral do Código

O objetivo deste programa é validar uma senha de 4 caracteres extraída de um arquivo local (`password.txt`). No entanto, a sua principal característica é a **medição ultraprecisa do tempo de execução** em ciclos de clock da CPU, usando instruções assembly específicas da arquitetura x86.

Isso cria uma vulnerabilidade de canal lateral, permitindo inferir a senha por meio da análise do tempo de resposta.

---

## 🛠️ Análise Estrutural do Código

### 1. Diretivas e Definições Globais

O código inicializa as bibliotecas e define os parâmetros fundamentais do desafio:

- **`PASSWORD_LEN 0x4`**: define o tamanho exato da senha como **4 bytes** ou caracteres. Se o input tiver um tamanho diferente, o programa rejeita imediatamente.
- **`NR_AMOSTRAS 1000`**: para mitigar variações térmicas ou ruídos gerados pelo sistema operacional, o programa testa a senha 1000 vezes consecutivas para extrair uma amostragem estatística mais limpa.
- **`amostras[...]`**: vetor encarregado de armazenar a contagem de ciclos de clock de cada uma das 1000 tentativas.

---

### 2. Função de Ordenação (`compare`)

```c
int compare(const void *a, const void *b) { 
    return ( *(unsigned long long int *)a - *(unsigned long long int *)b); 
}
```

**Função:** atua como auxiliar para o algoritmo de ordenação rápida (`qsort`). Ela ordena os tempos registrados no array `amostras` em ordem crescente.

---

### 3. Carga da Senha Secreta (`carrega_password`)

```c
void carrega_password() { 
    int fd = open("password.txt", O_RDONLY); 
    read(fd, correct_password, PASSWORD_LEN); 
}
```

**Função:** abre o arquivo `password.txt` em modo de leitura e extrai os 4 caracteres que representam a flag ou senha correta, armazenando-os na memória global em `correct_password`.

---

### 4. Simulação de Atraso (`delay`)

```c
void delay() { 
    volatile int t; 
    for(t = 0; t < 100; t++); 
}
```

**Função:** executa um laço vazio projetado para gastar ciclos de processamento de propósito.

A palavra-chave `volatile` é crucial aqui, pois impede que o compilador ignore ou otimize o loop, forçando a CPU a executar o atraso manualmente.

---

### 5. Validação com Vazamento de Tempo (`verifica_password`)

```c
int verifica_password(char *password, int len) { 
    if (len != PASSWORD_LEN) { return 0; } 
    #ifdef DELAY 
        delay(); 
    #endif 
    // Comparação lógica indexada caractere por caractere
}
```

**Função:** valida se o tamanho inserido é compatível.

Em ataques temporais tradicionais, sistemas vulneráveis realizam uma validação caractere por caractere:

- Se o primeiro caractere estiver errado, a função retorna `0` imediatamente.
- Se o primeiro caractere estiver correto, ela passa para o segundo, gastando mais tempo de CPU para processar o restante da lógica.

É essa diferença sutil de tempo que o ataque explora.

---

### 6. Loop de Telemetria de Alta Precisão (`main`)

```c
for (int i = 0; i < NR_AMOSTRAS; i++) {
    _mm_lfence();                     
    t1 = __rdtsc();                   
    res = verifica_password(buffer, user_len); 
    t2 = __rdtsc();                   
    _mm_lfence();
    amostras[i] = t2 - t1;            
}
```

**Função:** o programa captura o estado exato dos registradores da CPU.

- **`_mm_lfence()`**: barreira de serialização, ou *Memory Fence*, que impede a CPU de executar instruções fora de ordem. Isso garante que o cronômetro rode apenas no momento exato desejado.
- **`__rdtsc()`**: lê o contador de timestamp do processador, conhecido como *Read Time-Stamp Counter*, retornando a quantidade exata de ciclos de clock acumulados desde o boot.

O resultado `t2 - t1` fornece a quantidade isolada de ciclos gastos para executar aquela verificação específica.

Ao final das 1000 iterações, a função localiza a mediana dos tempos:

```c
amostras[NR_AMOSTRAS / 2]
```

Isso ajuda a eliminar discrepâncias causadas por picos de uso do sistema.

---

## 📥 Comportamento Prático das Entradas

Com base na execução prática no terminal, o comportamento observado define a regra para a solução do desafio.

### Entrada com tamanho incorreto

Exemplo:

```txt
Digite o password: 1
```

**Tempo de retorno:** muito baixo, aproximadamente `22` ciclos.

**Motivo:** o programa cai no seguinte teste:

```c
if (len != PASSWORD_LEN)
```

Como o tamanho está incorreto, a execução é encerrada prematuramente.

---

### Entrada com tamanho correto, mas dados incorretos

Exemplo:

```txt
Digite o password: 1111
```

**Tempo de retorno:** alto, aproximadamente `453` ciclos.

**Motivo:** o tamanho de 4 caracteres foi aceito, forçando o programa a entrar nas subrotinas internas e nos loops de verificação.

---

## 💡 Estratégia de Resolução no CTF

Como o script em Python configurado analisa o maior tempo de resposta, a lógica se baseia em:

1. Manter o tamanho da string fixo em 4 caracteres.
2. Modificar uma posição por vez.

Exemplos:

```txt
A000
B000
C000
```

O caractere que retornar o maior pico de tempo provavelmente está correto, pois forçou o programa a avançar para a validação do próximo byte no array.

---

## ✅ Resumo

O desafio explora uma falha clássica de **Timing Attack**, em que o tempo de execução revela informações sobre a senha correta.

A vulnerabilidade surge porque a comparação é feita progressivamente, caractere por caractere, e o programa demora mais quando os caracteres iniciais estão corretos.

A solução consiste em medir os tempos de resposta para diferentes entradas e identificar quais caracteres provocam maior tempo de processamento.