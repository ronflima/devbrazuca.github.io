Escreva código pedestre
=======================

E durma mais, viva mais e seja mais feliz.

------------------------------------------------------------------------

### Escreva código pedestre

#### E durma mais, viva mais e seja mais feliz.

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*Teu2Tiy6TRmqyFeZtJDhJQ.jpeg" alt="Ser pedestre é uma coisa boa." class="graf-image" /><figcaption>Ser pedestre é uma coisa boa.</figcaption>
</figure>Eu, enquanto programador, tenho a péssima tendência de escrever
código sofisticado. Acredito que não sou um caso isolado. Provavelmente
você, programador, também sofre deste mesmo mal. A verdade é que
gostamos do que fazemos e queremos que o nosso código não seja apenas um
código qualquer: precisa ser **o** código. Com isso, abrimos mão da
simplicidade e deixamos o código mais complexo por que tentamos
generalizar demais aquela peça de software no intuito de reaproveitá-la
em outros contextos.

O resultado é inegavelmente o mesmo: você termina com um código difícil
de manter, dando dor-de-cabeça e ultrapassando o limite orçamentário e
temporal do seu projeto. Tudo por que você quis fazer código
sofisticado. Não, não estou te julgando. Eu mesmo já fiz isso
incontáveis vezes, inclusive muito recentemente.

#### Não é Concurso de Código

A menos que você esteja participando de um concurso de quem escreve o
melhor código, o seu dia-a-dia não é um concurso. No fim do dia o seu
código precisa funcionar de acordo com a especificação, sendo um código
feio ou não. E quando digo funcionar quero dizer: sem detonar seu
software. Ou seja, com a menor quantidade possível de bugs.

Qualidade de código não é o quanto bonito seu código está, mas o quanto
aderente ele está com relação às especificações que você recebeu. Eu já
cansei de ver código incrivelmente feio mas que estava não só aderente à
especificação como executava sem falhas. Talvez fosse necessário um
refactoring para otimizar o uso de recursos e melhorar a
manutenabilidade do código. Porém, o código não precisa ficar bonito de
primeira: ele precisa funcionar.

#### Trabalhe Iterativo

O que fazemos é **desenvolvimento**. Se você não tem vergonha da
primeira versão do seu software, você definitivamente fez alguma coisa
errada. Imagine que seu projeto é uma sementinha. Ao longo do tempo,
essa sementinha cresce, cria raízes, caules, folhas, flores, até se
tornar uma árvore frondosa. No entanto, o **processo** de crescimento
pode levar a uma muda feia, esquisita, mas que faz o que deveria fazer.

Assim é com o software: a cada iteração do seu desenvolvimento, seu
código fica melhor. Algumas partes ficam feias pois acabaram de ser
escritas, outras ficam bonitas por que você fez refactoring. O bacana de
entender isto como um processo evolutivo é que você começa a perceber
que não precisa escrever o melhor código na largada, mas o código
suficientemente bom para resolver o problema proposto.

À medida em que o tempo avança, e seu conhecimento sobre a matéria que
está sendo automatizada aumenta, o seu código evolui e melhora. Tentar
sair generalizando tudo de início vai criar código extremamente complexo
pois você poderá generalizar aquilo que é específico do projeto levando
a um código desnecessariamente complexo.

#### Com Grande Flexibilidade Vem Grande Complexidade

Quanto mais flexível é o seu software mais complexo ele é. A menos que a
especificação do seu projeto exija flexibilidade, é importante tornar o
seu código o mais inflexível possível. Isso aumenta sua simplicidade e
torna-o muito mais fácil de manter.

Por mais que você discorde disto que acabei de dizer, você perceberá,
com o tempo, o quanto as partes flexíveis em um software comercial são
raras. Normalmente as especificações são tão focadas que dificilmente um
software flexível será criado para atendê-las. Isto faz com que a
criação de software extremamente flexível seja uma ave rara ao invés de
um padrão de mercado.

Escrever software com características limitadas não é ruim. Na verdade,
é algo que vem tornando-se padrão de mercado. Quem nunca ouviu falar em
**menos é mais**? Empresas como a
<a href="http://37signals.com" class="markup--anchor markup--p-anchor">37 Signals</a>
criaram soluções que são altamente limitadas em termos de *features*. O
resultado? São ferramentas incrivelmente estáveis e poderosas.

