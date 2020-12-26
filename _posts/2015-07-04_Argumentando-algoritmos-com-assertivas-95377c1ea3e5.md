Argumentando algoritmos com assertivas
======================================

As assertivas apareceram, inicialmente, na linguagem C, através do
arquivo de cabeçalho assert.h. As assertivas são normalmente associadas…

------------------------------------------------------------------------

Argumentando algoritmos com assertivas
--------------------------------------

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*BojhFMcBWL7pNIplk4e-ow.jpeg" class="graf-image" />
</figure>As assertivas apareceram, inicialmente, na linguagem C, através
do arquivo de cabeçalho *assert.h*. As assertivas são normalmente
associadas a código de depuração e há quem as defenda em código de
produção. A ideia da assertiva é ter uma ferramenta para argumentar
algoritmos. A argumentação de algoritmos é uma técnica utilizada para
verificar a corretude de um algoritmo.

A argumentação surgiu da necessidade de realizar testes estatísticos em
algoritmos, onde o teste tradicional gera um volume de dados tão grande
que torna o teste impraticável.

Por exemplo, imagine que você escreva uma função para calcular a raiz
quadrada de um número de ponto flutuante. Pelo método tradicional de
testes, você deverá testar sua função com todos os números reais
positivos e verificar o resultado para que o mesmo seja a raiz quadrada
do número entrado. Isso implica em testar todos os números de zero a MAX
FLOAT. Porém, entre zero e um há uma quantidade assombrosa de números
que depende do tamanho do número de ponto flutuante da plataforma que
você está usando para os testes.

Em termos teóricos, há infinitos números entre zero e um o que torna o
teste impraticável. Assim, a ideia é argumentar o algoritmo usando
assertivas. Uma assertiva é uma condição que é considerada verdadeira.
Se a condição se mostrar falsa, a assertiva falha e você consegue
verificar que seu algoritmo não está bom.

Pela argumentação de algoritmos, a assertiva de entrada, após ocorridas
as devidas transformações, leva à assertiva de saída. No exemplo da
função de raiz quadrada, a assertiva de entrada é um número real
positivo e a assertiva de saída é a raiz quadrada deste número. Ou,
pode-se elevar-se a raiz quadrada encontrada ao segundo expoente para
obter-se o número de entrada.

Desta forma, consegue-se testar completamente o funcionamento de um
algoritmo.

### Instrumentação

Adicionar assertivas no seu código é *instrumentá-lo*. A instrumentação
é uma forma de adicionar instrumentos no seu código que o permitam
encontrar defeitos mais rapidamente.

Porém, é importante que a instrumentação seja realizada somente em modo
*debug*, por uma questão simples: ela adiciona peso ao seu código,
diminuindo sua eficiência. Código de produção deve ser gerado sem
instrumentação por questões de performance.

O uso de assertivas permite que você rapidamente saiba por que
determinado bug ocorre, facilitando inclusive técnicas de
desenvolvimento como o TDD ou o BDD.

------------------------------------------------------------------------

*Originally published at*
<a href="http://www.ronaldolima.eti.br/2015/02/14/argumentando-algoritmos-com-assertivas/" class="markup--anchor markup--p-anchor"><em>www.ronaldolima.eti.br</em></a>
*on February 14, 2015.*

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [July 4, 2015](https://medium.com/p/95377c1ea3e5).

<a href="https://medium.com/@ronaldolima/argumentando-algoritmos-com-assertivas-95377c1ea3e5" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
