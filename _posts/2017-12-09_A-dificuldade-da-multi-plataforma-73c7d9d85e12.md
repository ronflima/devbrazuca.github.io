A dificuldade da multi-plataforma
=================================

Por que o software multi-plataforma consome mais recursos

------------------------------------------------------------------------

### A dificuldade da multi-plataforma

#### Por que o software multi-plataforma consome mais recursos

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*nrRtgIStDFLxscroNTv0OQ.png" class="graf-image" />
</figure>Escrever software multi-plataforma não é, e nunca foi, algo
fácil. Cada plataforma tem premissas próprias, distintas entre si. E as
diferenças forçam a criação de camadas de compatibilidade que precisam
ser específicas para cada plataforma. Não existe mágica: apenas
engenharia.

Antes que você julgue este artigo: não estou criticando o software
multi-plataforma. Na verdade, escrevo software multi-plataforma há anos.
E venho de uma época na qual haviam diferenças até mesmo no sistema
Unix, que dependia de quem vendia: IBM com seu AIX, HP com o HPUX,
Microsoft com o Xenix, Santa Cruz Operation (hoje subsidiária da
Microsoft), com seu SCO Unix, Compaq com seu Tru64, Sun com seu Solaris,
Silicon Graphics com o seu IRIX.

#### A Camada Mais Baixa: interagindo com o SO

Não importa qual é o tipo de software que você escreva. Cedo ou tarde
ele precisa, necessariamente, interagir com o sistema operacional no
qual está rodando. Ah, mas o seu software é web? Sério? Quem você acha
que entrega os eventos de mouse e teclado para a sua página? Apesar do
software muitas vezes executar dentro de um *sandbox* qualquer, ele vai
interagir com o sistema operacional através do *sandbox*. E aqui está a
primeira camada do seu *runtime:* a camada que compatibiliza o seu
software com o sistema operacional.

Esta camada do seu software é responsável por funções de baixo nível:
comunicação de rede, renderização da interface com o usuário, recepção e
processamento de eventos como cliques, movimentação do mouse, eventos de
teclado, etc. Vai abrir um arquivo? Esta camada gerencia como o arquivo
será aberto, como será lido. Vai disparar um evento assíncrono? A camada
de baixo nível cria as threads, mesmo que você não o faça explicitamente
no seu código.

Cada sistema tem uma forma bem diferente de fazer as coisas. No Windows,
para criar um arquivo é necessário executar um *system call* chamado
*CreateFile*. No Unix, *open* pode fazer o trabalho. A camada de baixo
nível compatibiliza seu código com o sistema operacional evitando que
você precise fazer chamadas explícitas de sistema.

A questão aqui é que cada sistema de uma forma muito diferente de fazer
as coisas o que torna essa camada algo bem complexo de ser feito no
intuito de manter a compatibilidade do seu software com os sistemas
operacionais.

#### Camada de apresentação: a UI

A UI é, particularmente, complexa de ser realizada. Para entender por
que é complicado, vamos comparar dois sistemas populares: Linux e
Windows. Ambos os sistemas rodam em PCs. Abrir uma janela no Windows
exige que você consuma um loop de eventos, crie a janela com um system
call específico e faça a captura de eventos para absolutamente tudo:
redesenhar a janela, movimentá-la na tela, redimensioná-la, etc. No
linux não é muito diferente. O que muda é que você não faz *system
calls* no linux: você comunica-se com o XWindow Server. O legal do linux
é que o XWindow Server não precisa estar na mesma máquina. Ele pode
estar na rede.

Até a apresentação dos menus é diferente. No Windows e no Linux, o menu
faz parte da janela. No macOS o menu não está na janela, mas é um menu
apresentado no topo da tela.

Consegue imaginar o quanto é difícil compatibilizar todas essas
diferenças num runtime só? Agora imagine sistemas que não usam o mouse,
mas usam touch screen e são orientados a gestos. Percebe a dificuldade?

