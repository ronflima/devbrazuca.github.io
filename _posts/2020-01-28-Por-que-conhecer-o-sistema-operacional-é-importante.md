---
layout: post
title: Porque conhecer o sistema operacional é importante
subtitle: Isso pode economizar muito dinheiro no seu PaaS predileto
image: "https://cdn-images-1.medium.com/max/800/1*pVAm5YOJKZez0bQyPB-sXQ.jpeg"
author: ronaldo
categories: [Programação]
---

Uma vez um amigo me perguntou por que é importante saber o que é um system call
e por que isso é importante para o desenvolvimento, considerando que hoje os
sistemas estão cada vez mais distantes do sistema operacional por conta da
enormidade de frameworks e ferramentas de desenvolvimento que existem por aí.

Mesmo em ambientes interpretados nos quais tudo passa pelo intérprete, é
importante saber o que o sistema operacional faz por debaixo dos panos por que
isso tem impactos substanciais na forma como você escreve o seu código.

# O meu código roda em um container!

Parabéns! O container no qual roda o seu código usa um sistema operacional. Como
você acredita que seu código consegue abrir arquivos, sockets, filas de
mensagens ou, ainda, sincronizar threads? Nada disso é oferecido pelo seu
container, mas pelo sistema operacional que está dentro do container junto com o
seu código.

Mesmo em sistemas que hospedam aplicações, como os web apps do Azure ou as
aplicações do Heroku, há um sistema operacional provendo uma série de serviços
básicos que o seu software utiliza direta ou indiretamente. E mesmo que você
utilize um intérprete, este precisa realizar chamadas de sistema para alocar
mais memória, abrir arquivos, criar mutexes para sincronismo de threads e por aí
vai.

Assim, é importante saber quando é que uma instrução pode ocasionar uma chamada
de sistema e o motivo é simples: quando isso acontece, o seu software
simplesmente é pausado para que a chamada de sistema execute. Ao terminar a
chamada de sistema, o processamento do seu software é resumido do ponto onde
parou. Isso tem consequências importantes na forma como o seu código precisa ser
projetado.

# Paralelo ou assíncrono?

Existe uma confusão enorme sobre paralelismo e assincronia nos dias de hoje.
Estes dois conceitos são substancialmente importantes do ponto-de-vista de
projeto de uma aplicação, principalmente aplicações que precisam,
necessariamente, de um tempo de resposta ínfimo por restrições impostas pelo
projeto.

A assincronia é efeito das threads em user space, ou co-rotinas: o contexto de
execução é trocado sempre que uma operação que realiza o bloqueio do
processamento é realizada, dando oportunidade para outra rotina entrar em
execução enquanto a rotina original aguarda o retorno do bloqueio. Mas, o que
isto quer dizer?

A thread em user space é uma forma de simular o funcionamento do kernel do
sistema operacional na troca de contextos entre threads. A diferença é que toda
a gestão da troca de contexto fica por conta do seu código. O que acontece na
prática é o seguinte:

-   Seu código entra em execução
-   Em determinado momento, seu código faz uma chamada que causa um bloqueio da
    execução — normalmente um system call, ou simplesmente abre mão do
    processamento (yield é uma palavra reservada normalmente utilizada em
    diversas linguagens que suportam isto na definição da linguagem)
-   Enquanto o seu código aguarda o retorno, a pilha atual é salva e em seu
    lugar é colocada a pilha de outra rotina que aguarda para executar. Se não
    há outra pilha salva, uma rotina é disparada em cima de uma pilha vazia.
-   Quando a chamada de sistema retorna à rotina que estava aguardando, a rotina
    atual é interrompida, a sua pilha é salva e a pilha da rotina que estava
    interrompida é restaurada; a execução resume-se do ponto onde parou.

Este princípio, descrito aqui de forma absolutamente simplista, é a famosa
*troca de contexto*. Porém, no caso da thread em user space, isto acontece
dentro do processo. A principal vantagem é que a troca de contexto dentro do
processo é muito mais eficiente do que a troca de contexto promovida pelo kernel
do seu sistema operacional quando é necessário trocar o contexto entre threads
distintas. Aqui, tudo ocorre serialmente, dentro da mesma thread. Ou seja, nada
é paralelo.

Entender a diferença entre threads em user space e threads *de facto* é
importante no projeto do seu software: isto muda completamente a forma como você
irá projetar a estrutura do seu código. Nas threads em user space, como o
processamento é sempre serial, não existem seções críticas. Assim, não há a
necessidade de sincronismo entre as diversas rotinas que concorrem pelo tempo
gerenciado pelo scheduler.

Por outro lado, as threads exigem sincronismo pois o seu software pode ser
quebrado de formas inoportunas quando uma thread perde o seu time share dentro
de uma seção crítica. O que isso tem a ver com o sistema operacional?

# Threads e Processos

Tanto as threads quanto os processos são entidades gerenciadas pelo sistema
operacional, bem como os elementos de sincronismo: mutexes e semáforos. Qualquer
operação feita usando estes elementos implica em uma chamada de sistema. Ou
seja, a sua rotina vai solicitar algo ao sistema operacional. Por outro lado,
apesar dos system calls, as threads e os processos executam, basicamente, em
paralelo em máquinas com vários processadores.

Isto quer dizer que o throughput de processamento do seu software tende a ser
muito superior ao mesmo software escrito de forma serial. No entanto, a
programação paralela traz, em si, diversos compromissos e desafios: o código
tende a ser bastante complexo. Em uma arquitetura multi-processos, há o
footprint do processo, que é muito superior ao de uma thread, e a dificuldade de
comunicar-se entre os processos envolvidos. O isolamento entre processos pode
ser uma vantagem — o Google Chrome usa uma estrutura multi-processos para evitar
o travamento do software, por exemplo.

# Conheça o Sistema Operacional

Todo esse blablablá focou-se em entidades do sistema operacional. Quer
paralelismo? Multi-processos. Memória está curta? Multi-threads. Muito I/O no
seu sistema? Threads em user space. E é importante entender quais as
consequências de cada necessidade pois isso tem implicações no uso do sistema
operacional que será quem proverá os serviços básicos para o seu software,
independentemente se você faz deploy numa VM, um container ou um serviço de
aplicativos.

Cedo ou tarde alguém vai fazer um system call e entender que isto acontece lhe
dá uma visão ampla de como projetar e construir o seu software para atender a
demanda de automação que você está atendendo. Este conhecimento permite que você
use as premissas certas ao escrever o seu código, além de permitir que você
projete de forma melhor a estrutura da sua aplicação, tirando vantagem das
características do sistema operacional no qual o seu software vai executar.
