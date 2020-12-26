ABC: Conversão de Dados
=======================

Transformar quadrados em círculos é uma tarefa comum que todo
desenvolvedor de software faz. Porém, sua importância é negligenciada.

------------------------------------------------------------------------

### ABC: Conversão de Dados

#### Transformar quadrados em círculos é uma tarefa comum que todo desenvolvedor de software faz. Porém, sua importância é negligenciada.

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*IROxz9Nbba3fQ2glItVz4A.png" class="graf-image" />
</figure>Todo programador converte dados sempre que escreve um programa:
você lê os dados do teclado ou de um arquivo, formata-os em uma ou mais
estruturas de dados que compõem um grafo que implementa um determinado
modelo e, por fim, você converte novamente em tabelas para que possa
salvar essa coisa toda num database qualquer.

Tem novidade? Claro que não. Isso é lugar comum. Porém, a conversão de
dados é algo negligenciado e aqui apresento um princípio simples mas que
pode ser amplamente aplicado em qualquer linguagem de programação. Toda
essa firula para falar dos *construtores de conversão*, uma construção
que existe na linguagem C++. Várias linguagens contemporâneas ao C++
implementaram algo parecido: java, C\# com os operadores implícitos e
explícitos e por aí vai.

Por definição, um construtor de conversão recebe apenas um parâmetro
cujo tipo é diferente da classe que está construindo. Assim, se você tem
uma classe A que tem um construtor de conversão de uma classe B, você
pode fazer algo como:

> B b = B();

> A a = b;

Implicitamente o compilador chamará o construtor de conversão ao
construir a instância que será o objeto *a*. Assim, sempre que precisar
converter B para A, basta construir um objeto de A usando uma instância
de B. Simples assim.

Mas não quero falar de C++. A ideia aqui é usar o princípio do
construtor de conversão. Ou seja, sempre que você precisar converter de
uma estrutura para outra, você constrói a nova estrutura com base na
antiga usando, para isso, alguma forma de componentização, seja por uma
função no caso das linguagens procedurais, seja por um método maceteado,
no caso das linguagens orientadas ao objeto.

Isso simplifica a sua vida pois o código da conversão fica consistente.
É bem melhor do que você fazer algo do tipo:

> B b = B();

> A a = A();

> a.prop1 = b.prop3;

> a.prop2 = b.prop4;

Fazer desse jeito faz com que o mapeamento dos dados seja implementado
sempre que você precisar realizar a conversão, ou seja, você vai
escrever o mesmo mapeamento várias vezes. Ao invés disso, é melhor criar
uma função ou método que faça isso, pois você concentra tudo no mesmo
lugar. Se você usa uma linguagem orientada ao objeto, ficará tentado a
criar um *helper.* Eu sou um pouco contrário a essa ideia do *helper*
pois trata-se de uma função que, via de regra, infringe o paradigma de
orientação ao objeto.

Bem, quase toda linguagem tem alguma forma de construção que facilita a
conversão de dados. C\#, por exemplo, tem os operadores explícitos que
permitem construir um conversor de dados bastante eficiente, o que leva
a uma sintaxe de conversão assim:

> A a = (A)b;

O interessante disso é que a sintaxe deixa clara a intenção: estamos
convertendo explicitamente uma instância de B em uma instância de A.

É possível, também, usar os operadores implícitos. A semântica não fica
tão evidente, mas ao perceber que você está atribuindo uma instância de
B para A, percebe-se que há algo acontecendo além da atribuição:

> A a = b;

#### A importância do data mapping

A conversão é apenas uma faceta disso que estou falando. O mapeamento de
dados necessário para a conversão é algo que precisa ficar bem explícito
no seu código. Isso facilita a sua vida e simplifica a implementação de
qualquer solução que você venha a criar.

Não importa como você fará o mapeamento de dados, se campo a campo ou
usando alguma técnica mais rebuscada. O importante é que o mapeamento de
dados seja explícito e, de preferência, centralizado no seu código.
Assim, se houver alguma alteração em alguma estrutura de dados você
poderá, facilmente, alterar o mapeamento.

#### Nada de novo

Não existe, absolutamente, nada de novo no que escrevi até aqui. O
mapeamento de dados é um conceito antigo que, porém, é negligenciado por
programadores. Existem diversas formas de mapear dados de um tipo para
outro. A melhor forma é aquela que é a mais simples, explícita e fácil
de manter.

Não invente moda com algoritmos sofisticados. O algoritmo sofisticado dá
erro sofisticado. Ou seja, o bug fixing vai fazer você perder várias
horas de sono.

É importante compreender os modelos de dados e entender como converter
um modelo em outro dentro do seu sistema. Em outro artigo vou escrever
um pouco da heretogeneidade dos modelos de dados dentro do domínio de um
único sistema, abordando por que isso é uma boa ideia ao invés de tentar
chegar a um modelo universal e único.

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [February 27, 2016](https://medium.com/p/3c21898f1386).

<a href="https://medium.com/@ronaldolima/abc-convers%C3%A3o-de-dados-3c21898f1386" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
