---
layout: post
title: Canais de Comunicação
subtitle: Sim, o seu software comunica-se sempre!
image: https://cdn-images-1.medium.com/max/800/1*5NI8U4JRNw5O4aJ1dfRHfw.jpeg
author: ronaldo
categories: [Programação]
---

Qualquer que seja o software que você esteja escrevendo, ele está se
comunicando. Sempre. A comunicação pode ocorrer entre os componentes do seu
software, entre classes de um mesmo componente, entre classes do framework que
você usa ou através de uma rede, como a internet, com componentes ou serviços
remotos.

Trata-se de algo tão comum, tão corriqueiro que esquecemos de observar com
cuidado o fenômeno da comunicação dentro de um software, muitas vezes causando
um aumento no acoplamento e criando dependências funcionais e temporais. Em
outros casos, os canais de comunicação tornam-se gargalos justamente por que se
sobrecarregam facilmente. Este pequeno artigo visa demonstrar quando a
comunicação acontece e apresenta algumas ideias de como criar software mais
eficiente, tirando proveito de alguns princípios bem antigos.

#### Estados globais compartilhados

Esta é a forma mais primitiva de comunicar-se dentro de um software. Imagine que
seu software precise manter um estado, qualquer que seja, no âmbito global. Por
exemplo, um cliente pode manter como estado global compartilhado uma sessão de
usuário, sessão esta deve estar necessariamente ativa para que o usuário possa
utilizar as funcionalidades deste cliente.

Os estados globais compartilhados são primitivos pois exigem bastante cuidado.
Se duas linhas de processamento tentam alterar, ao mesmo tempo, o estado global,
pode-mos ter situações de concorrência que podem resultar em comportamentos
imprevisíveis. Se pensarmos no estado global compartilhado, teremos duas
operações possíveis: escrita e leitura. Em termos de canais de comunicação, é
isto o que acontece: alguém escreve no canal e outro alguém lê deste canal.

Bem, com o estado global compartilhado a regra vale: você terá alguém escrevendo
no estado, por exemplo a rotina que realiza a autenticação do usuário e altera o
estado global; e terá, também, alguém lendo, por exemplo a rotina que verifica
se o usuário foi autenticado para permitir o acesso a alguma funcionalidade.

Quando o canal de comunicação é escrito e lido pelo mesmo processo, dizemos que
ele é *full duplex*. Caso uma rotina simplesmente escreva no estado global, sem
antes verificá-lo, dizemos que esta rotina usa um canal *half duplex*.

#### Protocolo

Já que falamos do estado global compartilhado, é importante falarmos de
protocolos. Notem, estamos falando de código dentro do seu software. Nada a ver
com redes. Os conceitos aqui apresentados são suficientemente genéricos para,
inclusive, servirem para comunicações remotas, ou seja, através de uma rede
arbitrária de comunicação.

O *protocolo* nada mais é que uma regra estabelecida entre os comunicantes, ou
seja, uma forma de padronizar a comunicação de tal forma que os dois
participantes da comunicação possam compreender corretamente as mensagens
trocadas. No caso do nosso estado global compartilhado, é importante
determinar-se um *protocolo*.

Normalmente um estado global compartilhado é implementado como um *singleton*,
uma forma moderna de criar-se uma variável global. Se o acesso é feito
inescrupulosamente, sem o devido encapsulamento, teremos uma variável global
acessada para leitura e escrita sem nenhum critério, o que pode levar a um
código bastante instável e dependente.

Assim, a adoção de um protocolo pode facilitar o compartilhamento de informações
e transmissão de instruções entre dois comunicantes, estipulando regras,
inclusive, de integridade.

#### Ativação de métodos ou funções

Uma outra forma de comunicação dentro do seu software é a ativação de métodos ou
funções. E aqui também vale o conceito de leitura e escrita: ao ativar um método
passando parâmetros você pode entender que está escrevendo no objeto que está
ativando. Certamente os parâmetros serão avaliados para ocasionar uma mudança de
estado. Se o método apenas retorna um valor, a sua rotina está lendo do objeto.
O caso geral é quando temos um método que recebe parâmetros e retorna
valores — este é um caso de full duplex.

E quando o método é apenas ativado sem receber nenhum parâmetro e sem retornar
nenhum valor? Este é um caso de escrita. Fazendo uma analogia ao *smalltalk*, ao
ativar o método você está, na verdade, enviando uma mensagem ao objeto, mensagem
esta que provocará uma mudança de estado neste objeto. Portanto, podemos
entender este caso como uma escrita solicitada ao objeto.

Os métodos e as funções são, portanto, canais de comunicação entre rotinas. A
assinatura do método ou função determina o *protocolo* de comunicação que é
verificado em tempo de compilação. Apesar de mais sofisticado, este mecanismo
ainda é bastante primitivo e é uma das primitivas dos esquemas de programação
procedural e orientada ao objeto.

#### Notificações

As notificações, amplamente utilizadas em sistemas como o iOS, são um exemplo de
comunicação *half-duplex*. Trata-se de um esquema simples, porém mais
sofisticado que a ativação de métodos. Neste esquema, uma notificação é gerada
por quem deseja escrever dados e interessados são notificados para que possam
ler os dados escritos no canal e, assim, realizar algum tipo de processamento.

