O seu código não é tão bom assim
================================

Um artigo sobre a arrogância do programador e o efeito de escrever
rotinas próprias ao ignorar o seu framework.

------------------------------------------------------------------------

### O seu código não é tão bom assim

#### Um artigo sobre a arrogância do programador e o efeito de escrever rotinas próprias ao ignorar o seu framework.

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*hNb-Bcd0AS_EC5fbgGrfBw.gif" class="graf-image" />
</figure>Por mais que você tenha prática em programar, ou seja
experiente, seu código sempre depende do momento. A qualidade do que
você escreve é altamente variável e sempre seu código quebra. Se não
quebrasse, você não precisaria testar, não é mesmo?

> Este é um fato que todo programador sabe: ninguém escreve código
> perfeito. Todo mundo introduz bugs no código que escreve.

Nem sempre um bug é falta de atenção. Às vezes é fruto do cansaço, ou de
um requisito mal compreendido ou mal escrito. Apesar disso, há
programadores que insistem em achar que o código que escrevem é melhor
do que uma funcionalidade oferecida por um framework.

Já há algum tempo que venho programando no .NET Framework e há uma série
de funcionalidades prontas, como a validação de modelos de dados através
de decoração de classes (a Microsoft chama a decoração de classes de
*atributos*). Ao analisar um código pronto, que faz a validação dos
dados de um *form*, vi uma rotina enorme de validação, escrita à mão.
Quem escreveu a rotina ignorou a mesma funcionalidade que existe no
framework e escreveu a sua própria rotina, demonstrando arrogância ao
achar que o código que escreveu é melhor do que o mesmo código do
framework.

Por que o seu código dificilmente será melhor que o código escrito em um
framework? A resposta está em *maturidade*. O código criado no framework
que você usa foi testado, virado do avesso, posto em produção nos mais
diversos cenários e sofreu uma quantidade absurda de bug fixes ao longo
dos anos, principalmente se o framework que você está usando vem de um
grande vendor e já está no mercado há muito tempo.

> Por mais que você tenha cuidado, o seu código é novo e, portanto, não
> foi suficientemente testado.

E mesmo que você o teste à exaustão, certamente não cobrirá a mesma
quantidade de cenários contra os quais o framework que você usa foi
testado.

Outro exemplo foi no iOS: um programador escreveu toda uma rotina de
ordenação de vetores, porém ignorou que o framework da Apple já tinha
isso pronto *right out-of-the-box*. A rotina escrita pela Apple não só é
mais eficiente como também é bem mais estável. E não é por que a Apple é
foda, mas por que a rotina do framework já passou por tanta iteração de
desenvolvimento que amadureceu ao longo dos anos.

Outro fator importante é a preguiça: muitos programadores têm preguiça
de ler a documentação do framework. Acreditam que estão perdendo tempo
ao fazer isso. Pelo contrário, estão ganhando tempo pois usarão rotinas
estáveis e eficientes ao invés de escrever novamente uma rotina que faz
a mesma coisa e que será instável, ineficiente e cheia de problemas,
sendo a falta de generalidade e reutilização apenas um deles.

Eu tenho visto este tipo de arrogância há anos, na verdade. Eu já vi
programadores C extremamente experientes escreverem sua própria versão
do *malloc*, ou sua própria versão do *qsort*, por que achavam que
seriam capazes de criar algo mais eficiente ao invés de focar na
resolução do problema de negócio que deviam automatizar. Esse pensamento
faz sentido se você está escrevendo uma biblioteca de sistema, o que
hoje é algo quase impensável na programação comercial, a não ser que
você esteja criando seu próprio compilador, linguagem de programação ou
sistema operacional. Isso é extremamente raro.

> Essa arrogância leva a erros complexos nos sistemas devido à
> introdução de rotinas primitivas instáveis e não testadas de forma
> suficiente.

Só faz sentido reescrever uma rotina primitiva se, e somente se, você
encontrou algum bug grave que demora demais para o vendor consertar. Na
minha humilde opinião, é mais fácil um meteorito acertar o capô do seu
carro. Isso é extremamente raro pois, como eu disse, as rotinas das
bibliotecas e frameworks que estão há muito tempo no mercado já foram
amplamente testados e depurados.

Concluindo, procure sempre estudar o framework que você usa. Por mais
que você programe nele há anos, sempre há algo novo para aprender, pois
os frameworks estão sempre evoluindo e adicionando coisas novas todos os
anos. Desde que comecei a usar frameworks tenho como prática sempre
procurar na documentação por funcionalidades que estou para escrever.
Até hoje tenho encontrado, quase sempre, alguma rotina já pronta que faz
o que eu preciso. O resultado é código mais enxuto e com menos bugs pois
só terá os bugs que eu introduzi. Se escrevi menos código então
introduzi menos bugs, concorda?

Quanto a ficar dependente do framework, uma má notícia: você já está
dependente. Ao usar uma única rotina que seja, o framework já passa a
ser parte integrante da sua aplicação. Assim, abrace a dependência e
seja feliz.

Happy Coding!

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [February 11, 2016](https://medium.com/p/34fcb0616053).

<a href="https://medium.com/@ronaldolima/o-seu-c%C3%B3digo-n%C3%A3o-%C3%A9-t%C3%A3o-bom-assim-34fcb0616053" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
