Threads e iOS
=============

A importância de conhecer o sistema no qual você programa.

------------------------------------------------------------------------

### Threads e iOS

#### A importância de conhecer o sistema no qual você programa.

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*XQN6E3sj3JkB-6ORRSV9-A.jpeg" class="graf-image" />
</figure>Programar em ambientes multi-threaded não é uma tarefa fácil.
As threads adicionam elementos de incerteza no seu código que podem
levar a problemas muito difíceis de serem reproduzidos *in vitro*, ou a
problemas intermitentes. Porém, se você programa para iOS, não importa
se em Objective C ou em Swift, as threads vão bater na sua porta, cedo
ou tarde.

No dia-a-dia você usa somente uma thread: a *main thread*. Nela você
responde a eventos, desenha a tela, carrega tabelas, e por aí vai. Se
você precisa realizar algum processamento mais custoso usando a main
thread você dá de presente ao seu usuário uma tela que não responde aos
seus comandos e a sua aplicação fica com aquela cara enfadonha de
"travei".

É importante conhecer a estrutura do sistema operacional que você usa
para que possa tirar proveito dessa estrutura. As threads são caras e
complexas. Você pode criá-las ou usar a infra-estrutura do Cocoa para
isso através do Grand Central Dispatch ou das Operation Queues.

#### Grand Central Dispatch

O Grand Central Dispatch apareceu no Mac OS X 10.6. Trata-se de uma
infra-estrutura que permite a programação concorrente sem que você
precise preocupar-se com os detalhes das threads. Como o iOS veio do Mac
OS X, inclusive usando o mesmo kernel Darwin, o GCD apareceu neste
ambiente também.

O GCD foi criado para dar suporte a programas escritos em C. Isto fica
evidente na forma como funciona: funções trabalhando em cima de
estruturas de dados opacas. Muita gente usa o GCD em programas escritos
em Objective C, talvez por desconhecerem as Operation Queues.

Porém, o GCD é muito mais simples de usar do que as POSIX Threads, que
exigem um trabalho mais pesado de gerenciamento de recursos. É possível
usar o GCD tanto do Objective C quanto do Swift.

#### Operation Queues

As operation queues são construídas por sobre o GCD e oferecem uma
interface orientada ao objeto para as dispatch queues. A Apple,
inclusive, sugere que sejam usadas em lugar das dispatch queues
justamente por oferecerem mais suporte à linguagem Objective C e Swift.
Por exemplo, você pode criar uma NSBlockOperation, ou seja, uma operação
baseada em blocos para que você não precise criar uma subclasse de uma
NSOperation para executar uma tarefa em background.

Apesar de vários exemplos da Apple usarem as dispatch queues, eu sempre
dou preferência às operation queues pelas facilidades de integração com
o Objective C e com o Swift.

#### Por que threads?

O objetivo do seu app é manter-se respondendo ao usuário. Executar
tarefas longas na main thread tira esta capacidade de resposta, pois o
sistema passará muito tempo executando seu código ao invés de responder
de forma hábil ao usuário.

Porém, as threads têm um preço. As threads adicionam problemas
relacionados ao tempo no seu software, criam problemas com invariantes e
podem levar a defeitos muito difíceis de serem reproduzidos em
laboratório. Além disso, você precisa projetar seu software para
trabalhar de forma assíncrona, distribuindo o processamento e tomando o
cuidado de evitar a quebra e corrupção de dados por acessos simultâneos.

Programar em threads não é, definitivamente, algo simples. Muita gente
super simplifica isso criando inúmeros pontos de sincronismo e,
efetivamente, criando código síncrono complexo ao invés de deixar o
"bicho solto". Se você escreve código abarrotado de pontos de
sincronismo é por que você não precisa de threads realmente.

A criação de uma thread, também, não é gratuita. Ela consome recursos do
sistema, como processador e memória. Em um ambiente restrito, como um
iDevice, estes são recursos caros. Portanto, ao criar um ambiente
baseado em threads, é importante ter certeza absoluta que isto será
necessário para justificar o consumo de recursos.

#### Aprenda os conceitos!

Existe muita literatura sobre o assunto. Não saia simplesmente
programando em threads só por que conhece o SDK. Saiba exatamente o que
está fazendo. Saiba quais são os seus invariantes, quais trechos de
código são seções críticas e como lidar com elas.

É importante conhecer os métodos de sincronismo, como os mutexes, as
barreiras, as condition variables. Cada coisa dessas tem uma função
diferente e serve para um determinado cenário que depende do design que
você fizer do seu código.

A minha sugestão: leia o livro
<a href="https://www.amazon.com.br/Programming-POSIX-Threads-David-Butenhof-ebook/dp/B006QTHCJ6/ref=sr_1_1?ie=UTF8&amp;qid=1465048349&amp;sr=8-1&amp;keywords=posix+threads" class="markup--anchor markup--p-anchor">Programming with POSIX Threads</a>,
de David Butenhof. É um livro antigo, mas excelente e ainda atual. O
importante do livro não são as threads POSIX em si, mas os conceitos que
envolvem as mesmas.

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [June 4, 2016](https://medium.com/p/3e1cbe9fe1a).

<a href="https://medium.com/@ronaldolima/threads-e-ios-3e1cbe9fe1a" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
