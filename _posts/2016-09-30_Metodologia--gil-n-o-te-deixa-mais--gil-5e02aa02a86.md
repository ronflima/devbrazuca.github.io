Metodologia ágil não te deixa mais ágil
=======================================

E o povo continua inventando bala para matar lobisomem…

------------------------------------------------------------------------

### Metodologia ágil não te deixa mais ágil

#### E o povo continua inventando bala para matar lobisomem…

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*qjpIpvJVMFGRo3arXtxFRQ.jpeg" class="graf-image" />
</figure>Já há algum tempo que venho usando metodologias ágeis para
desenvolvimento de software. Comecei usando uma variação do XP e hoje
uso uma variação do Scrum. Sim, há ganho de produtividade. Porém, não é
o Santo Graal nem a bala de prata que vendem por aí. E é bom
demistificar isso pois tem muita gente acreditando que dá para fazer um
bebê em quatro meses e meio usando duas mães.

Sim, as metodologias ágeis tem valor. Tanto é assim que adoto as
metodologias e estou sempre adequando o meu trabalho de acordo com as
minhas necessidades. Porém, como tudo no mundo, há um ponto onde a coisa
emperra. E é importante entender que ponto é este para que se possa
mitigar e, efetivamente, resolver os travamentos que podem ocorrer no
seu processo produtivo.

Então onde diabos a coisa trava? Vamos começar o passeio pelas
linguagens de programação. Hoje em dia o paradigma mais aceito e mais
usado é a programação orientada ao objeto. Há alguma coisa de
programação funcional, mas é uma disciplina ainda muito nova e que a
grande maioria não faz a menor ideia de como isso funciona.

Bem, as linguagens mais comuns no mercado são o C\#, Python, Java, Swift
para quem mexe com a Apple, Ruby e por aí vai. O que essas linguagens
têm em comum? A mesma deficiência: são orientadas ao objeto. Por que
isso é uma deficiência? Vamos voltar no tempo para entender.

O conceito de programação orientada ao objeto surgiu no fim da década de
1950, no MIT, como parte dos grupos de estudo de inteligência
artificial. Ou seja, o paradigma não é absolutamente novo. Quando
surgiu, a metodologia de desenvolvimento em nascimento era a famosa
waterfall, o famigerado método cascata. Este modelo, que hoje é
condenado, parte da suposição que você tem toda a informação antes de
sair programando.

Com a POO a coisa não é diferente. Se você for programar de maneira
clássica usando uma linguagem orientada ao objeto, você acaba no modelo
cascata: você modela todas as classes e interações entre elas antes de
escrever a primeira linha de código.

O fato é que o modelo de dados sempre é descrito como um grafo não
orientado de classes. E seu sistema dependerá deste modelo para o resto
da vida. Mudou o modelo, é preciso mudar o grafo e todas as interações
que mudam o seu estado. Ou seja, o modelo é praticamente estático.
Porém, a metodologia ágil parte da suposição que o modelo é dinâmico,
pois é assim que os negócios funcionam hoje em dia: a dinâmica é a
palavra de ordem do dia.

Isto significa dizer que a agilidade está, na verdade, ligada à
capacidade de mutação da sua base de código. Para que o seu projeto
tenha qualidade, adições e subtrações de funcionalidades não podem
adicionar instabilidades significativas no seu sistema. E sabemos que
isto não é verdade: toda nova feature leva a uma miríade de bug fixes.
Bugs novos, bugs antigos que passaram a ser exercitados e limitações dos
sistemas que terminam por ficar expostas e que precisam ser resolvidas.

A agilidade no desenvolvimento de um sistema, portanto, poderia ser
interpretada na facilidade na absorção de mudanças de tal forma que o
sistema possa seguir com o mínimo possível de instabilidade. Ou seja, é
preciso que o sistema seja projetado para ser mudado com bastante
frequência e que as mudanças, por mais drásticas que sejam, nunca causem
grande instabilidade na base de código.

Porém, em um mundo dinâmico ainda usamos paradigmas estáticos. A POO e o
modelo relacional são dois exemplos de modelos estáticos cuja mudança
pode significar um investimento de montante elevado. Assim, é preciso
entender a limitação das tecnologias adotadas e tentar projetar o
software de forma a tornar o desenvolvimento menos sensível às mudanças.

#### Desacoplamento

Faz-se mister o desacoplamento entre as funcionalidades do sistema.
Quanto mais desacoplado for o sistema, menor a possibilidade de um bug
em um sub-sistema afetar outro sub-sistema de forma a instabilizar o
sistema como um todo.

Infelizmente a grande maioria dos sistemas são escritos com altíssimo
grau de acoplamento, fazendo com que mudanças pequenas precisem ser
alastradas por diversos pontos do sistema para que sejam efetivas.
Quanto maior o acomplamento, maior a probabilidade de problemas que
podem ocorrer durante o desenvolvimento de novas características.

#### Componentização

Componentização rima com desacoplamento. Ao desacoplar seu sistema é
importante criar componentes de software que sejam, de preferência,
reutilizáveis. Isto isola problemas potenciais. Os problemas, quando
ocorrerem, acabam por se localizar em determinados componentes, ao invés
de criar uma linha de processamento errático difícil de rastrear quando
o sistema é muito acoplado.

Note que nada do que estou falando aqui é novidade. Isso tudo é
velharia. No entanto, as pessoas continuam a incorrer no engano de usar
uma metodologia ágil sem, antes, pensar coercitivamente em como projetar
o seu software para que ele se torne adequado ao desenvolvimento ágil.

#### Efeitos

Quais os efeitos que ocorrem quando se usa métodos ágeis para uma base
de código que não é tão ágil assim? Para cada feature implementada, você
verá uma quantidade grande de defeitos introduzidos. Assim você sempre
termina com uma sprint para fazer uma feature e duas para resolver os
defeitos que a sprint da feature criou.

Em termos econômicos você está, na realidade, perdendo dinheiro. Por
mais técnico que você seja dentro da sua empresa, é importante ter em
mente que seu papel é fazer a empresa gerar receita. Sem receita, seu
salário não é pago. E se a receita é comida pelas despesas, seu salário
também não será pago. E, o que é pior, você pode ter seu cargo terminado
pela escassez de receita.

#### Consciência

É importante que você tenha consciência de que a metodologia ágil não
mata lobisomem nem é o Santo Graal. Como toda metodologia, é preciso
adotá-la com critério, realizando as adaptações necessárias de acordo
com o modelo cultural da sua empresa. Simplesmente adotar sem ajustes é
como correr na direção do penhasco sem freios: vai dar merda.

Além disso, é preciso avaliar sua base de código e a estrutura
arquitetônica da sua aplicação. Ela pode não ser preparada para absorver
mudanças com velocidade e isto precisa ser levado em conta quando você
estabelecer a sua metodologia de desenvolvimento de software.

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [September 30, 2016](https://medium.com/p/5e02aa02a86).

<a href="https://medium.com/@ronaldolima/metodologia-%C3%A1gil-n%C3%A3o-te-deixa-mais-%C3%A1gil-5e02aa02a86" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
