# Resumo Consolidado: Introdução a SO e Revisão de Arquitetura (Aulas 01-08)

## 1. O Sistema Operacional (Aulas 01 e 02)

O SO atua como um intermediário entre o hardware e o software aplicativo.

* **Função de Máquina Estendida (Abstração):** Oferece uma interface simplificada (arquivos, janelas) para esconder a complexidade do hardware.
* **Função de Gerenciador de Recursos:** Atua como um árbitro para alocar CPU, memória e dispositivos de E/S de forma eficiente e segura.
* **Modo Núcleo (Kernel Mode):** Acesso total ao hardware e instruções privilegiadas.
* **Modo Usuário (User Mode):** Acesso restrito; solicita serviços ao kernel via System Calls.
* **Arquiteturas de Núcleo:**
  * **Monolítico:** Todo o SO roda em modo núcleo (rápido, mas instável).
  * **Microkernel:** Apenas o essencial no núcleo; drivers e serviços rodam em modo usuário.
  * **Exokernel:** Alocação direta de recursos com proteção mínima.

## 2. Fundamentos de Assembly e Execução (Aulas 03 e 04)

Transformação de código-fonte em instruções que o processador entende.

* **Fluxo de Criação:** Código (.s) → **Assembler** → Objeto (.o) → **Linker** → Executável.
* **Arquivo Objeto:** Contém o *Header*, *Text Segment* (instruções), *Data Segment* (variáveis), *Relocation Info* e *Symbol Table*.
* **Registradores x86-64:**
  * **64 bits:** RAX, RBX, RSP, etc.
  * **32 bits:** EAX, EBX, ESP (zera os 32 bits superiores se movido para cá).
  * **Endianness:** Intel utiliza **Little-endian** (byte menos significativo no endereço mais baixo).
* **Sintaxes:**
  * **Intel:** `instrução destino, origem` (ex: `mov rax, 10`).
  * **AT&T:** `instrução origem, destino` com prefixos `%` e `$` (ex: `movq $10, %rax`).

## 3. Memória e Pilha (Aula 05)

Organização do espaço de endereçamento do processo.

* **Seções de Memória:**
  * **.text:** Instruções de máquina (somente leitura).
  * **.data:** Variáveis globais inicializadas.
  * **.bss:** Variáveis globais não inicializadas (zeradas no início).
  * **.rodata:** Constantes e strings (read-only).
* **Pilha (Stack):**
  * **LIFO:** Last-In, First-Out.
  * **RSP (Stack Pointer):** Aponta para o topo. A pilha cresce para **endereços menores**.
  * **PUSH:** Subtrai 8 de RSP e escreve dado.
  * **POP:** Lê dado e soma 8 a RSP.

## 4. Funções e Chamadas de Sistema (Aula 06)

Interação entre blocos de código e com o Kernel.

* **ABI (Convenção de Chamada):** Ordem dos argumentos nos registradores: **RDI, RSI, RDX, RCX, R8, R9**.
* **Syscalls (Chamadas de Sistema):**
  * Utiliza a instrução `syscall`.
  * **RAX:** Contém o número da syscall (ex: 60 = exit, 1 = write).
  * **Argumentos:** Mesma ordem da ABI, mas utiliza **R10** em vez de RCX.
* **Preservação:** Registradores como RBX, RBP e R12-R15 devem ser salvos pela função se forem alterados.

## 5. Hierarquia e Desempenho de Memória (Aula 07)

Otimização para lidar com o gargalo da RAM lenta.

* **Princípio da Localidade:**
  * **Temporal:** Reuso de dados acessados recentemente.
  * **Espacial:** Acesso a dados em endereços vizinhos.
* **Métricas:**
  * **Hit (Acerto):** Dado encontrado na cache.
  * **Miss (Falta):** Busca no nível inferior (RAM). Gera um *Miss Penalty*.
* **Fórmula AMAT:** $AMAT = HitTime + (MissRate \times MissPenalty)$.

## 6. Mapeamento de Cache (Aula 08)

Regras de onde colocar o dado da RAM na Cache.

* **Direto:** Cada bloco da RAM tem apenas 1 posição possível na Cache (rápido, mas gera conflitos).
* **Totalmente Associativo:** Qualquer bloco vai em qualquer lugar (flexível, mas caro/lento de buscar).
* **Associativo por Conjunto (Set-Associative):** Compromisso entre os dois. A cache é dividida em conjuntos; o bloco vai para um conjunto específico, mas pode ocupar qualquer "via" (*way*) dentro dele.
* **Divisão do Endereço:** Tag (identifica o dado), Índice (linha/conjunto) e Offset (posição dentro do bloco).
