---
layout: post
title: "Singleton: a dependência funcional"
---

![singleton](/images/2015-06-28-Singleton--a-dependência-funcional.jpeg)

De todos os *design patterns*, o *singleton* é talvez o mais
popular. É simples de ser implementado, simples de ser demonstrado e
simples de ser entendido. É igualmente simples de causar transtornos no
seu software.

A ideia por trás do *singleton* é fazer com que uma classe tenha uma
única instância durante toda a existência do seu software. Através de um
truque simples com *accessors* é possível garantir isso. Porém, o
problema está na forma como o *singleton* é usado: se você chamar
diretamente o *accessor* de todo o código o resultado é apenas um:
dependência funcional.

Isso não é, exatamente, ruim. O ruim é quando você não sabe que
determinada classe tem dependência funcional a um *singleton* por que
chama o *accessor* do mesmo dentro do seu código. Graças ao
encapsulamento, os métodos que fizerem uso do *singleton* podem nunca
ser identificados caso você não tenha o código-fonte da classe sob
exame.

A melhor forma de deixar clara a dependência de um *singleton* é
explicitar esta dependência através do uso de uma propriedade na sua
classe, propriedade esta que é mandatória. Esta propriedade, por sua
vez, deverá ser uma referência fraca à instância gerenciada pelo
*singleton.* Dentro da sua classe, você passa a usar a sua propriedade
ao invés de chamar diretamente o *accessor* do *singleton*.

Desta forma, a dependência torna-se explícita através de construtores ou
inicializadores da sua classe, pois a propriedade em questão passa a
compor a lista de parâmetros do seu construtor/inicializador. Desta
forma, fica clara a dependência funcional com relação à instância do
*singleton*.

Assim, o seu código fica mais simples de ser compreendido e as
dependências ficam explícitas. O reaproveitamento deste código torna-se
mais simples pois basta criar uma instância da classe mandatória em
outro contexto.
