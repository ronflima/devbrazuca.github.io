---
layout: post
title: Automação no Mac OS X
image: https://cdn-images-1.medium.com/max/800/1*laPZMVm2QI8SNy2D9QdZ_w.png
author: ronaldo
categories: [Programação]
---

Já há bastante tempo que descobri duas coisas fantásticas no Mac OS
X. Uma é o *automator* e outra é o *AppleScript.* Comecei nesse mundo
com o Snow Leopard, mas fui ter com o Automator e AppleScript apenas
no Lion. Estas são duas ferramentas fantásticas para automação do
sistema operacional e aqui listo os motivos pelos quais considero
importante aprendê-las. Isso leva o usuário do Mac OS X para outro
nível, pois tarefas repetitivas passam a ser automatizadas por essas
ferramentas incríveis. O mais interessante é que tanto o Automator
quanto o AppleScript estão inclusos no sistema da Apple gratuitamente,
ou seja, você não precisa comprá-los como um app da App Store.

O Automator permite que você crie *fluxos de trabalho* facilmente. O
fluxos de trabalho são pequenos programas que fazem determinadas
tarefas. Por exemplo, eu tenho alguns fluxos de trabalho que, partindo
de uma imagem, criam outras versões dessa mesma imagem em resoluções
distintas. Esse fluxo é útil para resolver um problema que a Apple
impõe a quem trabalha com iOS: é preciso ter diversas versões
diferentes da mesma imagem para suportar diversos devices
diferentes. Existe um app na AppleStore que faz isso, mas o Automator
permite que você salve o fluxo de trabalho como um *serviço*. Os
serviços do Finder se tornam itens de menu, seja do menu de contexto,
seja do menu Serviços. Ou seja, o acesso é muito mais ágil.

![Menu de contexto de um arquivo demonstrando os
serviços](https://cdn-images-1.medium.com/max/600/1*JP2w-zVjDiB9nKPq1CZhSw.png)

No exemplo existe um serviço que criei chamado Arquivar Item. Este
serviço cria um arquivo ZIP na pasta ~/archives cujo nome é
*archive-YYYYMMDD.zip,* onde YYYY é o ano, MM o mês e DD o dia do
arquivamento. Uso isso para arquivar coisas antigas que não precisam
ficar dando sopa no meu HD. Transfiro para um HD externo.

Com o automator é possível criar fluxos simples que realizam tarefas
enfadonhas, como organizar arquivos colocando um número sequencial no
nome com um prefixo ou um sufixo bem definidos, enviar emails com
arquivos anexados de forma automática, através de eventos de calendário
e por aí vai. O bacana do Automator é que você faz isso sem escrever uma
única linha de código.

Porém, quando você precisa de algo um pouco mais sofisticado, que exija
algum tipo de análise que o automator não faz, é preciso usar
AppleScript. Com o Mac OS X Mavericks já é possível criar scripts de
automação usando javascript. Porém, gosto do AppleScript por que ele é
divertido. A linguagem é verborrágica e curiosamente semântica. É fácil
de aprender, no entanto, pois parece que você está conversando com o
computador.

Você acessa o AppleScript no Editor de Scripts, que está na pasta
Utilitários das suas Aplicações. Ele é simples de usar e a documentação
da Apple é bastante abrangente, apesar de estar em inglês. Você consegue
fazer coisas fantásticas com o AppleScript. Por exemplo, perdi um HD
externo um dia desses e usei um software para recuperar meus arquivos.
Havia uma biblioteca enorme de imagens que foi recuperada, mas várias
imagens ficaram corrompidas. Seria humanamente impossível avaliar mais
de 200 mil imagens para ver qual estava zoada. AppleScript para a
salvação! Criei um script em minutos que avaliava imagem por imagem,
eliminando as imagens corrompidas.

#### Qual a vantagem para os developers?

Se você desenvolve software usando a plataforma da Apple, essa
tecnologia de automação é especialmente útil para você. Ao invés de
depender de *task runners* como Grunt ou o próprio GNU Make, você pode
usar essas tecnologias de automação para criar scripts especialmente
úteis, até mesmo para automação de builds.

Em um projeto para iOS, usei um script que gerava arquivos de código e
de cabeçalho (.m e .h respectivamente) com base em configurações
colocadas em um PLIST. Essas configurações eram entry points de um web
service e elas viravam constantes string geradas usando AppleScript.
Durante o build, o script era disparado e gerava os arquivos
intermediários necessários para a correta compilação do software.

Por que é vantajoso usar AppleScript? Por que ninguém precisa instalar
absolutamente nada de novo na máquina. Um dos problemas atuais de
automação de tarefas é justamente acertar não só o software necessário
como também a versão desses software. Por exemplo, você pode usar um
makefile que funciona com uma versão específica do GNU Make, o que te
obriga a manter uma documentação atualizada para que outras pessoas
consigam compilar o seu código adequadamente.

Bom, é isso aí. Happy Scripting!
