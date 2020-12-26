Rule engines: o que são
=======================

Uma breve introdução.

------------------------------------------------------------------------

### Rule engines: o que são

#### Uma breve introdução.

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*rYKYSxdAKU7uGcR-WHg00Q.jpeg" class="graf-image" />
</figure>O cenário é este: você precisa escrever um software com
funcionalidades gerais mas que seja possível customizá-lo de forma que
estas funcionalidades sejam especializadas sem, contudo, alterar o cerne
daquilo que você escreveu.

Para exemplificar e clarear o princípio, imagine que você precise
escrever um software que calcule impostos que seja internacional. Em
termos gerais, existem duas formas de calcular impostos: aplicando-se
uma percentagem sobre o valor final ou destacando-se o imposto. O
destaque de imposto é usado em países fiscais, como o Brasil, nos quais
o imposto vem embutido no preço, ou seja, o imposto já foi previamente
calculado.

Sim, há diversas outras regras para calcular impostos, desde as
alíquotas até a combinação de produtos. Na Alemanha, por exemplo, as
redes de fast food tem impostos diferenciados nas bebidas e é possível
recalcular o preço dos itens da venda de forma a minimizar o preço das
bebidas, distribuindo a diferença nos outros itens da venda.

O fato é que imposto é um excelente exemplo pois as regras mudam de país
para país. Se você for prever todas as formas de cálculo de imposto
usado por todos os países do globo certamente você morrerá doido. É aqui
que entra a ideia do *rule engine*.

Em termos práticos, o rule engine é um intérprete que executa algum tipo
de linguagem de programação. O seu software carrega este intérprete e
expõe para ele algumas funcionalidades, como a obtenção de configurações
ou a busca de determinados valores do seu banco de dados, sem, contudo,
permitir acesso irrestrito ao seu sistema.

Ao calcular o imposto, no nosso exemplo, o seu software chama o
intérprete e passa a execução para ele de forma que a lógica de cálculo
de impostos seja realizada por uma linguagem de scripting. Ao terminar o
cálculo de impostos, o script retorna e sua aplicação recupera os
valores calculados pelo script através do intérprete.

Esta forma de trabalho permite que o seu software seja customizado por
terceiros sem, contudo, permitir o acesso irrestrito a funcionalidades
que são o cerne do seu sistema, o que poderia ser uma falha, inclusive,
de segurança.

Eu já tive a oportunidade de ver rule engines implementados usando o
iLog, um produto que pertence à empresa de mesmo nome, hoje parte da
IBM. Também, já vi implementações em TCL embutido e Javascript, este
último embutido em uma aplicação escrita em C++ (na época, usava-se o
Spider Monkey).

A vantagem de usar um engine de scripting está no isolamento completo do
ambiente de execução. É possível detectar, por exemplo, runaway loops e
interromper o script, evitandos o stall de uma aplicação inteira.

Como hoje em dia temos linguagens modernas que são interpretadas, como
Python e Ruby, não faz muito sentido em implementar-se um rule engine
desta forma, mas através de delegação. A desvantagem da delegação é que
o script terá acesso a todo o restante do intérprete. Porém, com
cuidado, é possível controlar bem a execução de um delegado através de
threads específicas monitoradas, de forma que possam ser canceladas no
caso de operações estranhas, como loops infinitos ou tentativas de
acesso a recursos privados.

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [February 12, 2017](https://medium.com/p/77e35c2f3164).

<a href="https://medium.com/@ronaldolima/rule-engines-o-que-s%C3%A3o-77e35c2f3164" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
