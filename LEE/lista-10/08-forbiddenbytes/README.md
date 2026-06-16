 - Ler Arquivo -

Nesta atividade, você deverá escrever um código em assembly x86-64
que abra o arquivo, leia seu conteúdo e escreva na saída padrão.
O arquivo a ser lido é /desafio/recompensa.txt.
Você pode ler o conteúdo para qualquer área de memória com permissões
de leitura e escrita.
Além disso, você poderá utilizar somente as seguintes syscalls:
 - open (openat)
 - read
 - write
Por último, esta atividade possui um filtro de bytes, não permitindo
que o seu código "enviado" tenha os seguintes bytes:
 - 0f05 (syscall)
 - 0f34 (sysenter)
 - 80cd (int)

Isso impede que você tenha chamadas de sistema no seu código enviado,
mas não necessariamente impede que você modifique seu próprio código
em tempo de execução (hehe).