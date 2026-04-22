# Lista de Exercícios — Arquitetura de Computadores e Sistemas Operacionais

---

## 1. Sobre o hardware do computador

Assinale as assertivas verdadeiras:

- (a) Linhas de Endereços em um barramento são responsáveis por controlar o acesso das linhas de dados e endereços  
- (b) Pipeline é uma técnica de hardware para busca de uma ou mais instruções além da próxima a ser executada, ao mesmo tempo  
- (c) O software que conversa com o controlador do dispositivo de E/S é chamado de Kernel  
- (d) No modo usuário de um processador, todos os recursos estão disponíveis para o usuário  
- (e) Cada processador possui um conjunto específico de instruções  
- (f) Multiprogramação é a capacidade do Sistema Operacional de executar concorrentemente vários processos  
- (g) Hierarquia de memória melhora a velocidade de provisão de dados  
- (h) Processador superescalar possui múltiplas unidades de execução  
- (i) Cache é um tipo de memória controlada pelo hardware  
- (j) Interrupção é um evento externo que desvia a execução  
- (k) Localidade temporal refere-se a posições próximas de memória  
- (l) Memória virtual permite executar programas maiores que a RAM  
- (m) Barramento transporta informações entre softwares  

---

## 2. Estrutura de Barramento

| Descrição | Resposta |
|----------|---------|
| Definem origem e destino dos dados | |
| Onde os dados são trafegados | |
| Controla o acesso às linhas | |

Opções:

- Linhas de Controle  
- Linhas de Endereços  
- Linhas de Dados  

---

## 3. Registradores x86-64

| Descrição | Resposta |
|----------|---------|
| Retorno de funções | |
| Apontador de Instrução | |
| Contadores | |
| Registrador de Pilha | |
| Base da Pilha | |
| Propósito Geral | |

Opções:

- RAX  
- RCX  
- R8  
- RIP  
- RSP  
- RBP  

---

## 4. Tipos de Sistemas Operacionais

| Descrição | Resposta |
|----------|---------|
| Apoio ao usuário comum | |
| Android e iOS | |
| Múltiplas CPUs | |
| Alta capacidade de E/S | |
| Energia por indução | |
| Controle industrial | |
| Controlam dispositivos | |
| Compartilhamento via rede | |
| Baixo consumo de energia | |

Opções:

- Servidores  
- Computadores Pessoais  
- Tempo Real  
- Nós Sensores  
- Multiprocessadores  
- Cartões Inteligentes  
- Embarcados  
- Grande Porte  
- Portáteis  

---

## 5. Tipos de Software

| Descrição | Resposta |
|----------|---------|
| Auxílio ao usuário | |
| Gerenciamento do sistema | |

Opções:

- Software Aplicativo  
- Software Embarcado  
- Software Básico  

---

## 6. Funções do Sistema Operacional

Preencha:

- Controlar funcionamento: ______  
- Facilidade de uso: ______  
- Interface amigável: ______  
- Omitir detalhes: ______  
- Gerenciar recursos: ______  

---

## 7. Conceitos de SO

Assinale as verdadeiras:

- (a) Sinais são equivalentes a interrupções  
- (b) SO não gerencia processos  
- (c) Arquivos são hierárquicos  
- (d) Arquivos abstraem dispositivos  
- (e) Pseudo-dispositivo sem buffer  
- (f) Espaço de endereçamento = intervalo total de memória  
- (g) Acesso absoluto depende do diretório atual  
- (h) Pilha contém código  
- (i) Chamada de sistema solicita serviços  
- (j) Processo possui recursos e memória  
- (k) rw-rw-r-- permite execução  
- (l) Processo é programa em execução  

---

## 8. Arquitetura de Memória

| Descrição | Resposta |
|----------|---------|
| Memória única (dados + instruções) | |
| Memórias separadas | |

Opções:

- Von Neumann  
- Harvard  

---

## 9. Ciclo de Instrução

Selecione:

- Unidade de Busca  
- Unidade de Execução  
- Unidade de Decodificação  

---

## 10. Estruturas de SO

| Descrição | Resposta |
|----------|---------|
| Simulação de hardware | |
| Divisão em camadas | |
| Comunicação por mensagens | |
| Programa único no núcleo | |
| Multiplexação segura | |
| Módulos pequenos | |

Opções:

- Monolítico  
- Camadas  
- Microkernel  
- Exokernel  
- Máquinas Virtuais  
- Cliente-Servidor  

---

## 11. Tamanhos de Dados

| Bits | Resposta |
|------|---------|
| 16 bits | |
| 8 bits | |
| 64 bits | |
| 4 bits | |
| 32 bits | |

Opções:

- BYTE  
- WORD  
- DWORD  
- QWORD  
- NIBBLE  

---

## 12. Syscalls e Assembly

Assinale:

- (a) Parâmetros pela pilha  
- (b) RDI recebe FD no write  
- (c) Ordem: RDI, RSI, RDX, RCX...  
- (d) RAX contém retorno  
- (e) RAX contém número da syscall  
- (f) fork cria cópia  
- (g) Ordem correta com R10  
- (h) syscall executa chamada  
- (i) open retorna endereço  
- (j) exit recebe código  
- (k) RDX define bytes em read  

---

## 13. Cache

| Descrição | Resposta |
|----------|---------|
| Razão de hits | |
| Unidade mínima | |
| Custo do miss | |
| Encontrado | |
| Não encontrado | |
| Complemento do hit-rate | |

Opções:

- Hit  
- Miss  
- Hit-rate  
- Miss-rate  
- Miss-penalty  
- Bloco  

---

## 14. Gerenciamento de Recursos

Assinale:

- (a) Tempo de resposta irrelevante  
- (b) Maximizar utilização  
- (c) Minimizar utilização  
- (d) Tempo de resposta aceitável  

---

## 15. Assembly

Assinale:

- (a) Imediato = constante  
- (b) .text contém variáveis  
- (c) .data contém inicializadas  
- (d) Instruções variam tamanho  
- (e) Entry point inicia execução  
- (f) Ligação gera executável  
- (g) .bss não inicializadas  
- (h) AT&T não usa prefixos  

---

## 16. Assembly Avançado

Assinale:

- (a) CF = carry  
- (b) .section define seções  
- (c) ZF = overflow  
- (d) JMPV controla saltos  
- (e) jmp é incondicional  
- (f) lea move dados  
- (g) stack em RAM  

---

## 17. Localidade

Assinale:

- (a) Localidade espacial  
- (b) Localidade temporal  
- (c) Dados recentes próximos  
- (d) Não reutiliza dados  
- (e) Blocos contíguos  
- (f) Permite hierarquia  

---

## 18. Cálculo de Cache (1)

Dados:

- Instruções: 400  
- Acessos: 280  
- Hits: 250  
- Cache: 4 ciclos  
- Memória: 32 ciclos  

**Resposta:** ______

---

## 19. Cálculo de Cache (2)

Dados:

- Instruções: 7000  
- Acessos: 4200  
- Hits: 2240  
- Cache: 3 ciclos  
- Memória: 128 ciclos  

**Resposta:** ______

---
