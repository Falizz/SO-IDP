# Descrição

Em sistemas de computação modernos, a memória virtual é uma abstração que
permite que cada processo pense que possui toda a memória para si, mesmo que,
fisicamente, essa memória seja limitada e compartilhada com outros processos.

Para organizar esse gerenciamento, tanto a memória virtual quanto a memória
física são divididas em blocos de tamanho fixo:

Página: é um bloco de memória virtual.

Frame (ou quadro): é um bloco de memória física.

Quando um processo acessa um endereço na sua memória virtual, o sistema
operacional faz a conversão para um endereço físico, localizando em qual frame a
página correspondente está armazenada.

Caso a página ainda não esteja carregada na memória física, ocorre um page
fault, e o sistema deve buscá-la no armazenamento secundário (como o disco).

Nesta atividade, você receberá um layout de páginas-frames, e deverá responder o
frame correspondente à página escohida. Em caso de page fault, responda com -1.