Por que você não dá exemplos de código, Ronaldo?
================================================

Desenvolver software é muito mais que uma linguagem de programação.

------------------------------------------------------------------------

### Por que você não dá exemplos de código, Ronaldo?

#### Desenvolver software é muito mais que uma linguagem de programação.

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*olafzzyr_rfYiEQGlOabwA.jpeg" alt="Photo by Lukas from Pexels" class="graf-image" /><figcaption>Photo by <a href="https://www.pexels.com/@goumbik?utm_content=attributionCopyText&amp;utm_medium=referral&amp;utm_source=pexels" class="markup--anchor markup--figure-anchor">Lukas</a> from <a href="https://www.pexels.com/photo/code-coding-computer-data-574071/?utm_content=attributionCopyText&amp;utm_medium=referral&amp;utm_source=pexels" class="markup--anchor markup--figure-anchor">Pexels</a></figcaption>
</figure>Quem acompanha meu blog sabe que quase nunca coloco exemplos de
código, mesmo em artigos onde falo sobre determinado algoritmo. Há algum
tempo atrás eu cheguei a escrever algo em Swift, mas eram artigos
focados na linguagem.

Por que é que eu quase nunca coloco exemplos de código ou tutoriais de
como fazer determinada coisa usando código? Existe um motivo e uma
dissertação sobre o assunto que vale a pena compartilhar.

#### Linguagem não é importante

Não importa qual seja a linguagem de programação que você usa no seu
dia-a-dia. Ela não é importante. Pelo menos, não tão importante quanto
você acha. Existe algo muito mais importante que, normalmente, é
negligenciado, senão colocado em segundo plano: o conceito.

A linguagem de programação é apenas uma forma existente de expressão do
pensamento lógico, assim como o português. A diferença é para quem é que
você está expressando o seu pensamento lógico: no caso de uma linguagem
natural, como o português, o objetivo é expressar seu pensamento para
uma pessoa. É aqui que está a importância da linguagem de programação:
trata-se da forma como você expressará seu pensamento lógico de forma
que uma tarefa seja realizada com eficiência e eficácia por uma máquina.

A coisa realmente importante é o pensamento lógico, ou seja, a forma
como você entende o problema, como o modela e como pretende resolvê-lo.
Isto independe completamente de tecnologia e, principalmente, da sua
linguagem de programação.

#### Abstração e pensamento abstrato

O “pensamento lógico” nada mais é que uma forma de avaliar algo de
maneira abstrata, criando um modelo igualmente abstrato. Tudo o que se
faz em computação é basicamente criar modelos abstratos que consigam
explicar e simular um determinado processo que precisa ser automatizado.

Por exemplo, se alguém pedir para você criar um sistema de faturamento,
coisas como “fatura” e “itens da nota” são entidades abstratas que
precisam ser criadas como parte do modelamento dos dados e processos que
governam o negócio que está sob exame.

Existem diversas técnicas para que você modele algo assim: diagramas de
classes, DER (Diagrama Entidade-Relacionamento), MER (Modelo de
Entidade-Relacionamento) e os processos podem ser modelados por
diagramas de sequência, diagramas de estados, DFDs (diagrama de fluxo de
dados) e por aí vai. E tudo isso é independente da linguagem de
programação que você utiliza.

#### Paradigma independe da sua linguagem

Para ser mais provocativo ainda, arrisco-me a dizer que um paradigma de
programação também independe da sua linguagem. Quer um exemplo? A
<a href="https://github.com/ronflima/feijuca" class="markup--anchor markup--p-anchor">biblioteca Feijuca</a>,
que escrevi há anos atrás com meu grande amigo Daniel Soares, foi
escrita em linguagem C e é totalmente orientada ao objeto. Mas, C é uma
linguagem procedural!!!

Sim, C é uma linguagem procedural. Porém, toda a funcionalidade da
biblioteca valeu-se da Programação Orientada ao Objeto. Claro, se você
ler o código verá que trata-se de C plano. Porém, ao perceber que há
construtores, destrutores e, até mesmo, herança simples nos objetos de
dados, perceberá que há algo diferente. Estruturalmente, a biblioteca é
procedural, mas conceitualmente, totalmente orientada ao objeto.

Claro, isto ficaria muito evidente se uma linguagem orientada ao objeto,
como C++, tivesse sido utilizada. Afinal, C++ descreve sintática e
semanticamente o paradigma. C, por outro lado, é naturalmente
procedural. Mas nada impede que um princípio abstrato, como a POO, possa
ser utilizado em uma linguagem que claramente não suporta sintática e
semanticamente o paradigma. Isto é abstração!

#### Aprenda a analisar e modelar

Para concluir, o mais importante não é conhecer profundamente a sua
linguagem de programação predileta, mas saber analisar e modelar um
problema que deverá ser resolvido através de uma linguagem de
programação qualquer.

Os programadores que focam-se imediatamente em escrever código terminam,
normalmente, criando um Frankenstein por não compreender, nem expressar,
completamente o problema que precisam resolver. O resultado é bem
conhecido: muitos bugs, falta de aderência à especificação, uma
estrutura de código difícil de manter e de realizar refactoring… E por
aí vai.

Assim, antes de escrever a primeira linha de código:

-   <span id="a915">Entenda o problema que você precisa resolver.
    Modele-o. Teste o modelo que você criou. Veja se ele contém todas as
    informações que você precisa e verifique o que deve, ou não, ser
    persistido.</span>
-   <span id="0721">Analise o fluxo de informações. Há algo que pode ser
    paralelizado? Todo o processamento é serial?</span>
-   <span id="fda0">Releia a especificação e veja se o seu modelo cobre
    todos os casos descritos. Tente usar, sempre, o mínimo de
    informações para atender os requerimentos. Menos informação é menos
    processamento e menos armazenamento.</span>
-   <span id="d3bd">Delegue responsabilidades. Crie modelos que sejam
    hierárquicos, bem compartimentados. Evite modelos grandes demais.
    Determinar quem é responsável pelo que diminui a quantidade de
    checagens no seu código e lhe dará assunções importantes que deverão
    ser traduzidas nas sua implementação.</span>

Quando você passar para a escrita de código, o trabalho será
absolutamente simples. Na minha experiência, de 15 a 20% do tempo que
gasto é escrevendo código. O restante é entendendo, analisando o
problema, modelando, testando os modelos, conversando com stakeholders e
pessoas envolvidas indiretamente no que preciso resolver.

Happy Coding!

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [August 2, 2020](https://medium.com/p/91c684678248).

<a href="https://medium.com/@ronaldolima/por-que-voc%C3%AA-n%C3%A3o-d%C3%A1-exemplos-de-c%C3%B3digo-ronaldo-91c684678248" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
