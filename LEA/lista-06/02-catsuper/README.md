# Descrição

Continuando com a prática do bit SUID, dessa vamos utilizar o binário
`cat` como referência. Esse programa encontra-se na pasta /bin e é
utilizado para concatenar arquivos e imprimir seu conteúdo na saída padrão.

Ao verificar as permissões do binário, pode-se notar que o dono e o grupo do
arquivo são ambos `root`, e `outros` possuem a permissão de execução do arquivo.
Verifique isso utilizando o comando `ls -l /bin/cat`.

-rwxr-xr-x 1 root root 39384 Apr  5  2024 /bin/cat

Além deste, há uma cópia desse binário no sistema, o `cat_super`, que apesar de
ser o mesmo arquivo, possui permissões diferentes. Verifique isso utilizando o
comando `ls -l /bin/cat_super`.

-rwsr-xr-x 1 idp aluno 39384 Apr  5  2024 /bin/cat_super

Você pode confirmar que ambos representam o mesmo arquivo utilizando o comando
`md5sum /bin/cat` e `md5sum /bin/cat_super`. O resultado deverá ser o mesmo.

Então, apesar do dono de `cat_super` não ser root, o bit SUID nos permite
executar o binário como se fôssemos o dono do arquivo, que é o requisito para
ler o arquivo `recompensa.txt`, que é o objetivo da atividade.

Assim, tente ler o arquivo `recompensa.txt` utilizando ambos os binários para
notar a diferença e recupere o conteúdo para finalizar a atividade.

Observação: se quiser saber o caminho de um binário que está executando, você
pode utilizar o comando `which <binário>`, que irá retornar o caminho completo
do binário.