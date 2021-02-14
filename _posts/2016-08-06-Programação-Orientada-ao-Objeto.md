---
layout: post
title: Programação Orientada ao Objeto
subtitle: Demorei anos para entender que raios era isso. E não é tão simples assim.
image: https://cdn-images-1.medium.com/max/800/1*XtnYegzS5oCV0xWGEgNaiQ.jpeg
author: ronaldo
categories: [Desenvolvimento,Opiniões,Programação]
---

Hoje em dia toda nova linguagem de programação é orientada ao
objeto. A despeito disso, o que mais vejo é código escrito nessas
linguagens que não são orientados ao objeto. Hein!? Como assim?! Como
é possível escrever código não orientado ao objeto em uma linguagem
orientada ao objeto?

O paradigma de programação orientada ao objeto é antigo. As ideias
nasceram no MIT nos fins de 1950. A primeira linguagem que aprendi
orientada ao objeto foi Pascal, mais especificamente Turbo Pascal 5.5,
que foi a primeira versão do Pascal da Borland a suportar a POO. De lá
para cá muita coisa mudou e a coisa, que já era abstrata, ficou ainda
mais abstrata: *factories*, *adapters, mementos, chains of
responsibility…* Os *design patterns* trouxeram mais abstração para a
POO e hoje em dia a metáfora dos animais já não é boa o suficiente
para ensinar POO.

Por ser algo muito abstrato, a POO é difícil de aprender. Vários
conceitos são artificiais e isso torna o aprendizado bastante
complicado. O resultado que se vê é isto: muito código não orientado
ao objeto escrito em linguagens orientadas ao objeto.

Quer um exemplo? Alguém, algum dia, inventou uma coisa macabra chamada
de *helper*. O conceito foi distorcido e tornou-se uma classe sacola
cheia de métodos estáticos. Como não há o menor controle de estado
dentro desta classe, a mesma é usada somente para agrupar os métodos
dentro de um namespace bem definido. E os métodos, neste contexto, se
tornam meramente um amontoado de funções, como na programação
procedural.

Ou seja, os métodos estáticos são, na verdade, uma forma usada por
programadores menos experientes para colocar código procedural dentro
dos sistemas que deveriam ser orientados ao objeto. O resultado final
é um código que parece um frankenstein: classes, objetos e procedures.

Outro indicador de que seu código não é orientado ao objeto é o uso
indiscriminado de *design patterns,* principalmente do
*singleton*. Por ser fácil de implementar, o singleton é usado
indiscriminadamente. O resultado é um código final altamente acoplado
à uma variável global.  Sim, meus amigos, o singleton é a forma mais
simples de conseguir-se uma variável global em qualquer linguagem de
programação orientada ao objeto, inclusive no java.

Os objetos tem ciclos de vida bem determinados. Mantém seus estados e
permitem que agentes externos mudem seus estados internos através de
métodos. Se você não programa desse jeito você está, na verdade,
escrevendo código procedural, ou seja, código que dá importância
primeiro ao que precisa ser feito e depois aos dados.

A POO foca os dados e depois os que se pode fazer com eles. O ciclo de
vida dos objetos é bem definido e a forma de controlar os estados
internos também. Na programação procedural os estados são mantidos
fora dos dados e as operações que transformam os dados são as mesmas
que mantém os estados dos dados em processamento.

#### Projete antes, escreva depois

Não se escreve código orientado ao objeto sem antes projetá-lo. Você
precisa ter um modelo bem definido para começar a escrever
código. Sair escrevendo código sem antes projetar o modelo terá os
seguintes efeitos:

- seu código será altamente acoplado. Qualquer generalização e
  tentativa de modularizar o código será frustrada por conta do alto
  acoplamento;
- seu modelo de dados será ineficiente, mesmo sendo eficaz. Como você
  escreveu o código sem projetá-lo antes, você terá em suas mãos um
  grafo de objetos difícil de manter, possivelmente cheio de classes
  desnecessárias e redundantes;
- seu modelo terá classes *sacola*, verdadeiros elefantes cheios de
  métodos não relacionados. As classes sacola são um exemplo clássico
  de programação procedural em um ambiente orientado ao objeto.

#### POO não é ágil

Não dá para escrever código orientado ao objeto sem parar para
projetar antes. Quando o paradigma foi inventado, o que havia no
mercado era o modelo *waterfall*. Todo mundo sabe que o modelo de
desenvolvimento *waterfall* é completamente falho: ele parte da
suposição que todo o conhecimento do projeto está disponível no início
do projeto.

Portanto, tentar programar orientado ao objeto sem ter em mente que a
POO parte do mesmo princípio é pedir para dar merda. Se você usa um
modelo ágil de implementação, como Scrum ou XP, é preciso ter em mente
que a cada *sprint* você terá de reservar um tempinho para projetar o
seu grafo de objetos no intuito de projetar um conjunto de classes que
seja não só eficaz como também eficiente para resolver seu problema.

Sim, é possível usar a POO em projetos ágeis. O que não dá para fazer
é achar que a linguagem orientada ao objeto que você usa é ágil. Não
é, desculpe. Mas não é difícil adaptá-la para ser ágil. Ao trabalhar
de forma bem modular, com responsabilidades bem definidas, é possível
criar um modelo que cresça de maneira ágil sem, no entanto, criar um
frankenstein de código.

