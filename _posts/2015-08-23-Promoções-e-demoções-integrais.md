---
layout: post
title: Promoções e demoções integrais
image: https://cdn-images-1.medium.com/max/800/1*uw_6qvP2TeHbT55uWFAJSQ.jpeg
author: ronaldo
categories: [Programação]
---

Os números normalmente são negligenciados pelos programadores,
de uma forma geral. O mais engraçado é que sem os números não existem
programas de computador. Em última instância, tudo em um computador é
representado por uma sequência de zeros e uns, através da representação
binária. Tudo. Desde uma foto até este texto que você está lendo.

Existem à disposição dos programadores basicamente dois tipos de
números: os números inteiros e os números de ponto flutuante. Como estou
falando de promoção e demoção, não estou preocupado com a precisão
destes números, mesmo por que vou falar de forma bem genérica sobre o
assunto. Cada linguagem tem a sua forma de promover e demover números
levando ou não em conta a precisão.

Primeiro, vamos entender o que é a tal promoção e demoção integral. Os
tipos numéricos são classificados através da sua complexidade: o mais
simples é o tipo inteiro e o mais complexo, o de ponto flutuante.
*Promover* um tipo é fazer com que ele saia do tipo mais simples para o
tipo mais complexo para que uma determinada operação possa ser
executada.

Em termos práticos, podemos dizer que se temos um inteiro e o
convertemos para um número de ponto flutuante, estamos promovendo o
inteiro para ponto flutuante. A recíproca é chamada de demoção, ou seja,
quando demovemos um ponto flutuante para um inteiro.

Por que raios isso é importante? Veja a seguinte operação, em linguagem
Swift:

    let a = 3 /2

Qual o valor de *a?* Se for diferente de 1, sou mico de circo. E um mico
bem gordo, diga-se de passagem. Praticamente um orangotango.

Mas não deveria ser *1.5?*. A resposta é: não. O que aconteceu para que
uma divisão de 3 por 2 desse 1 ao invés de 1.5? A resposta é simples: 3
e 2 são constantes inteiras. A operação é, na verdade, uma divisão
inteira. Ou seja, qualquer valor decimal é irremediavelmente truncado.

Para evitar o truncamento e obter o resultado de ponto flutuante é
necessário provocar a promoção de um dos operandos. Ao promover um dos
operandos, o resultado da operação é, igualmente promovido. Assim:

    let b = 3.0 / 2

dará como resultado o número 1.5. Porém:

    let c = 3 / 2.0

também dará o mesmo resultado. A existência de um número de ponto
flutuante no numerador ou no denominador provoca a promoção de todo o
resultado da operação. A promoção, no entanto, ocorre para qual tipo de
ponto flutuante? A resposta é: depende da linguagem. Por exemplo, Swift
promove para números de ponto flutuante de precisão dupla (*double*). É
necessário ler a documentação da sua linguagem de programação predileta
para entender para qual tipo é realizada a promoção automática.

É possível, no entanto, realizar a promoção manual dos tipos. Voltando
ao exemplo:

    let np = Float(3)/2

Neste exemplo a promoção é feita forçosamente para Float. Observe que 3
é convertido para Float o que força a promoção de toda a expressão para
Float ao invés de Double.

E se quisermos fazer justamente o contrário, ou seja, demover o
resultado para que seja inteiro? Aqui está uma sugestão que não é a
melhor:

    let d = Int(3.0) / Int(2.0)

O resultado disso é 1. Ambos numerador e denominador foram demovidos.
Observe que forcei um *cast* para que isso acontecesse. Uma outra forma
é:

    let e = Int(3.0/2.0)

ou seja, aplicamos a demoção no resultado da operação.

É importante, portanto, conhecer-se como funcionam as promoções e
demoções dos tipos integrais, principalmente em Swift. Swift determina o
tipo de uma constante ou variável com base na sua inicialização. Assim,
você sabe qual o tipo de variável com base no tipo da sua inicialização.
No último exemplo, *e* é uma variável inteira.

Type Cast
---------

O *type cast* não é apenas o “cala-boca” de compilador. Trata-se de um
*hint* muito útil ao compilador no momento de realizar as conversões de
tipos para avaliação de expressões. Se estivermos escrevendo um código
em C, teremos:

    double f = (double)3/2;

O *cast* para *double* força a promoção integral de toda a expressão
para o tipo *double*. Portanto, o *cast* é uma forma de forçar o
resultado de uma expressão promovendo ou demovendo para um determinado
tipo. Porém, é preciso tomar cuidado: o *cast* pode levar à perda de
informação devido aos truncamentos de dados que podem ocorrer quando um
tipo é forçado para outro, algo que ocorre com muita frequência nas
conversões entre números de precisão diferentes ou tipos integrais
diferentes (ponto-flutuante para inteiros, por exemplo.

