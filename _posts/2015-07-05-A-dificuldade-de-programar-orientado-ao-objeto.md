---
layout: post
title: A dificuldade de programar orientado ao objeto
image: https://cdn-images-1.medium.com/max/800/0*FnipXdVL1WVjGrP5.png
author: ronaldo
categories: [Desenvolvimento, Programação]
---

Este artigo é fruto de algumas observações que venho fazendo já
há algum tempo. Bom, aprendi a programar orientado ao objeto ainda no
Turbo Pascal 5.5, o primeiro compilador Pascal da Borland que suportava
a programação orientada ao objeto. Na época, a Borland já tinha um
compilador C++. Isso foi há mais de 20 anos. De lá para cá, a forma de
abstrair os requisitos e modelá-los em objetos mudou bastante. Hoje, a
programação orientada ao objeto é um misto de programação funcional,
procedural e orientada ao objeto.

Muita gente acha que programar orientado ao objeto é sair escrevendo uma
montanha de classes e interações entre elas. Existe uma premissa que,
atualmente, é francamente ignorada: é preciso projetar o seu software
antes de escrever a primeira linha de código.

A primeira coisa é como transformar os dados em informações úteis e, por
fim, como estruturar estas informações em grafos, organizando suas
dependências e quais operações são viáveis com cada informação. Já deu
para sacar que a programação orientada ao objeto parte da suposição, que
hoje sabemos ser incorreta, de que você tem toda a informação que
precisa para modelar seu software no início do seu projeto.

Como hoje usamos algum tipo de método iterativo para desenvolver
software, fica complicado demais escrever software orientado ao objeto
sem ter todas as informações na largada. O pior: muitas vezes é
necessária uma mudança radical no grafo de objetos devido a uma
dependência que não foi inicialmente prevista.

Porém, essa limitação da POO foi solucionada com o uso de *design
patterns*: Façades, MVCs, por exemplo, isolam o modelo de dados do
restante da sua aplicação e permitem que você altere o seu modelo de
dados com impacto minimizado para o restante do sistema.

### Herança

A herança foi uma das grandes *features* da programação orientada ao
objeto durante anos, principalmente devido à possibilidade de
reutilização de código, generalização e especialização. Porém, a herança
tem um custo que normalmente se traduz em performance.

Cadeias de hierarquia muito profundas fazem com que chamadas de métodos
em super classes causem buscas custosas nas tabelas virtuais das
classes, atrasando em vários microssegundos a ativação de um método.
Pode parecer pouco, mas um microssegundo é uma eternidade em termos
computacionais.

Hoje em dia prefere-se a implementação de interfaces do que a herança
justamente por este motivo, em um esquema de programação chamado de
programação orientada a contrato. A interface é o contrato que a classe
que implementa-a tem de cumprir para ser corretamente ativada.

Objective C implementou este princípio pela primeira vez através da
adoção de um princípio chamado de *protocolo*. Logo foi seguida por
Eiffel e Java. Para quem não sabe, Objective C apareceu em 1983 através
de uma pequena empresa chamada Stepstone, Eiffel em 1985 e Java em 1995.

### Por que é complicado?

Ao contrário da programação procedural, a programação orientada ao
objeto exige um alto grau de abstração. Os modelos orientados ao objeto
acabam se tornando mais abstratos e mais complexos, principalmente no
tocante à dependência funcional e temporal entre entidades.

Com o encapsulamento, torna-se mais difícil, em alguns casos,
identificar as dependências. Nem sempre você tem o código-fonte da
super-classe que está usando.

Ideias como hierarquias de classes e grafos de objetos são, por si só,
bastante sofisticadas do ponto-de-vista computacional. Comparando com a
programação procedural, é muito mais fácil descrever-se um fluxo de
trabalho do que descrever interações entre classes distintas de dados.

### Semântica Procedural

Eu tenho visto muito código que é sintaticamente orientado ao objeto mas
que semanticamente é procedural. Por que isso é ruim? Por conta das
dependências que isso gera. Por exemplo, já vi código cheio de *helpers*
que nada mais são que um *namespace* para funções que não compartilham
nenhum estado entre si. Isso não é POO, mas uma forma de infringir a POO
através da semântica.

Eu comecei a detectar isso em código java, primeiramente, principalmente
em código que executa dentro de containers JEE. Justamente por não
permitir nenhuma forma de função, java é uma linguagem na qual os
programadores infringem a POO usando *design patterns* ou construções da
própria linguagem, como o uso de métodos de classe.

O efeito disso é código complexo, acredite. Classes com excesso de
responsabilidades, classes sem responsabilidade alguma que funcionam
simplesmente como estruturas de dados sem inteligência. É comum, também,
ver código altamente acoplado através do uso exacerbado de *singletons,*
algo que chamo de *a forma sofisticada de criar uma variável global*.

### O que fazer?

Programar orientado ao objeto não é simplesmente sair criando classe. É
preciso projetar o seu código de forma consciente. É um trabalho
iterativo que segue a sequência *projeta-escreve-testa-corrige*
indefinidamente, durante toda a duração do projeto.

O fato é que programar orientado ao objeto é um paradigma e não uma
tecnologia. Antes de aprender a linguagem, é importante compreender o
paradigma para, só depois, aprender a linguagem que expressa,
sintaticamente, a POO. É possível programar orientado ao objeto mesmo em
linguagens inerentemente procedurais, como C. A Win32, da Microsoft, é
escrita integralmente em C e é totalmente orientada ao objeto. A
biblioteca Core Graphics da Apple é escrita em C e é orientada ao
objeto.

Portanto, a minha dica é: para dominar a POO é preciso, primeiro,
dominar o paradigma para, só depois, dominar uma linguagem. Caso
contrário, você se torna o autor do caos, escrevendo código que
sintaticamente é orientado ao objeto, mas cuja semântica é totalmente
procedural.

