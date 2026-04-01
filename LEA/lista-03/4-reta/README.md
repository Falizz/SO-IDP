- Uso complexo de registradores

Nesta atividade, você deverá calcular o seguinte:

f(x) = mx + b, onde:

    m = r8
    x = r13
    b = rcx

E o resultado deverá ser armazenado no registrador rax.

Observação importante: existe uma diferença importante entre mul (multiplicação
sem sinal) e imul (multiplicação com sinal) em termos de quais registradores são
utilizados. Qualquer dúvida, consulte a documentação sobre essas instruções para
ver as diferenças. Além disso, lembre-se de não modificar os valores iniciais dos
registradores (qualquer outro registrador pode ser utilizado para cálculos
intermediários).

Valores inicializados: - r8: 0x8c65 - r13: 0x23bc - rcx: 0xf14b

Envie apenas o payload (código do segmento .text) em raw bytes:
