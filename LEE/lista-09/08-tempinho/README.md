# Descrição

Caches introduzem na hierarquia de memória variações de tempo baseadas nos
acessos à memória de um programa. Essas variações de tempo, em diferentes
acessos podem ser observadas de diversas maneiras diferentes.

Em arquiteturas compartilhadas, um atacante (usuário mal intencionado) pode
observar o estado do cache (hits e misses) para inferir quais linhas foram
acessadas por um usuário (que no cenaŕio de segurança, é chamado de vítima) e
isso pode levar a revelar dados não autorizados ao atacante, causando
vulnerabilidades críticas de segurança.

Ataques que exploram o estado do cache para vazar dados secretos são chamados de
ataques de cache. Eles fazem parte de uma classe mais geral de ataques, chamados
ataques de temporização, que exploram variações de tempo em um sistema para
vazar dados secretos.

Esta atividade irá mesclar a variação de tempo com o acesso a dados na memória
principal, da seguinte forma: há um fonte chamado desafio.c que contém a lógica
do programa compilado, chamado exercicio. Esse programa abre um arquivo chamado
passoword.txt, que é a resposta para a atividade. Para resolver a atividade,
você deverá entender como as variações de tempo ocorrem entre a entrada fornecida
pelo usuário, e a mensuração realizada múltiplas vezes ao comparar com o
password correto, que possui 0x4 bytes. As diferenças de tempo são a chave para
recuperar o password correto.