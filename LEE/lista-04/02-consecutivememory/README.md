Uma outra forma de manipular dados na memória, é lembrar que dados são
armazenados de maneira linear. Por exemplo:
[0x444440] = 0x00000000abcdeeff

O endereço 0x444440 aponta para o primeiro byte do dado, e os bytes seguintes
são armazenados em endereços consecutivos, significando que o acesso pode ser
realizado por meio de offsets (ou deslocamentos) a partir do endereço base:

[0x444440 + 0] = 0xff
[0x444440 + 1] = 0xee
[0x444440 + 2] = 0xcd
[0x444440 + 3] = 0xab
[0x444440 + 4] = 0x00
[0x444440 + 5] = 0x00
[0x444440 + 6] = 0x00
[0x444440 + 7] = 0x00

Assim, conteúdos de memória podem ser acessados utilizando deslocamentos a partir
de um endereço base: [endereço_base + deslocamento].

Nesta atividade, você deverá executar o seguinte:

- Leia duas qwords a partir do endereço em [rdx].
- Some esse dois valores e armazene o resultado em [r15].
- Realizer a operação XOR entre esses dois valores e armazene o resultado em [r15 + 8].

Valores inicializados: - rdx = 0x40445f - r15 = 0x40451a - [0x40445f] = 0x07591284e37dec0a - [0x404467] = 0x046757a71f2c77ea