Este esquema de processamento é uma distribuição de mensagens *multi-cast*, ou
seja, somente interessados inscritos no grupo de notificação receberão a
mensagem. O que é interessante neste esquema de comunicação é que as regras são
bem definidas (protocolo) e assim qualquer entidade do seu software pode
participar do grupo multi-cast contanto que entendar e adapte-se às regras.

A notificação tem como principal vantagem desacoplar completamente
comportamentos dos emissores de dados. Assim, um emissor não sabe quem
efetivamente vai receber a mensagem. A mensagem é publicada em um canal que a
distribui aos receptores interessados.

#### Pipes

Os *pipes* são canais de comunicação que podem ser *half-duplex* ou
*full-duplex*. Normalmente são encontrados em sistemas operacionais mas podem
ser facilmente implementados em rotinas de usuário. A função do *pipe* é servir
de transporte de mensagens entre um par emissor/receptor. Assim, cria-se um
canal de comunicação entre o emissor e o receptor de forma a permitir a
comunicação de dados entre eles.

Nos sistemas operacionais os *pipes* permitem que processos não relacionados
comuniquem-se. Faz parte do stack IPC (*inter-process communication*). De
maneira conceitual, podem ser síncronos ou assíncronos. No caso do *pipe*
assíncrono, o emissor escreve os dados que precisa escrever sem preocupar-se se
o receptor receberá os dados.

#### Data Bus

O conceito de *data bus* não é novo e não é novidade. Muito menos é uma
coqueluche da tecnologia e nem é algo espetacular. A ideia é antiga e os
computadores usam *data buses* há anos para trocar informações entre seus
componentes (por exemplo, entre processador e memória).

A ideia do barramento de dados é permitir a comunicação entre emissores e
receptores através do mesmo meio, de maneira que os dados transitados sejam
multiplexados e distribuídos dentro da mesma estrutura, maximizando o tráfego.

Imagine que você precisa criar um canal de comunicação para centenas de objetos.
O data bus permite que você utilize somente um único canal para o tráfego de
informações, mesmo que a comunicação seja *peer-to-peer*. Existem três coisas
que o data bus permite:

- comunicação *unicast*, ou seja, entre um par emissor/receptor;
- comunicação *multicast*, ou seja, em um emissor e vários receptores
  selecionados;
- comunicação *broadcast*, ou seja, entre um emissor e vários receptores, sendo
  que o critério de entrega da mensagem é apenas o receptor participar do data
  bus.

A diferença entre multicast e broadcast é que no primeiro modo somente quem
participa de um grupo recebe a mensagem, enquanto no segundo todo mundo capaz de
comunicar-se recebe a mensagem.

#### Como usar essa parafernália no dia-a-dia?

Aqui estão os conceitos. Como usá-los para otimizar seu software? Existem várias
formas de usar canais de comunicação para aumentar o throughput de dados do seu
software. A forma mais simples é através de filas de mensagens. As filas têm
como característica sincronizar pares emissor/receptor de maneira a
compatibilizar a diferença de velocidade entre ambos. Por exemplo, se um emissor
gera mensagens numa taxa superior ao que o receptor consegue processar, a fila
compatibiliza isto retendo os dados não processados até que o emissor tenha
tempo de processá-los.

Você pode usar uma fila para enviar pacotes de processamento entre partes do seu
software. Os receptores é quem cuidarão de receber estes pacotes e processá-los.
A principal vantagem desta estrutura é desacoplar completamente quem cria a
mensagem de quem a processa efetivamente. Assim, o emissor não faz a menor ideia
de quem seja o receptor, apenas conhece o que precisa fazer para enviar algo
pela fila.

Em uma estrutura de processamento complexo pode-se usar um princípio chamado de
*pipeline*. Tratam-se de vários processos especialistas interligados por filas
de mensagem. Um emissor publica na primeira fila uma mensagem que é passada para
um receptor, cujo resultado de processamento é publicado em outra fila e assim
por diante. Se cada processo estiver em uma *thread* ou processo diferente,
consegue-se obter paralelismo de processamento sem, contudo, incorrer-se em
problemas de concorrência, pois cada receptor cuidará de uma única coisa.

Caso o seu pipeline não seja paralelizado, ainda assim consegue-se concorrência
por distribuir o processamento por vários estágios, criando-se um fluxo muito
bem definido de trabalho. A beleza dessa estrutura é que o elemento anterior não
faz a menor ideia do que é o elemento posterior. Assim, todo o processamento é
realizado por peças de software praticamente independentes funcionalmente
falando.

Ao criar um fluxo bem definido, com uma estrutura de mensagens bem clara, você
pode, também, criar um workflow dentro da sua aplicação de forma que o tipo da
mensagem possa disparar esquemas de multicast ou broadcast inteligentes, ou
seja, somente os interessados no tipo da mensagem a usam para processamento,
dando a oportunidade de várias peças do seu software atuarem de maneira
ordenada.

É isso. Happy coding!