Mesmo aquilo que pode ser generalizado no seu software tende a ter
flexibilidade limitada pois resolve uma classe muito específica de
problemas.

#### Não Invente Moda

Eu costumo falar isso para os meus colegas desenvolvedores: não invente
moda. Seja simples. Se a sua linguagem de programação não tem uma
determinada feature, não force a barra tentando implementar algo que
simule. Por exemplo, C não tem suporte a exceções. Portanto, tentar
criar um esquema de tratamento de exceções em C é uma forma simples de
tornar o seu código ilegível, desestruturado e fadado a erros
(tratamento de exceções em C normalmente leva ao uso de *goto*, o que
torna o seu código um pesadelo).

Qualquer coisa que você for escrever, o faça da forma mais simples
possível e imaginável. Deixe para que as próximas iterações do
desenvolvimento adicionem sofisticação. O código precisa nascer simples.
Sempre. Se você parte de um código sofisticado na largada o resultado
será:

-   <span id="f2a6">você gastará mais tempo para implementar o que
    precisa ser feito</span>
-   <span id="a1aa">você terá várias dores-de-cabeça para estabilizar
    seu código</span>
-   <span id="dcda">testar seu código será algo semelhante a tentar
    mover uma montanha com a força do pensamento. Provavelmente você
    terminará fazendo força demais a ponto de se cagar.</span>
-   <span id="ab5b">você vai ficar sem dormir</span>
-   <span id="8a8f">você se tornará cliente de algum delivery de trash
    food, pois é o que se come quando os projetos atrasam.</span>

#### Não Faça Gambiarra

Antes de encerrar o assunto, algo que vale a pena mencionar: não faça
gambiarra. Fazer as coisas com simplicidade é diferente de fazer
gambiarra no código. Gambiarra sempre termina mal. Toda gambiarra é
sensível a alterações ambientais e tende a ser o ponto onde seu código
ou será invadido por um hacker ou quebrará miseravelmente.

A gambiarra é uma ferramenta do desenvolvedor, no entanto. Como toda
ferramenta, é preciso saber quando usá-la. O cenário mais comum no qual
eu, Ronaldo, fiz gambiarra foi este: a produção parou, precisa-se de um
patch com urgência e já há advogado escrevendo petição para botar a
empresa no pau. Contingência: fazer uma gambiarra para resolver
imediatamente o problema e colocar a produção de volta com um hot fix e
depois, com calma, avaliar o problema e resolvê-lo de forma correta.

Note: gambiarra é uma forma de contingenciamento. Quando você está
trabalhando sob pressão e tem pouco tempo para resolver um problema de
produção, a gambiarra, às vezes, é a melhor solução de curto prazo.
Neste cenário é preciso ganhar tempo para fazer uma correção decente no
código. Note: a gambiarra é meramente temporária.

Enfiar uma gambiarra no seu código de forma permanente é pedir para dar
merda. É importante que você durma, tenha vida social, tenha tempo de
brincar e se divertir. E largar uma gambiarra no seu código coloca tudo
isso em xeque: você vai esquecer onde gambiarrou, a produção vai cair e
lá se vão horas e horas tentando descobrir que raios aconteceu no seu
código.

#### Desenvolva o Código

Para fechar a discussão, uma listinha de dicas para evitar que você
perca horas preciosas de sono:

-   <span id="29c1">comece simples</span>
-   <span id="02f9">não faça gambiarras</span>
-   <span id="081f">refatore depois de pronto se for necessário e
    possível</span>
-   <span id="b865">não invente moda</span>
-   <span id="07af">se for possível, generalize. Porém, só generalize se
    isto for uma vantagem. Se não for, foda-se.</span>
-   <span id="9309">seja sempre objetivo ao escrever seu código</span>
-   <span id="2a3b">faça o código evoluir com o andamento do projeto.
    Não tente evoluí-lo logo nas primeiras iterações.</span>

Feliz Codificação!

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [August 7, 2017](https://medium.com/p/169ad583550).

<a href="https://medium.com/@ronaldolima/escreva-c%C3%B3digo-pedestre-169ad583550" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
