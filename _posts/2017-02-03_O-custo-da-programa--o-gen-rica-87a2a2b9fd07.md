O custo da programação genérica
===============================

Nada é de graça, mesmo o que é bom.

------------------------------------------------------------------------

### O custo da programação genérica

#### Nada é de graça, mesmo o que é bom.

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*TU9RRODLViUP4olwkj3Jwg.jpeg" class="graf-image" />
</figure>Swift é uma linguagem que incorporou o que há de bom em
diversas linguagens de programação. Quando vi a especificação da
linguagem pela primeira vez, fiquei entusiasmado de haverem incluído a
minha característica predileta do C++: a programação genérica. C++ chama
isso de *templates* enquanto Swift chama de *generics.* O nome dado em
C++ é mais adequado pois é isto que os *generics* basicamente são:
modelos de código.

A ideia do modelo de programação genérica é permitir que você crie um
algoritmo ou uma estrutura de dados com um comportamento muito bem
definido, porém com lacunas que são preenchidas posteriormente com um
tipo de dado arbitrário. Assim, é possível usar a mesma lógica para
tipos de dados diferentes e não relacionados sem, contudo, abrir mão da
verificação de tipos.

Em C é possível realizar programação genérica. No entanto, abre-se mão
da verificação de tipos, algo que pode levar aos mais diversos
problemas. Por exemplo, a função da STDC *qsort* é uma função genérica:
ela aplica o algoritmo *merge sort* em qualquer estrutura contígua de
dados. A principal desvantagem da linguagem C para a programação
genérica, que é a ausência da verificação de tipos, acaba trazendo uma
outra vantagem: o código executável final é notadamente menor. Por que?

A programação genérica, conforme é implementada pelas linguagens
modernas, tem uma característica interessante: o compilador gera código
para você. Por exemplo, quem programa em Java conhece o *ArrayList*. Ao
criar um *ArrayList&lt;MyClass&gt;*, você está, na verdade, instruindo
ao compilador que crie uma nova classe baseada na estrutura *ArrayList*,
porém tendo como tipo interno *MyClass*. Ou seja, o compilador vai gerar
uma classe usando como base as definições de *ArrayList* e utilizando
como tipo o parâmetro *MyClass*.

Isto quer dizer que para cada tipo diferente que você usar como
parâmetro da estrutura genérica será gerado código para ele. Assim, se
você tiver *ArrayList&lt;BigDecimal&gt;, ArrayList&lt;String&gt;,
ArrayList&lt;StringBuffer&gt;*, você terá código gerado para cada uma
destas estruturas. Será código diferente, pois cada estrutura é
diferente.

O efeito que isto causa no seu código é o aumento do tamanho do
executável. E é algo compreensível: para cada instanciação de um
template, você terá código gerado exclusivamente para ele. E por que o
tamanho do executável é algo para me preocupar?

Imagine o seguinte: seu executável final tem 1MB de tamanho. O que isto
quer dizer? Que ali dentro há 1MB de instruções em código de máquina,
dados estáticos que são as constantes que você utilizou no código,
instruções de ligação dinâmica para resolução de símbolos em bibliotecas
dinamicamente ligadas (DLL no Windows, shared libraries no Unix), o
*loader* do programa e mais uma penca de coisas. Isto tudo precisa ser
carregado na memória para que o processador comece a executar o seu
programa.

Em computadores de boa capacidade, o aumento trazido pelo uso de
genéricos beira a irrelevância. Porém, para sistemas embarcados, com
pequenos smartphones ou ainda sistemas especialistas (leia-se internet
das coisas) isto faz diferença. Não é à toa que em sistemas embarcados a
linguagem mais usada ainda é C, como em máquinas de cartão de crédito e
coletores de dados.

#### Devo ou não usar generics?

A resposta é curta e grossa: deve. Trata-se de um recurso importante das
linguagens que suportam sintatica e semanticamente a programação
genérica. Simplifica muito a vida do programador e é uma ferramenta
fantástica justamente por que minimiza os erros relacionados ao
*casting* incorreto de tipos.

É importante, porém, entender que os generics têm um preço que, no
geral, é barato demais dado o benefício que é utilizar o recurso. Mas há
cenários nos quais as restrições impostas são excessivas a ponto de
tornar o uso dos generics algo proibitivo. No entanto, estes cenários
são raros e localizados e, provavelmente você será obrigado a usar uma
linguagem de programação que não suporte o recurso.

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [February 3, 2017](https://medium.com/p/87a2a2b9fd07).

<a href="https://medium.com/@ronaldolima/o-custo-da-programa%C3%A7%C3%A3o-gen%C3%A9rica-87a2a2b9fd07" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
