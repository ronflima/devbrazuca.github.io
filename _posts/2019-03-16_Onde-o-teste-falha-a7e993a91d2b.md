Onde o teste falha
==================

Não coloque muita fé nos testes automatizados…

------------------------------------------------------------------------

### Onde o teste falha

#### Não coloque muita fé nos testes automatizados…

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*zamHn75KS7turQ-S99q6tA.jpeg" alt="Crédito: Pexels.com" class="graf-image" /><figcaption>Crédito: Pexels.com</figcaption>
</figure>Antes de começar um aviso: não estou desconsiderando os testes
automatizados. A automação de testes tem o seu valor nos projetos
modernos de desenvolvimento de software. No entanto, o foco deste artigo
é justamente a crítica à fé exacerbada colocada nos testes
automatizados, como se fosse uma bala prateada que resolve todos os
problemas de qualidade na produção de software.

#### Qualidade de software

Ao longo dos anos a indústria de desenvolvimento vem tentando
comoditizar o desenvolvimento de software através da automação e da
contratação de desenvolvedores cada vez menos experientes e com menor
conhecimento. Infelizmente, desenvolver software é quase como cozinhar:
quanto mais conhecimento e quanto mais experiência tem o cozinheiro,
melhor a comida.

A qualidade de software não está na abrangência dos testes e, muito
menos, no detalhamento das especificações: está na qualidade do que o
developer escreve. Escrever software é um processo que precisa ser
treinado diariamente para que seja efetivo. Quanto mais software você
escreve, melhor você fica nisso. Da mesma forma, quanto mais linguagem
de programação você aprende, melhor fica sua fluência na linguagem que
você usa no dia-a-dia pois você aprende formas diferentes, e mais
otimizadas, de escrever a mesma coisa.

Assim, o ponto central na qualidade do seu software não está na
qualidade dos seus testes, mas na qualidade daquilo que você coloca no
repositório para virar o produto que seu usuário vai usar.

#### Cenários onde o teste falha

Nenhuma abordagem de testes é livre de falhas, principalmente no que diz
respeito aos testes automatizados. A verdade é que os testes
automatizados são uma das diversas ferramentas disponíveis ao alcance do
desenvolvedor. E antes que me digam que estou metendo o pau nos testes
automatizados, consulte a
<a href="https://github.com/ronflima/feijuca" class="markup--anchor markup--p-anchor">biblioteca Feijuca no GitHub</a>.
Ela faz uso de testes automatizados e de integração contínua, apesar de
ainda não ter implementado geração de nightly builds por completa falta
de tempo.

Mas é importante ter em mente que os testes não resolvem tudo. E aqui
vão alguns exemplos. Imagine que você tenha desenvolvido uma classe para
compor um determinado componente numa relação de composição. Você
escreveu os testes unitários para verificar o funcionamento da classe de
acordo com as especificações. Onde é que seus testes falham?

Como toda classe, ao instanciar um objeto o seu código será responsável
pela manutenção do estado interno deste objeto. Os estímulos externos,
que chegam através dos métodos públicos ou protegidos da sua classe,
alteram os estados internos. Porém, os testes executam pela interface,
acessando exclusivamente aquilo que a classe torna público. Como validar
o estado interno?

Se a linguagem for Java, esqueça. Privado é privado e não há como saber
o que está lá dentro. Se for C++, você rompe o encapsulamento através do
uso de funções ou classes amigas. Linguagens cujo modelo de orientação
ao objeto são simplificados, como Javascript ou Python, permitem que
você acesse o estado interno dos objetos sem problemas. Mas, a despeito
disso, o *encapsulamento* é algo que precisa ser mantido pois é uma
característica intrínseca da POO, algo que independe da linguagem.

Assim, se um objeto da sua classe assume um estado inválido, o seu teste
não será capaz de verificá-lo, mesmo por que o teste, a rigor, precisa
conhecer o estado do objeto através do que está exposto. Em vários
projetos já vi manutenções predatórias que resolveram a comunicação da
interface mantendo o objeto em um estado inválido, mesmo que a classe
gerasse respostas corretas.

