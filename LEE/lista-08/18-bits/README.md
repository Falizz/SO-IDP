# Descrição

Nesta atividade, sua tarefa é verificar a diferença entre endereçamento virtual
e endereçamento físico em um ambientes de 64 bits.

Um erro comum, a pensar na transição de arquiteturas de 32 bits para 64 bits, é
a de pensar na quantidade de bits utilizados para endereçamento como sendo um
resultado direto para o tamanho da memória que pode ser endereçada. Em 32 bits,
utiliza-se 32 bits para endereçamento que resulta em 2^32, que é igual a
4294967296 bytes, ou 4GB. Porém, isso é um pouco mais complexo em arquiteturas
de 64 bits, a qual você deverá verificar a quantidade de bits utilizados para
endereçamento virtual e a quantidade utilizada endereçamento físico. Para isso,
há diversas formas diferentes de se obter essa informação, como por exemplo
lendo o arquivo `/proc/cpuinfo`, ou utilizando a ferramenta `lscpu`.

Para realizar a atividade, você deverá executar o programa `validador`, que irá
solicitar a resposta obtida, e caso esteja correta, você receberá o código de
resposta para a submissão da atividade.

Obs: Por enquanto estamos interessados apenas na quantidade, em aulas posteriores
será detalhado o funcionamento desses endereçamentos.