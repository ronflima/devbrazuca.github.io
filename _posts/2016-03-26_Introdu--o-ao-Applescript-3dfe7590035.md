Introdução ao Applescript
=========================

Automatize seu Mac OS X. Seja mais produtivo!

------------------------------------------------------------------------

### Introdução ao Applescript

#### Automatize seu Mac OS X. Seja mais produtivo!

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*Ly3oN665xRg6vcnn24t1wg.png" class="graf-image" />
</figure>Eu já venho puxando o saco do Applescript já tem algum tempo e
já é hora de escrever um artigo apresentando a linguagem com exemplos
práticos, não é mesmo? Eu acho a linguagem divertida, apesar de ser uma
avalanche de palavras. O código-fonte final fica parecendo uma epopéia
de tão comprido. Sim, você escreve código prá cacete em Applescript.

Vamos começar com alguns exemplos simples. Antes de começar, você
precisa localizar no seu Mac o *Editor de Scripts.* Normalmente ele está
em Aplicativos/Utilitários (destacado em vermelho na imagem abaixo).

Para estes exemplos, estou usando o Mac OS X El Capitán. Porém, o que eu
descrevo aqui serve para versões anteriores do Mac OS X. O editor de
scripts já vem pre-instalado no seu Mac OS X e não há necessidade de
instalar absolutamente nenhum software adicional.

<figure>
<img src="https://cdn-images-1.medium.com/max/600/1*IfMQWlVaMHXFVQZ9v6VVxw.png" alt="Editor de Scripts no Mac OS X El Capitan" class="graf-image" /><figcaption>Editor de Scripts no Mac OS X El Capitan</figcaption>
</figure>Com o editor de scripts aberto, você pode optar por criar um
script em javascript ou applescript. Por padrão, o editor já inicia-se
pronto para editar applescript.

Bem, vamos adiante. O applescript é uma linguagem orientada ao objeto.
Isso não ficará evidente nos exemplos, mas à medida em que os artigos
forem saindo, prometo que volto neste assunto.

Com o editor aberto, digite o código abaixo:

Este é um exemplo praticamente inútil. Ligue o áudio do seu computador e
tecle ⌘R. Isso executará o seu script. Isso fará com que o seu Mac fale
com você.

Vamos fazer algo mais útil. Vamos fazer o seu Mac lhe saudar dependendo
da hora do dia:

Este exemplo demonstra algumas coisas importantes:

-   <span id="104c">Como criar variáveis e usá-las</span>
-   <span id="bc77">Como criar expressões lógicas</span>
-   <span id="1bdf">Como criar decisões</span>

A instrução *set/to* é usada para declarar uma variável, atribuindo-lhe
um valor. Como já é possível perceber, Applescript é uma linguagem com
tipagem dinâmica, ou seja, os tipos das variáveis são determinados pelos
valores armazenados nas mesmas.

Outra coisa interessante são as expressões lógicas. São literais! Sim, é
possível usar símbolos com &gt;, &lt;, = como nas linguagens
tradicionais. Porém, queria demonstrar que é possível escrever estas
expressões de forma literal. Note que escrever scripts em Applescript é
quase uma conversa com o computador.

A instrução *current date* retorna um objeto que representa a data e
hora atuais da máquina. Observe como obtive a hora corrente, armazenada
na variável *currTime: hours of now*. Esta é uma das formas de acessar
uma propriedade em um objeto qualquer. Outra forma é usando algo mais
interessante: *now's hours*. Experimente! Edite o programa e troque a
instrução.

Vamos melhorar nosso exemplo: agora quero que a coisa fique mais
pessoal, ou seja, quero que o computador saude-me pelo primeiro nome:

A estrutura do programa é a mesma. O que mudou foi que obtivemos o nome
*curto* do usuário corrente do sistema e o concatenamos à saudação.
Observe que a concatenação se parece muito com a do Visual Basic, na
qual usamos o caractere *ampersand* (&).

A propriedade *short user name* pertence ao objeto retornado por *system
info*. Observe que foi necessário usar parênteses a *system info* para
que a referência fosse corretamente compreendida pelo Applescript.

Bem, isso já é o suficiente por enquanto — senão vou escrever um livro
aqui no blog. O Applescript está muito bem documentado no
<a href="https://developer.apple.com/library/mac/documentation/AppleScript/Conceptual/AppleScriptLangGuide/introduction/ASLR_intro.html#//apple_ref/doc/uid/TP40000983-CH208-SW1" class="markup--anchor markup--p-anchor">site de documentação para developers da apple</a>.
Infelizmente, a documentação está escrita exclusivamente em inglês.

*Happy scripting!*

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [March 26, 2016](https://medium.com/p/3dfe7590035).

<a href="https://medium.com/@ronaldolima/introdu%C3%A7%C3%A3o-ao-applescript-3dfe7590035" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
