# Guia de Registradores x86_64 e Versões Legado

Na arquitetura x86_64, os registradores de 64 bits são extensões dos registradores de 32 bits, que por sua vez estendem os de 16 e 8 bits.

## 1. Registradores de Propósito Geral (Básicos)

| 64 bits (R..) | 32 bits (E..) | 16 bits (..) | 8 bits (Low) | 8 bits (High) | Descrição         |
| :------------ | :------------ | :----------- | :----------- | :------------ | :---------------- |
| **RAX**       | EAX           | AX           | AL           | AH            | Acumulador        |
| **RBX**       | EBX           | BX           | BL           | BH            | Base              |
| **RCX**       | ECX           | CX           | CL           | CH            | Contador          |
| **RDX**       | EDX           | DX           | DL           | DH            | Dados             |
| **RSI**       | ESI           | SI           | SIL          | -             | Índice de Origem  |
| **RDI**       | EDI           | DI           | DIL          | -             | Índice de Destino |
| **RBP**       | EBP           | BP           | BPL          | -             | Base Pointer      |
| **RSP**       | ESP           | SP           | SPL          | -             | Stack Pointer     |

> **Nota:** Os registradores `AH`, `BH`, `CH` e `DH` acessam o segundo byte (bits 8-15) dos registradores de 16 bits.

## 2. Novos Registradores (R8 - R15)

Estes seguem um sufixo fixo para indicar o tamanho:

| 64 bits | 32 bits (Double) | 16 bits (Word) | 8 bits (Byte) |
| :------ | :--------------- | :------------- | :------------ |
| **R8**  | R8D              | R8W            | R8B           |
| **R9**  | R9D              | R9W            | R9B           |
| **R10** | R10D             | R10W           | R10B          |
| **R11** | R11D             | R11W           | R11B          |
| **R12** | R12D             | R12W           | R12B          |
| **R13** | R13D             | R13W           | R13B          |
| **R14** | R14D             | R14W           | R14B          |
| **R15** | R15D             | R15W           | R15B          |

---

## 💡 Estrutura Visual (Exemplo: RAX)

```text
63            31            15      8     0  (bits)
+-------------+-------------+-------+-----+
|             |      EAX    |   AX  |  AL |  -> RAX (64 bits)
+-------------+-------------+-------+-----+
                            |   AH  |
                            +-------+
```
