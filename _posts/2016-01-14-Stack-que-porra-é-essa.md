---
layout: post
title: "Stack: que porra é essa?"
image: https://cdn-images-1.medium.com/max/800/1*F7JbgyRUlEvH4ht_1wzpXg.jpeg
author: ronaldo
categories: [Programação]
---

Quem estudou algoritmos sabe bem o que é uma pilha. Trata-se de uma
estrutura de dados que usa o esquema FILO: *First In, Last Out.* Ou
seja, o primeiro elemento a ser colocado na estrutura é o último a ser
retirado. Mas, por que a pilha, ou *stack* é uma estrutura tão
importante?

Você usa pilhas todos os dias, na sua linguagem de programação
predileta. Uma estrutura em pilha é usada pelos compiladores e
intérpretes para controlar as chamadas de função. Sempre que você chama
uma função ou método, o compilador ou intérprete se encarrega de criar
uma pilha que controla a profundidade da sua chamada. Abstrato demais?

Imagine que você tenha uma função *funcA* que chama *funcB* que, por sua
vez, chama *funcC*. A cada vez que uma função é chamada, o *run-time* da
sua linguagem predileta cria uma pilha com *funcA* como o primeiro
elemento. A pilha é desfeita à medida em que cada função retorna ao seu
chamador.

A pilha, na verdade, consome memória sem que você saiba. Os
compiladores, de uma forma geral, limitam a pilha a um determinado
tamanho, visando evitar problemas como a recursão infinita. Quando uma
função recursiva com problemas realiza uma recursão infinita, ou seja, a
função chama a si mesma repetidamente sem retornar, a pilha atinge seu
limite e literalmente estoura. É o que chamamos de *estouro de pilha*. O
compilador pode gerar código para gerar uma exceção no sistema
operacional ou pode gerar uma exceção dentro do seu código que pode ser
capturada por um tratador de exceções que você escrever.

Por que estou abordando esse assunto? Hoje em dia a estrutura do
programa em execução deixou de ter importância aos programadores, que às
vezes se vêem à volta com problemas de estouro de pilha sem entender por
que isso acontece. Com a popularização do javascript, tornou-se comum
criar pilhas de execução enormes devido ao uso indiscriminado de
*callbacks*.

Tudo bem, cada entrada na pilha consome uma merreca de memória, quase
desprezível. Porém, essa merreca começa a fazer falta em sistemas
embarcados nos quais a memória é um recurso extremamente limitado. E
realizar o desempilhamento é uma tarefa *time consuming* para o
*run-time* da sua linguagem favorita. Às vezes é preciso realizar um
*jump* na pilha, forçando um *rewind,* uma técnica arriscada devido à
propensão ao vazamento de memória.

Este tipo de coisa é comum em sistemas onde cada milissegundo faz a
diferença, principalmente em *engines* de jogos. Cenas podem ser
apresentadas com *flicker* para o jogador caso você não use uma técnica
meio radical para retornar de rotinas de renderização.

Em linguagens orientadas ao objeto a pilha tende a ser um pouco mais
complexa pois precisa realizar o *tracking* de qual objeto está
acionado. Se estivermos falando de linguagens com *garbage collector*, o
coletor de lixo não pode limpar da existência uma instância que
participe de uma chamada ainda não terminada. Ou seja, isso envolve um
trabalho extra do *run-time* para manter a casa em ordem.

Este é um dos motivos pelos quais as linguagens procedurais tendem a ter
performance muito superior às linguagens orientadas ao objeto. As
estruturas usadas dentro do seu *run-time* são mais simples e realizam
tarefas cujo preço em termos de memória e processamento são bem menores.

Eu não quero dizer, no entanto, que você deva abandonar sua linguagem
orientada ao objeto. Nada disso. Com o aumento de poder de processamento
dos processadores atuais, o trabalho extra do *run-time* é quase
irrelevante. Torna-se algo relevante em pequenos sistemas embarcados
mas, convenhamos, estamos falando de uma pequena parcela de todos os
sistemas que existem pelo globo afora.
