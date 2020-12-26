Singleton: a dependência funcional
==================================

De todos os design patterns, o singleton é talvez o mais popular. É
simples de ser implementado, simples de ser demonstrado e simples de…

------------------------------------------------------------------------

### Singleton: a dependência funcional

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*U2J-lhHhNvec6-MbD8p76A.jpeg" class="graf-image" />
</figure>De todos os *design patterns*, o *singleton* é talvez o mais
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

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [June 28, 2015](https://medium.com/p/d56b8ebdbf51).

<a href="https://medium.com/@ronaldolima/singleton-a-depend%C3%AAncia-funcional-d56b8ebdbf51" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
