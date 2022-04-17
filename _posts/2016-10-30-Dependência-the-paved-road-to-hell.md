---
layout: post
title: Dependência: the paved road to hell
subtitle: Por que dependenr de bibliotecas externas de forma negligente é ruim
image: https://cdn-images-1.medium.com/max/800/1*p81_580mm2QvL3hBpHQn9A.jpeg
author: ronaldo
categories: [Desenvolvimento, Opiniões]
---


Há alguns anos, quando a vida era mais simples, o software
dependia de uma ou outra biblioteca, normalmente alguma que fazia parte
de algum sistema operacional. Hoje em dia, com o aumento na complexidade
e na sofisticação das plataformas e softwares não é incomum escrever
código com uma pilha enorme de dependências.

Estava lendo este 
[excelente artigo do Freecodecamp](https://medium.freecodecamp.com/code-dependencies-are-the-devil-35ed28b556d#.75blw23sh)
e resolvi escrever sobre o assunto, embora focado no mundo *mobile,*
especificamente para o desenvolvimento iOS. Quem trabalha com iOS gerencia as
dependências do código ou com o *cocoapods* ou com o *carthage*. As dependências
podem ser código-fonte, que constrói-se juntamente com o seu código, ou código
binário, que é linkeditado ao seu executável final.

Durante o ciclo de vida do seu software, as dependências acabam se tornando uma
dor-de-cabeça ao longo do tempo, principalmente se são descontinuadas pelo
fabricante ou são modificadas de tal forma que várias funcionalidades são
retiradas ou têm sua interface drasticamente modificada.

Ao depender de código externo você coloca, naturalmente, um risco no seu
software. O risco é: e se esta dependência tiver um bug? No mundo do código
aberto é simples: faça um fork no repositório do github e arrume o bug você
mesmo, enviando ao autor o pull request. E se o autor morreu ou simplesmente
abandonou o código? Bem, você se fodeu.

Se o autor for uma empresa que distribui a dependência na forma binária, a coisa
é um pouco pior. E se a empresa quebrou ou foi comprada numa aquisição
predatória, daquelas que existem para tirar os caras do mercado? Você se fodeu
de novo.

Sim, reconheço o valor de usar código de terceiros, principalmente em
funcionalidades comuns, como logins, integrações com redes sociais ou serviços
externos. Porém, ao integrar funcionalidades oferecidas por código de terceiros
ao segredo da sua aplicação, aquele código que é especifico para o que a sua
aplicação faz, você aumenta o risco de ter de realizar um belo refactoring
estilo *escreve tudo de novo* no futuro.

O que tenho visto, no geral, é que se usam dependências de forma negligente,
como se o projeto fosse existir para o resto da vida, sendo mantido por
programadores bonzinhos que não tem mais o que fazer da vida. Não é assim que
funciona. Muitas vezes uma dependência vai ficar desatualizada e você se verá
preso a ela.

Por exemplo, a Apple agora está com a moda de fazer upgrade de linguagem de
programação. À medida em que o Swift evolui, a Apple sai mudando versão de
compilador e o escambau. O detalhe é que cada nova versão do compilador não
suporta a versão anterior da linguagem. Resultado: você precisa,
necessariamente, migrar o raio da sua base de código inteira para a nova versão
se quiser continuar no jogo. Porém, o que acontece se uma dependência sua está
escrita em swift e o autor largou o código sem manutenção por mais de um ano no
github?

Neste cenário de terror, é impossível migrar a sua aplicação sem migrar a
dependência junto. Como você não tem controle sobre o código da dependência, e
como provavelmente o autor do código não vai integrar seu pull request, o
resultado é um só: ou você tira essa bosta do seu código ou você abraça o código
inteiro, faz um fork e dá uma banana para o autor original, criando sua própria
versão da dependência.

O problema é que hoje os programadores brasileiros vêem no código-fonte aberto
uma forma de diminuir seu trabalho. São raros os que contribuem de volta nos
projetos. Mais raros ainda os que participam ativamente dos projetos. O
resultado deste comportamento é que o seu código vai ficar desatualizado por
sabe-se Deus lá quanto tempo — provavelmente até a Apple parar de aceitar seus
updates para subir na loja. Quando a Apple resolve que não vai mais aceitar seus
binários, prepare-se para noites sem dormir para resolver este problema.

#### Dependa com consciência

Se for depender de uma biblioteca externa, faça-o com consciência. Escolha uma
que é mantida por uma comunidade grande ou uma empresa grande. Se você encontrar
um projeto que foi feito por uma pessoa apenas e ainda quiser usar o projeto
como dependência, abrace o projeto.

Se o projeto for de código proprietário, tenha certeza de manter contato com o
fabricante. Conheça-o. Ajude-o a manter o software reportando defeitos. Meu,
você depende do diabo da biblioteca dos caras! Você acha que cruzar os braços
quando achar uma merda vai te ajudar?

Ajudar a manter dependências aumenta sua carga de trabalho, sem dúvida. Mas
aumenta seu *ownership* no código, bem como o seu domínio sobre a matéria. Isto
beneficia você no futuro, pois terá visibilidade como mantenedor da biblioteca
da qual o software da sua empresa depende.

Agora, se você simplesmente enfia a dependência na sua base de código e
*foda-se*, bem… desculpe criticá-lo, mas você não tem responsabilidade com o seu
trabalho nem com as consequências dele.
