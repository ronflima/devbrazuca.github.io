TDD, BDD, ou qual técnica usar?
===============================

As primeiras coisas primeiro!

------------------------------------------------------------------------

### TDD, BDD, ou qual técnica usar?

#### As primeiras coisas primeiro!

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*5FjiEW3V-S6C4ZLNDl5LGA.jpeg" alt="Photo by Kevin Ku from Pexels" class="graf-image" /><figcaption>Photo by <a href="https://www.pexels.com/@kevin-ku-92347?utm_content=attributionCopyText&amp;utm_medium=referral&amp;utm_source=pexels" class="markup--anchor markup--figure-anchor">Kevin Ku</a> from <a href="https://www.pexels.com/photo/coding-computer-data-depth-of-field-577585/?utm_content=attributionCopyText&amp;utm_medium=referral&amp;utm_source=pexels" class="markup--anchor markup--figure-anchor">Pexels</a></figcaption>
</figure>Outro dia vi um colega CTO defendendo efusivamente o
aprendizado do TDD no Linkedin. Bom, antes de começar é bom que você
entenda: eu não tenho absolutamente nada contra TDD ou BDD. Na verdade,
defendo ambos. Porém, este artigo trata de algo muito mais rudimentar: a
capacitação dos developers.

#### O básico antes

Saber uma linguagem de programação não faz de você um programador. Eu já
escrevi sobre isso diversas vezes aqui no meu blog. Não é por que você
sabe uma linguagem de programação que você é um programador. Na verdade,
o conhecimento sobre uma determinada linguagem é a última coisa que você
deveria procurar. Existe muito mais coisa importante no meio do caminho.

Por exemplo, vários programadores desconhecem o modelo relacional. Veja,
modelo relacional, não banco de dados relacional. Há uma grande
diferença na abordagem. Poucos sabem fazer um DER para analisar e
modelar um problema. O conhecimento das formas normais também anda
desaparecendo. Falar na primeira forma normal é quase como declamar
Camões em Sânscrito.

Antes de sair correndo atrás de uma linguagem de programação, é muito
mais importante entender as abstrações. Como estruturar a informação,
como criar modelos que expliquem um determinado processo de negócio?
Vários programadores não fazem a mais remota ideia de como fazer isso,
demonstrando um gap que vejo aumentar-se todos os dias em detrimento do
conhecimento de alguma tecnologia específica.

Vejo muita gente que conhece, por exemplo, AWS S2, mas não faz ideia de
como projetar um sistema desacoplado, multiprocessado e multi-camadas,
este último um conceito que esteve muito em voga na virada do Século XX
com seus monitores de transação, application brokers, e por aí vai.

#### Você sabe programar orientado ao objeto?

A Programação Orientada ao Objeto, por exemplo, é algo fantástico para
demonstrar o quanto há um gap de conhecimento nos developers. Você seria
capaz de implementar uma biblioteca totalmente orientada ao objeto em C?
Veja, não estou falando de C++, mas C. É possível fazer isso?

Sim, é possível.
<a href="https://github.com/ronflima/feijuca" class="markup--anchor markup--p-anchor">A biblioteca Feijuca</a>,
que comecei a escrever em 2003 com um grande amigo, é um claro exemplo:
totalmente orientada ao objeto. Programação Orientada ao Objeto é um
*paradigma*, ou seja, um princípio e não uma forma sintática ou
semântica de programar. Linguagens como C++, Java, Smalltalk e outras
demonstram sintatica e semanticamente como fazê-lo. C, por outro lado,
não permite descrever isso desta forma, mas mesmo assim é totalmente
possível usar o paradigma.

A biblioteca Feijuca leva em conta o paradigma orientado ao objeto:
encapsulamento, herança, análise centrada na informação. Porém, ao ler o
código você verá apenas C sem frescura. A abstração vale. Há
construtores, destrutores, métodos. Porém, todos são funções que operam
um objeto de dados opaco, uma struct. Por que? Por que C não suporta o
paradigma de maneira sintática. Mas nada impede que o princípio seja
usado.

Quando se fala na POO, muita gente não entende o que é transição de
estados, encapsulamento, acoplamento — princípios que são básicos e que
servem para qualquer linguagem de programação.

#### Gaps

Não estou aqui para vangloriar-me de uma biblioteca que escrevi há anos,
mas para apontar que há um gap de conhecimento nos developers que, na
minha humilde opinião, deveria ser considerado como algo grave.

Com o passar dos anos, a responsabilidade em cima dos developers
aumentou consideravelmente. Duas funções tornaram-se uma só. Antes, quem
projetava o sistema era o Analista de Sistemas. Sua função era
basicamente entender e modelar o problema, oferecendo uma solução
matemática que cobrisse os cenários avaliados do problema em exame.

Somente depois entrava em cena o programador, que nada mais era que um
escritor de código. Era o trabalho do programador traduzir o modelo
criado pelo analista em código executável.

O que mudou nos últimos anos é que o desenvolvedor é o antigo
*analista-programador*, ou seja, uma junção das duas funções em uma.
Porém, os desenvolvedores focam-se muito mais nas linguagens de
programação do que nas abstrações. O efeito disso são modelos
ineficientes e ineficazes. A máxima “aumenta o tamanho da VM” nunca foi
tão usada como nos últimos tempos. Este é um efeito colateral da
ineficiência das soluções como um todo: cada vez mais poder de
processamento e necessário para que o software execute.

#### Estude, sempre!

Nós temos uma profissão que nos obriga a estudar sempre. Afinal, sempre
aparece algo novo para olhar. Mas não é apenas o “novo” que precisamos
estudar. É preciso, também, olhar as fundações, entender como a análise
e o modelamento funcionam, entender que estas são ferramentas
fundamentais para escrever código.

Ao longo dos anos eu diminui o tempo que uso para escrever código. Eu
diria que hoje eu gasto 10% do meu tempo escrevendo código efetivamente.
Os outros 90% são estudando o problema, criando modelos, testando estes
modelos, avaliando hipóteses. Uma vez que o problema é conhecido e está
resolvido, a escrita de código é quase trivial. Afinal, com um modelo
pronto, torná-lo uma realidade é bem mais simples do que parece.

Grande parte do esforço de desenvolvimento atualmente é gasto modelando
e escrevendo código ao mesmo tempo. O resultado é um modelo final
capenga, cheio de remendos. Como o foco está no código, e não no
princípio que levou à escrita do código, o efeito é bem conhecido:
muitos bugs, muito retrabalho. Se você usa TDD, certamente seus cenários
de testes são complexos e quase um sistema à parte. Mas isto é por que o
modelo não foi bem projetado, não foi bem validado.

Costumo dizer que a escrita de código é a última coisa que se deve
fazer. E não é para menos: como você quer construir uma ponte sem
conhecer o mínimo sobre arquitetura, engenharia e o local onde a ponte
será feita? Por que nós, programadores, queremos fazer diferente e sair
escrevendo código tão logo a tarefa cai no nosso colo?

Para refletir…

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [August 17, 2020](https://medium.com/p/26d62be602ee).

<a href="https://medium.com/@ronaldolima/tdd-bdd-ou-qual-t%C3%A9cnica-usar-26d62be602ee" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
