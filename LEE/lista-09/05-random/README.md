# Descrição

Nesta atividade, há um binário chamado exercicio na pasta /desafio. Esse
programa, quando em execução, possui uma região de memória no seu espaço de
endereçamento com permissões de leitura, escrita e execução. Nessa região de
memória, há um conteúdo que é uma sequência de caracteres que formam uma
mensagem. Essa mensagem é o objetivo do exercício. (ATENÇÃO!!!) Para saber que
você está acessando o conteúdo correto, a mensagem possui o prefixo "IDP-",
então ao consultar o local correto, o conteúdo deverá aparecer como
"IDP-<MENSAGEM>", onde apenas MENSAGEM é o que você deve informar, como solução
para a atividade. Observação: o conteúdo pode estar em qualquer parte dessa
memória, você precisa descobrir onde ele está.

Para auxiliar na conclusão da atividade, está instalado o gdb neste sistema, o
qual possui o utilitário info proc para visualizar informações sobre o processo
em execução. Para examinar a memória, pode-se utilizar o comando x/F <endereço>,
onde F é o formato de exibição (utilize help x para mais informações).

Obs: para inserir breakpoints no código, você pode referenciar como
break <nome_da_função> ou break *<endereço_da_função>. Para listar os
breakpoints inseridos, utilize o comando info breakpoints, e para remover um
breakpoint, utilize o comando delete <número_do_breakpoint>. Além disso,
para ver o código que está sendo executado, durante a execução, utilize o
comando disassemble.