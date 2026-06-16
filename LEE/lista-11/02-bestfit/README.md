# Descrição

Existem duas estratégias comuns para gerenciar áreas livres de memória em
sistemas operacionais: o uso de mapas de bits e o uso de listas encadeadas. No
método de mapa de bits, a memória é dividida em unidades de tamanho fixo, e cada
unidade é representada por um bit em um vetor: um valor indica se a unidade está
livre ou ocupada. Já nas listas encadeadas, as áreas livres são mantidas em uma
lista, onde cada elemento armazena o endereço e o tamanho do bloco livre. Isso
permite localizar rapidamente blocos de tamanhos adequados e facilita a fusão de
áreas adjacentes quando a memória é liberada, reduzindo a fragmentação.

Nesta atividade, iremos lidar especificamente com o método de listas
listas encadeadas, utilizando diferentes estratégias de alocação de memória,
onde você deverá informar o estado final dos blocos livres de memória após
uma ou mais alocações e liberações de memória.

Observação: nesta atividade, serão exibidos apenas os blocos livres de memória,
e caso uma alocação seja do tamanho exato da memória, para manter a coesão e
organização dos índices, mantenha o bloco livre mesmo se o tamanho final do mesmo