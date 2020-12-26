Storyboards: aprenda a usá-los
==============================

Use-os, ou depois fique reclamando da Apple.

------------------------------------------------------------------------

### Storyboards: aprenda a usá-los

#### Use-os, ou depois fique reclamando da Apple.

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*RNaLWPGwvYuF-8fF-YZLMQ.png" class="graf-image" />
</figure>Os storyboards foram introduzidos juntamente com o iOS 5.
Antes, era necessário fazer toda a navegação e carregar as views em
código. Por que os storyboards são uma boa coisa? Eles demonstram
visualmente o fluxo de navegação e a estrutura visual do seu aplicativo,
coisa que era bem difícil antes deles. Além disso, os storyboards são
mais eficientes e diminuem a quantidade de código que você precisa
escrever, fazendo-o ganhar tempo. Aqui vão algumas dicas de como tirar
bastante proveito desta tecnologia, que hoje está disponível em todas as
plataformas Apple.

#### Confie no framework

É muito comum ver developers escrevendo sua própria solução de navegação
ou afirmar que os storyboards atrapalham. A verdade é que os storyboards
economizam código. E muito. Tudo fica a cargo do framework. E, cá entre
nós, é arrogância achar que você consegue escrever código melhor que o
do framework e por uma questão simples: conhecimento. 

Os frameworks da Apple usados hoje começaram a ser construídos na Next,
na década de 1990. O prefixo NS, ainda muito comum em algumas classes,
refere-se ao sistema da Next, o Next Step. Isso quer dizer que o
framework vem passando por iterações há anos, o que significa que vem
acumulando conhecimento ao longo de muito tempo. Além do conhecimento, o
framework já passou por tantas iterações de desenvolvimento que é
absolutamente estável, mesmo contendo um ou outro bug. 

Sim, existem bugs no framework. Mas encontrá-los é difícil e ocorrem em
situações relativamente raras. Isto se deve ao grau de maturidade desta
base de código. Portanto, confie no framework. Use-o a seu favor e, o
principal, entenda como ele funciona.

Mesmo features novas acrescentadas aos frameworks são construídas por
sobre uma base muito sólida. 

#### Segues: evite escrever código

Os segues são fantásticos e evita-se escrever muito código com eles. Uma
coisa bacana é a preparação dos view controllers através de chamadas a
*prepare(for segue:)*. Este método mágico permite que você prepare o
próximo view controller a ser chamado, evitando-se, com isto, criar
estruturas globais acessadas através de um pattern como o Singleton.

É um erro comum criar singletons para compartilhar estados em um app. O
fato é que o seu app já tem um singleton muito interessante: o app
delegate. A partir dele você pode
<a href="https://ronaldolima.eti.br/ios-injeção-de-dependências-em-view-controllers-ed657855d48f#.5x2bkvsr2" class="markup--anchor markup--p-anchor">injetar dependências</a>
nos view controllers, diminuindo o acoplamento de toda a sua aplicação.

  

  

[View original.](https://medium.com/p/e3ff1dcf38a9)

Exported from [Medium](https://medium.com) on December 25, 2020.
