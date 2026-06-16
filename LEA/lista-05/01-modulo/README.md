- Resto da Divisão sem Divisão

Como aprendemos à pouco que operações que envolvem o acesso à memória são
extremamente custosas, vamos aproveitar para falar que existem algumas
instruções que também costumam ser bastante caras. Uma delas é a operação de
divisão. Dessa forma, sempre que possível, é recomendado evitar o uso dessa
instrução.

Um exemplo de como poderíamos evitar o uso de divisões diretamente, é o caso
onde o divisor é uma potência de 2. Nesse caso, podemos substituir a operação
de divisão por uma operação de deslocamento, onde:

se nós temos "x % y", e "y" é uma potência de 2 tal que "y = 2^n", então
"x % y" é equivalente aos "n" bits menos significativos de "x".

Neste exercício, sua tarefa é calcular o seguinte:

    rdx =  r9 % 256
     r8 = r10 % 65536

utilizando apenas as instruções:

- MOV

Valores inicializados:

- r9: 0x1240
- r10: 0xed5153d3
