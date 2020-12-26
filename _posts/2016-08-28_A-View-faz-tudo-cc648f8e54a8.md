A View faz-tudo
===============

Mais um conto de terror do mundo da programação…

------------------------------------------------------------------------

### A View faz-tudo

#### Mais um conto de terror do mundo da programação…

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*CnE2QbHmP2R8iFkQgFrE6Q.png" class="graf-image" />
</figure>Muita gente fala sobre as maravilhas do MVC mas pouca gente, na
realidade, sabe como programar neste modelo. Não é absolutamente incomum
encontrar código que desrespeita abertamente os conceitos do MVC, mesmo
em um ambiente totalmente focado nisso. Por exemplo, o UIKit do Cocoa
Touch foi construído tendo como base o MVC. Portanto, é impossível
programar no Cocoa Touch senão usando MVC.

O problema é que vários programadores querem generalizar seu código e
acabam infringindo este modelo de programação de formas incrivelmente
estúpidas. O melhor exemplo que eu tenho no momento é o da view
faz-tudo, que encontrei no código de um cliente. A view não se limita a
mostrar informações ao usuário. Ela também executa atividades, por
exemplo, coleta uma foto do usuário e a usa para criar um perfil.

Pelo modelo MVC, qualquer estímulo que a view receber precisa ser,
necessariamente, encaminhado ao controller para que este possa decidir o
que fazer. Infelizmente não há como impedir que você escreva uma view
sacola, que realize operações como se fosse um controller. Esta é,
infelizmente, uma fonte infindável de problemas.

O que normalmente acontece é que é dado mais do que comportamento visual
às views e é aqui que o problema acontece: muitas vezes operações
necessitam acesso a objetos que estão presentes apenas no controller e
fazer estes objetos presentes na view cria um acoplamento desnecessário,
e perigoso, no código.

Assim, se você programa usando MVC, não importa a linguagem ou
tecnologia, tente nunca desrespeitar o princípio. As views mostram
informações e recebem estímulos. Os estímulos precisam, necessariamente,
ser interpretados e manipulados pelo controller que altera o estado do
modelo adequadamente. Tentar inventar moda e criar atalhos nisso viola
os princípios do MVC e criam problemas de acoplamento e dependência no
código que não deveriam existir.

A ideia do MVC é justamente criar independência entre os componentes.
Assim deveria ser possível trocar cada um dos componentes sem a
necessidade de reescrever código. Porém, se você cria acoplamentos
desnecessários, tudo o que o MVC traz de benefício desce por água
abaixo.

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [August 28, 2016](https://medium.com/p/cc648f8e54a8).

<a href="https://medium.com/@ronaldolima/a-view-faz-tudo-cc648f8e54a8" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
