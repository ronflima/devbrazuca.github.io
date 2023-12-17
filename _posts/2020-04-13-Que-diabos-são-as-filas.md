---
layout: post
title: "Que diabos são as filas?"
subtitle: Saiba um pouco sobre esta importante estrutura de dados
image: ""https://cdn-images-1.medium.com/max/800/1*_bVU40MJgXduM_LOvaoy7g.jpeg"
author: ronaldo
categories: [Desenvolvimento, Algoritmos, Programação]
---

Voltando a falar um pouco sobre estruturas de dados, agora é a hora de falar
sobre as filas. Esta é uma estrutura de dados fantástica, principalmente quando
usada em ambientes multi-processados. É tão importante que o seu sistema
operacional certamente implementa algum tipo de fila que o seu software pode
tirar proveito para realizar processamento pesado.

Por exemplo, o Windows é amplamente baseado em filas. Tudo o que acontece no
sistema é enfileirado em uma fila de mensagens. Existem as filas globais e as
filas locais. Nas primeiras versões, as filas eram todas globais o que fazia com
que o sistema caísse se uma janela travasse. O Windows NT foi o primeiro a
implementar filas locais para as janelas, o que impedia que o travamento de uma
janela levasse o sistema consigo. Esta tecnologia foi, depois, utilizada no
Windows 95 e posteriores.

No Unix a conversa sempre foi diferente pois o sistema de janelas sempre foi um
processo de usuário e nunca um processo de sistema. Mesmo o servidor XWindows,
nunca operou diretamente no kernel, fazendo chamadas de sistema como qualquer
outro processo. E isso conferiu ao Unix a sua lendária estabilidade, herdada
pelo Linux que seguiu a mesma filosofia.

Mas, enfim, chega de história da Carochinha. Vamos ao que viemos.

# Por que filas?

O cenário clássico de utilização de filas tem a ver com a comunicação entre duas
partes. Imagine duas entidades, A e B, comunicando-se através de um meio
qualquer. A envia mensagens para B e B precisa realizar algo com essas
mensagens. No entanto, A envia mensagens mais rápido do que B pode realizar algo
com elas.

Neste cenário, B perderá algumas mensagens por que estará ocupado realizando
algo enquanto A envia-lhe mais mensagens. Este é um cenário comum na comunicação
de dados, ou seja, um lado consegue enviar mensagens mais rápido do que o outro
consegue receber. E é aqui que as filas resolvem o problema: ao invés de perder
as mensagens, B as coloca em uma fila.

Claro, as filas são mais úteis do que apenas sincronizar mensagens entre dois
processos. Por exemplo, o *pipeline* é um método de paralelismo de processamento
que vem sendo usado desde o processador 8088. Trata-se, basicamente, de uma
fila.

# Desacoplando componentes com filas

Basicamente todo software é composto por um ou mais workflows. Estes workflows
são implementados por um ou mais componentes. Ao usar filas você cria um canal
de comunicação entre cada componente do seu software, desacoplando-os uns dos
outros. Os componentes passam a depender da fila e não dos outros componentes.
Se há algo na fila, o componente retira a mensagem e faz algo. Se não há nada,
volta a dormir. Simples assim.

Claro, há mecanismos mais inteligentes de notificação do que simplesmente fazer
*polling* na lista. Por exemplo, sinais podem ser usados, ou até mesmo semáforos
e mutexes. Sem softwares remotos, pode-se criar um mecanismo de notificação via
request HTTP, uma mensagem via multicast… São inúmeras as soluções possíveis.

As filas são particularmente poderosas quando combinadas com threads. O
*pattern* *master/worker* é fortemente baseado em filas: o *master* carrega uma
fila com solicitações de processamento que são realizadas pelos *workers*.
Sempre que coloca algo na fila, o *master* realiza um broadcast via mutex para
que os *workers* sejam destravados e entrem em execução imediatamente para
consumir a fila. Vários softwares de servidor funcionam com base neste
princípio.

# As filas podem ser distribuídas

Existem vários softwares que implementam filas nos dias de hoje. ZeroMQ,
RabbitMQ e MQSeries são exemplos. Estas filas podem ser distribuídas, ou seja,
permitirem que computadores distintos tenham acesso a elas, depositando ou
consumindo mensagens. E a principal vantagem é o desacoplamento entre as partes:
se o emissor cair, por algum motivo, o consumidor pode continuar a processar e
vice-versa.

As filas aumentam a resiliência de um sistema, permitindo-o suportar falhas sem,
necessariamente, jogar todo o sistema no chão. Com a distribuição de filas, o
seu sistema pode ser projetado para ter vários componentes em execução
distribuídos por vários data centers. Isso permite que o seu sistema tire
proveito to multi-processamento e da possibilidade de escalamento de carga.

# As filas do sistema operacional

Sim, o seu sistema operacional tem uma implementação de filas. Se você usa o
Linux ou algum Unix, incluindo-se o macOS, você pode fazer uso das filas para
distribuir o processamento dentro do seu próprio sistema. Ah, o Windows vem com
o MsMQ, uma implementação de *message queues* que você também pode tirar
proveito.

Mas, por que usar filas dentro da mesma máquina? Pelo mesmo motivo: você pode
orquestrar o processamento por vários processos, compartilhando e organizando as
informações processadas através de filas de mensagens. As mensagens dentro das
filas permanecem disponíveis mesmo que os processos que as consomem caiam por
algum motivo. Afinal, as filas são entidades do sistema operacional, mesmo que o
seu processo as tenha criado.

O problema de usar vários processos é que a complexidade do seu sistema tende a
aumentar: passa a ser necessário orquestrar diversos processos rodando em
paralelo. No entanto, o seu sistema passa a ser mais resiliente: uma falha em um
componente não causa a queda do sistema como um todo, mas de apenas parte do
sistema.

# Quer saber mais?

Se você quiser implementar seu próprio algoritmo de filas, bom, é bem simples.
Existem diversos livros sobre o assunto pois trata-se de um algoritmo muito
comum. As linguagens modernas, em particular as que implementam por padrão algum
tipo de coleção de dados, tem boas implementações de filas. Vale dizer que mesmo
que a sua linguagem não suporte diretamente as filas, implementar é muito fácil.

Sobre as filas do sistema operacional, estas fazem parte do IPC (do inglês
*Inter-process Communication*), o esquema de comunicação inter-processos do seu
sistema operacional. Trata-se de algo muito antigo e muito bem documentado,
também sendo absolutamente estável.

Com relação às filas distribuídas, você encontra muito material na internet,
principalmente no seu provedor de serviços de infra-estrutura. Serviços como AWS
e Azure oferecem filas distribuídas como parte da sua carteira de serviços. E
todos muito bem documentados.

Bom, é isso aí. Happy Coding!
