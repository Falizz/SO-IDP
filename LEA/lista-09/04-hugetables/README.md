# Descrição

Sistemas Operacionais utilizam memória virtual baseada em paginação, dividindo a
memória em blocos de tamanho fixo chamados páginas. Em arquiteturas x86_64, o
tamanho padrão de uma página normalmente é de 4 kB.  Entretanto, o kernel também
pode utilizar páginas maiores, chamadas de Huge Pages, com o objetivo de reduzir
o overhead de gerenciamento de memória e melhorar o desempenho em determinados
tipos de aplicação.

Nesta atividade, sua tarefa é verificar o tamanho das Huge Pages configuradas
neste ambiente, em kilobytes (kB). Para isso, há diferentes formas de se obter
essa informação, como por exemplo consultando o arquivo /proc/meminfo ou
explorando outras interfaces fornecidas pelo sistema operacional.

Para realizar a atividade, você deverá executar o programa `validador`, que irá
solicitar a resposta obtida, e caso esteja correta, você receberá o código de
resposta para a submissão da atividade.