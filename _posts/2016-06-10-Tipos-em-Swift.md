---
layout: post
title: Tipos em Swift
subtitle: Uma diferença importante com relação ao Objective C
image: https://cdn-images-1.medium.com/max/800/1*u8iaICEmxjkSFw9H3EPbtw.jpeg
author: ronaldo
categories: [Programação]
---

A tipagem nas linguagens de programação sempre foi um assunto
amplamente debatido. Tipagem forte ou relaxada? Tipagem dinâmica ou
estática? Com a linguagem Swift a questão não é diferente. E existem
alguns tópicos interessantes para se discutir sobre a forma como o
Swift usa os tipos de dados em relação ao seu antecessor, o Objetive
C.

O Objetive C herdou seu esquema de tipagem da linguagem C, ou seja, é
uma linguagem com tipagem estática e relaxada. A tipagem é estática
pois é preciso definir qual o tipo de dados de um elemento antes de
efetivamente usá-lo. Uma vez definido o tipo de dados do objeto, não é
possível mais alterá-lo.

Porém, o compilador é bastante complascente no que diz respeito à
verificação de tipos. Assim, você pode enfiar um número inteiro no
lugar de um ponteiro e vice-versa. Esta é uma característica de uma
linguagem de tipagem relaxada.

O Swift, por outro lado, implementa um sistema de tipagem forte. Se
algo é String, só entra ali String. A não ser que você diga à
linguagem como é que raios que ela converte um tipo em outro, usando
os *downcasts* ou *upcasts*. Mesmo assim, quando você tem classes em
hierarquias completamente distintas, não dá para realizar um
*downcast* e a compilação falha miseravelmente.

Porém, o Swift dá a falsa impressão de que implementa um sistema de
tipagem dinâmica. Não é bem assim: um elemento definido como sendo de
um determinado tipo poderá armazenar valores para aquele tipo
apenas. O que o Swift faz de diferente é **inferir** o tipo de dados
de um elemento com base no contexto no qual o elemento é
definido. Exemplo:

    var a = 123

Esta declaração cria uma variável *a* do tipo inteiro. O tipo é
inferido do contexto, ou seja, da atribuição neste caso.

A verificação forte de tipos do Swift fica clara quando você precisa
manipular estruturas complexas em memória. Por exemplo, imagine que
seu software recebeu uma estrutura JSON e converteu-a, em memória,
para uma coleção, um dicionário, onde cada elemento é
indexado. Acessar os itens mais profundos do dicionário requer um
trabalho extra pois é preciso desenvelopar cada elemento em cada nível
da estrutura, exigência da verificação forte de tipos.

Neste caso, o Objective C simplifica a vida do programador justamente
por que a sua tipagem é relaxada. Porém, os benefícios da tipagem
forte sobrepujam a trabalheira que dá desenvelopar elementos em
estruturas muito profundas. A principal vantagem é a diminuição dos
erros de programação.

Outra vantagem do Swift é o uso de opcionais. Em Objective C, o valor
*nil* é representado por um pointer inválido. Ou seja, nil é definido
como:

    #define nil ((void *)0)

Isto quer dizer que *nil* só vale para tipos ponteiro. Se você nunca
percebeu, todas as variáveis de determinada classe são, na verdade,
ponteiros:

    NSString * name;
    NSNumber * idade;

Portanto, *nil* só serve para descrever valores inválidos para classes
e ponteiros. Variáveis de tipos integrais não são elegíveis para usar
*nil* como valor inválido. Porém, em Swift, é possível usar nil para
determinar um valor inválido para uma variável de tipo integral graças
ao *optional chaining.* Não preciso dizer o quanto isto simplifica o
trabalho de inicialização de variáveis e verificação de valores
inválidos.