#### Runtime, salve-me!

É curioso como a tecnologia anda. Anos atrás havia a discussão entre
linguagens interpretadas e compiladas no Windows: como as linguagens
compiladas eram mais rápidas. Haviam diversas linguagens que dependiam
de runtimes: Centura, Power Builder e mesmo o Visual Basic. Naquela
época as plataformas eram mais simples e o software multi-plataforma
dependiam de runtimes menos complexos.

Hoje, com diversas plataformas no mercado, escrever software
multi-plataforma tornou-se uma tarefa que só é possível por que os
runtimes tornaram-se bastante sofisticados. Porém, manter os runtimes é
uma tarefa que não é mais possivel ser feita por um punhadinho de
programadores apaixonados. É necessária muita coordenação, muita gente e
muitas disciplinas diferentes.

Com a populalização das linguagens interpretadas, de novo, o software
multi-plataforma tornou-se, na verdade, um grande runtime com uma
linguagem enfiada dentro. Basta portar o runtime para outra plataforma
que todo o software continua funcionando. Mas isto tem um preço.

As linguagens interpretadas precisam de um intérprete para converter o
bytecode em execução. E este intérprete costuma consumir muito mais
recursos do que uma linguagem que é dita hoje em dia como *nativa.* A
linguagem *nativa* é compilada e gera um executável de verdade, o que
economiza, sobremaneira, o uso de recursos.

#### Cross-compilers

Agora está na moda, também, os *cross compilers*. Trata-se de tecnologia
muito antiga. Na verdade, o cross compiler compila o seu código para
outra plataforma. Ou seja, você compila no seu PC código que vai rodar
num processador ARM.

A Apple faz isso com o seu LLVM, assemblers e linkers. A Microsoft faz
isso há anos, desde os tempos do Windows CE. Existem também os
compiladores que convertem uma linguagem em outra antes de efetivamente
gerarem os executáveis finais, os *transpilers*.

Esta tecnologia tira da equação o custoso intérprete, entregando um
executável final. O que vai variar é como este executável final usa os
frameworks ditos *nativos*. Em alguns casos, adicionam camadas extras,
em outros usam os frameworks diretamente.

Só para fazer um parêntese, o framework "nativo" muitas vezes é apenas
uma camada de compatibilidade entre o sistema operacional e a sua
aplicação. Em particular a Apple usa isso com bastante sucesso em suas
aplicações. Quando você precisa comunicar-se com a rede, você não
precisa abrir um *socket,* mas usa o URL Loading System que é uma camada
de abstração bem interessante. Vale lembrar que o próprio BSD *Socket*
já é uma camada de abstração em cima do enlace de rede — tanto é que é
possível comunicar-se dentro da mesma máquina com *sockets* unix, que
nada tem haver com TCP/IP ou rede.

#### Abraçar ou não a multi-plataforma?

Tudo tem seu uso. Tudo tem seu cenário ótimo. Encarar os *runtimes*
atuais que entregam software em várias plataformas como tábua de
salvação para todos os problemas da humanidade e de uma burrice
monumental. Existem diversos cenários nos quais os softwares
multi-plataforma não tem alternativa a não ser usar o que há de melhor
na plataforma de forma totalmente específica.

Sempre que a especificidade de uma plataforma faz a diferença na
experiência do usuário, o software multi-plataforma deixa de ser
interessante e torna-se, na verdade, uma peça de engenharia de foguete.

Outro ponto importante: sempre que há limitações em determinada
plataforma, tentar forçar os limites com *runtimes* torna o custo de
desenvolvimento do seu software astronômico ao longo do tempo. Quando
você assustar, se verá desenvolvendo código totalmente nativo para cada
plataforma, lutando para integrá-lo ao seu runtime.

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [December 9, 2017](https://medium.com/p/73c7d9d85e12).

<a href="https://medium.com/@ronaldolima/a-dificuldade-da-multi-plataforma-73c7d9d85e12" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
