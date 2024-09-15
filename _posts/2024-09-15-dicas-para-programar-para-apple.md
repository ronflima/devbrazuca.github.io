---
layout: post
title: "Dicas para programar para a Apple"
subtitle: "Por onde começar com a maçã"
image: "https://images.pexels.com/photos/544295/pexels-photo-544295.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
author: ronaldo
categories: [Programação]
---

De vez em quando eu vejo alguém com a intenção de adentrar-se no mundo
Apple e desenvolver aplicações, principalmente para a plataforma
móvel, o iOS. No entanto, sempre vejo as pessoas começando pelas
plataformas híbridas, como react native, por exemplo. Não há nada de
errado nisso mas, no entanto, ir para uma plataforma híbrida não lhe
permitirá ter um conhecimento aprofundado das coisas da Apple.

## Antes de Começar

Por que eu sei alguma coisa da Apple? Em 2012 eu fundei uma empresa
especializada em desenvolvimento para iOS. Operamos até meados de
2014, quando fechei a empresa junto com o meu sócio. Desenvolvemos
vários aplicativos para iOS em uma época em que ninguém falava muito
sobre aqui no Brasil. Arrisco a dizer que foi a primeira empresa
especializada em Apple aqui na minha região.

Quando comecei, a linguagem era o Objective C, uma mistureba de
Smalltalk com C. A sintaxe era muito feia por conta do excesso de
brackets para ativação de métodos. No entanto, era uma linguagem
sofisticada e muito elegante em termos de soluções oferecidas.

De certa forma, o Swift herdou um pouco da elegância do Objective C,
principalmente no tocante à extensão de classes através das
categorias, minha feature predileta na linguagem.

## Por onde começar?

Independentemente se você vai optar pela plataforma híbrida ou nativa,
você não tem escolha: você precisa de um mac. Sem um mac você não
consegue provisionar os pacotes para carga na loja, não consegue criar
pacotes de instalação para beta testers, nada. Ou seja, é essencial
ter um mac.

Mas, qual mac deveria ser o seu primeiro? Os macbooks são caríssimos
no Brasil. O macbook é excelente se você precisar de mobilidade. Sem
dúvida, é uma máquina sólida e estável, mas também muito cara.

Se a mobilidade não lhe faz falta, o mac mini é uma excelente
opção. Criado para ser uma máquina de entrada para o mundo Apple, ele
é vendido sem teclado, sem mouse e sem monitor. Mas não deixa a
desejar em termos de recursos. O que ninguém te conta é que você não
precisa comprar os acessórios caríssimos da Apple para usá-lo: você
pode usar um teclado de PC comum, um mouse comum e um monitor HDMI
qualquer.

Quanto à memória, claro que 16GB são a base, mas dá para viver com
8GB. E aqui existe um detalhe muito importante que precisa ser
contado: aumentar memória nos macs não muda a velocidade de nada. O
que muda é a quantidade de coisas que você pode fazer em paralelo. Com
menos memória, você vai passar raiva se precisar usar várias
aplicações ao mesmo tempo pois uma ou outra aplicação vai usar o swap
e vai ficar lenta. Infelizmente, as máquinas da Apple não permitem
mais que você expanda memória depois. É preciso comprar a máquina já
com a quantidade de memória que deseja.

A diferença com relação ao Windows é justamente como o macOS lida com
a memória: o sistema operacional tentará usar toda a memória
disponível para rodar as aplicações. Será feito uso do swap se a
memória física exaurir-se. O Windows usa o modelo muito diferente: se
uma janela ficar em segundo plano ou for minimizada por um tempo, o
sistema operacional move o processo inteiro para o swap, visando
liberar mais recursos para o processo em primeiro plano. A
consequência disso, é que mais memória no sistema permite que o
sistema mova menos aplicações para o swap e, por conta disso, tudo
fica mais rápido.

## E o que mais?

Agora que você já se decidiu com relação a qual mac comprar, vem o
software: qual usar? Você precisa do Xcode, mesmo que não vá programar
nele. É ele quem se pendura no sistema de developers da Apple e ajuda
a gerenciar os certificados digitais necessários para distribuir e
rodar aplicações nos dispositivos da Apple: iPhone, iPad, iWatch,
Apple TV, Apple Vision. Normalmente você usará mais o Xcode command
line tools. Mas é sempre uma excelente ideia ter o Xcode.

Uma vez que você tenha o software instalado, ainda falta um passo: uma
conta no programa de developers da Apple. Isso vai lhe custar USD
99,00 por ano. Você precisa disso para criar os certificados digitais
para rodar seus apps nos dispositivos Apple. No entanto, se você
estiver com a grana curta, sugiro postergar esse passo até você
realmente precisar distribuir seu app.

## Comece nativo, depois vá para o híbrido

Por que disso? A questão é simples: ao aprender como funciona o nativo
primeiro, você entende como extrair o máximo dos dispositivos da
Apple, a entender como a Apple espera que você programe seu app e o
que esperar da plataforma em termos de usabilidade e experiência do
usuário.

Além disso, o SDK da Apple é absolutamente conciso e cheio de ideias
fantásticas que, depois, você poderá adotar na sua plataforma híbrida
de preferência. Isso só aumenta seu valor como programador.

## Muito mais do que só iOS

Apple é muito mais do que só iOS. Programar exclusivamente para iPhone
é apenas uma pequena variável da equação. Existe todo um ecossistema
valioso por detrás, juntando-se o mac, Apple TV, iWatch, iPad... São
cenários diferentes de uso para cada parte da plataforma, algo que
pode lhe trazer diversos benefícios.

Várias empresas de desenvolvimento especializaram-se apenas na Apple e
vivem muito bem dentro do ecossistema. Por exemplo, a empresa
austríaca [Ideas on
Canvas](https://www.crunchbase.com/organization/ideasoncanvas),
desenvolvedora do aclamado software de mapas mentais, o Mind Node,
vive apenas dentro da Apple. A aplicação deles está disponível tanto
para iPhone/iPad quanto para macOS.



