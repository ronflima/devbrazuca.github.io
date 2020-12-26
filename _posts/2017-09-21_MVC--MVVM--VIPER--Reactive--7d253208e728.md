MVC, MVVM, VIPER, Reactive?
===========================

Qual arquitetura usar no iOS?

------------------------------------------------------------------------

### MVC, MVVM, VIPER, Reactive?

#### Qual arquitetura usar no iOS?

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*NbQl1WHxPaqNeMivhrMB-g.jpeg" class="graf-image" />
</figure>Depois que a programação para apps popularizou-se, várias
arquiteturas novas surgiram para tentar simplificar as coisas. MVVM,
VIPER e mais um monte de sopa de letrinhas hoje assombram os developers,
principalmente os que trabalham com iOS.

Não existe arquitetura ótima. Existe aquela que é a melhor para resolver
determinada classe de problemas. Porém, no caso dos frameworks da Apple,
não importa qual arquitetura você escolha: tudo termina em MVC,
independentemente se você usa MVVM, VIPER, *whatsoever*. Por que?

#### Camada sobre camada

Apesar de toda a liberdade que é dada para o programador dentro da
plataforma Apple, no fim das contas o seu software ficará como o
diagrama abaixo:

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*XE8RnO_EKhpajGDXqDgn1w.png" class="graf-image" />
</figure>Por que disso? Não importa qual arquitetura você use. Você será
obrigado a usar alguma classe que herde de *UIViewController*. Também
será obrigado a usar alguma classe que herde de *UIView*. O fato é que
você se verá construindo uma camada por sobre o MVC que é imposto pela
Apple. Não importa qual *arquitetura* você escolha.

#### MVC não é uma bala de prata

MVC não resolve todos os problemas do universo. E eu não estou aqui
defendendo o seu uso. Nada disso. A verdade é que estou alertando para
um fato simples: não importa qual arquitetura você escolha para
desenvolver seu app, você sempre será dependente do MVC por imposição do
framework da Apple, em maior ou menor grau.

Isto não quer dizer que você deva usar apenas MVC para escrever seu
código, mas que precisa saber que está criando uma camada de código
extra por sobre outra arquitetura da qual você não conseguirá se
desvencilhar.

Existe uma coisa chamada *propósito*. Os componentes da Apple foram
criados com o propósito de serem utilizados em uma arquitetura MVC. Ao
ter consciência disto, você está livre para usar outra arquitetura
respeitando-se as limitações impostas pelos componentes dos quais você
depende para escrever seu código.

#### Não caia na modinha

Eu vivo dizendo: programar profissionalmente é uma atividade econômica.
Portanto, não invente moda nem saia fazendo as coisas por que está na
moda fazer desse jeito. A decisão de usar outra arquitetura no seu
software precisa ser tecnicamente embasada, com vantagens evidentes.
Estas vantagens não podem ser apenas de teor técnico, mas também de teor
econômico.

De que adianta usar a arquitetura ultra-foda-mega-quebra-tudo se isso
vai onerar o *budget* do projeto? Use a arquitetura que lhe dê
vantagens. Se VIPER entrega mais rápido o que você precisa, use-a. Se
MVVM tem vantagens sobre a arquitetura MVC para determinado projeto,
use-a. O que não pode é usar uma arquitetura só por que o projeto vai
parecer bonito. Bonito é o projeto que é entregue no prazo e que gera
**lucro.**

#### KISS

*Keep It Simple, Stupid.* Esta é a melhor arquitetura do mundo. Seja lá
o que diabos você vai fazer, mantenha o mais simples e estúpido
possível. Não importa que raio de arquitetura você escolha para o seu
projeto. Use a mais simples que resolva o seu problema imediatamente,
com o menor esforço e a maior qualidade possível dentro dos parâmetros
do projeto.

A simplicidade leva a efeitos muito interessantes:

-   <span id="324c">os bugs são mais simples e mais fáceis de
    achar;</span>
-   <span id="446a">evoluir o projeto fica mais fácil e mais
    barato;</span>
-   <span id="10ba">treinar novos developers para dar manutenção na base
    de código fica mais fácil, mais simples e, o que é melhor, mais
    barato;</span>
-   <span id="0dc4">você terá noites de sono com mais qualidade.</span>

#### Antes de ir

É um tópico recorrente a questão econômica nos artigos que escrevo. Em
breve escreverei um artigo falando exatamente sobre a questão econômica
e por que isso é tão importante — e por que muitas vezes é uma questão
que se sobrepõe a qualquer outra questão técnica.

E vamos codificar por que precisamos pagar nossas contas!

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [September 21, 2017](https://medium.com/p/7d253208e728).

<a href="https://medium.com/@ronaldolima/mvc-mvvm-viper-reactive-7d253208e728" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