Quando se faz teste de funções, também, a ideia prevalece: não é
possível avaliar o estado interno das funções estando do lado de fora.
Injetar código para avaliar a função por dentro resolveria o problema,
mas cria outro: altera o balanço de tempo da função, o que é basicamente
ruim quando o seu código é dependente do tempo, por exemplo, em uma
arquitetura de múltiplas threads.

#### Como resolver isso?

Acabei por descrever uma limitação dos testes automatizados. Porém, não
deixe de usar testes automatizados por conta disso. O que eu quis
mostrar é que existem limitações com as quais você precisa lidar e cuja
importância é enorme, pois não expõem manutenções predatórias.

A forma melhor de resolver este impasse é através de outra ferramenta
chamada *argumentação de algoritmos*. Mais um exemplo de limitação dos
testes: como você faria para testar completamente uma função que receba
um número de ponto flutuante e calcule a raiz quadrada deste número?

Para o teste ser completo, você precisa testar esta função com relação a
todos os números positivos de 0 ao máximo valor de representação em
ponto flutuante, não se esquecendo de passar por todos os números
passíveis de representação entre os números inteiros. Matematicamente
falando, entre 0 e 1 há infinitos números. No computador a quantidade é
finita, mas muito, muito grande. E aí? Vai escrever cenários de testes
para isso tudo?

É aqui que a argumentação de algoritmos entra em cena:

> A invariante de entrada leva à invariante de saída.

Invariante é algo que você considera como correto em determinado trecho
do seu código. Assim, para argumentar a corretude do seu código, é
importante avaliar se a invariante de entrada está levando, de fato, à
invariante de saída. E a verificação de invariantes é realizada com
*assertivas*.

Assim, refraseando:

> A assertiva de entrada leva à assertiva de saída.

Ou seja, o estado de entrada, depois de processado, é o estado de saída.
No exemplo da função que calcula raízes quadradas, você pode verificar a
corretude do seu algoritmo dessa forma:

Não importa como a raiz é calculada por que não é o foco deste texto. Se
quiser uma ideia do algoritmo,
<a href="https://www.codeproject.com/Articles/570700/SquareplusRootplusalgorithmplusforplusC" class="markup--anchor markup--p-anchor">aqui há um exemplo</a>.
O foco são as assertivas: note que consideramos que a entrada precisa
ser, necessariamente, maior ou igual a zero, pois consideramos que uma
entrada negativa não é passível de calcular a raiz quadrada,
considerando que a função trabalha exclusivamente no domínio dos números
reais.

Assim, testamos a primeira invariante: a entrada não pode ser negativa.
Feito o cálculo da raiz quadrada, testamos a saída, ou seja, o
resultado, se multiplicado por si mesmo, é a entrada. Esta é a
invariante de saída.

Assim, com o auxílio das assertivas, o teste automatizado consegue
verificar estados internos. Alguns autores sugerem manter as assertivas
em código de produção. No entanto, as assertivas tendem a gerar pânico
no código, pois o processo será terminado de forma arbitrária. Arquivos
abertos terão *buffers* perdidos, transações pendentes serão perdidas e
por aí vai. Ou seja, não concordo com isso. Porém, há quem concorde e
com argumentos muito fortes defendendo seus pontos-de-vista. Deixo o
julgamento do mérito para você.

#### Conclusão

Como eu disse no início, não coloque muita fé nos testes automatizados.
São ferramentas úteis, mas falhas, como toda ferramenta. Há como
melhorar os testes com o uso de assertivas. Os testes são importantes,
mas não se deve colocar a garantia completa da qualidade do seu software
neles.

É importante que o seu código, antes de mais nada, seja bom. E para que
seu código seja bom é preciso que você tenha muita prática, estude
bastante e capacite-se sempre. O trabalho de desenvolvedor de software
exige o desenvolvimento do desenvolvedor. Ou seja, o desenvolvedor está
sempre aprendendo. E isto é uma necessidade.

Happy Coding!

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [March 16, 2019](https://medium.com/p/a7e993a91d2b).

<a href="https://medium.com/@ronaldolima/onde-o-teste-falha-a7e993a91d2b" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
