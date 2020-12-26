Perdendo o medo de C
====================

A linguagem é bem mais simples do que parece.

------------------------------------------------------------------------

### Perdendo o medo de C

A linguagem é bem mais simples do que parece.

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*dVPIbOTyNcv6iwLmK8JWLA.png" class="graf-image" />
</figure>Ontem estive na excelente palestra de Mariana Mioto para o
Women Tech Makers em Ribeirão Preto e algo que ela disse na palestra
acendeu uma luzinha que eu precisava transformar em palavras — neste
caso, em um artigo. E este artigo tinha que ser sobre a linguagem C.

C é uma linguagem antiga. Nasceu em 1970 na Bell Labs. Veio sendo
padronizada ao longo dos anos e o último padrão da linguagem data de
2011. De todas as linguagens de programação, por que C é tão especial, e
por que é tão amaldiçoada?

Bem, antes de responder a estas questões, queria fazer uma pequena
apresentação. Este é um artigo de uma série sobre a linguagem C. A
intenção é tirar o trauma de quem foi maltratado pelo professor de
programação na faculdade e servir de base para que as pessoas aprendam a
linguagem de forma mais simples.

#### Por que C?

C é uma linguagem antiga mas não menos cheia de conceitos fantásticos.
Grande parte das linguagens de programação atuais se basearam na sintaxe
limpa e simples de C. Por que você deveria aprender C? A grande maioria
dos sistemas operacionais é escrita em C. Os intérpretes das principais
linguagens de programação são escritos em C. As grande maioria das
linguagens interpretadas pode ser ampliada com módulos escritos em C.
Para programar software embarcado, C é uma das melhores opções
justamente pelo seu pequeniníssimo *footprint*.

Eu poderia passar o texto todo discorrendo sobre o por que você deveria
aprender C. Ao invés disso, prefiro resumir em uma frase: aprender C te
dará uma excelente base para aprender qualquer outra linguagem de
programação.

Porém, é preciso tirar da cabeça a ideia de que C é difícil. Portanto, a
partir deste ponto, esqueça tudo o que aprendeu sobre C e vamos começar
de novo.

#### O compilador

Antes de irmos às vias de fato é preciso falar um pouco sobre como
funciona o processo de compilação de um programa escrito em C. Você pode
pensar: o que isso tem haver com a linguagem? A resposta é: tudo. Existe
um negócio chamado de *diretiva de compilação* que muda como o seu
programa será compilado. Esse negócio faz parte da linguagem. Assim, é
importante saber como o seu programa compila. Alguns conceitos vou
deixar um pouco no ar por enquanto para voltar mais tarde.

Para entender como a coisa funciona, vamos começar com o famoso *Hello
World:*

    #include <stdio.h>

    int main(void) {
        printf("Hello, World!\n");
        return 0;
    }

Vamos salvar isto num arquivo *hello.c*. Para gerar o executável
*hello*, considerando-se que estamos usando um compilador C no unix ou
linux, é preciso executar a seguinte linha de comando:

    gcc hello.c -o hello

Este comando vai fazer o seguinte:

A primeira coisa é o pré-processador. O pré-processador dá uma lida no
seu arquivo à procura de macros e diretivas. No nosso exemplo, o comando
de pré-processamento `#include` fará com que o pré-processador leia o
conteúdo do arquivo `stdio.h` e o pré-processe também, gerando uma
salada russa. Para ver o que o pré-processador gera, use a seguinte
linha de comando:

    gcc -E hello.c

Isso vai gerar uma saída monstruosa na sua tela. Essa confusão toda é
chamada de *unidade de tradução*. Depois de finalizado o
pré-processamento o próximo passo será a verificação sintática do seu
código.

Nesta fase, a sua unidade de tradução é verificada contra erros de
sintaxe. O compilador verificará se os tipos nas expressões são
adequados, se é possível realizar promoções ou demoções de tipos,
dependendo das expressões. Chamadas de função são computadas quanto aos
tipos dos parâmetros e por aí vai.

A próxima etapa é a *montagem*. A montagem consiste em converter a sua
unidade de tradução para linguagem de máquina criando-se, assim, o
*objeto relocável*. Normalmente o objeto relocável é um arquivo com
extensão *.o*. Este arquivo contém código de máquina, porém é preciso
ainda alguma coisa para termos o executável final: a resolução dos
símbolos pendentes.

A função *printf* não foi você quem escreveu. Ela faz parte da
biblioteca padrão da linguagem. O *protótipo* dela está no arquivo de
cabeçalho `stdio.h`. O protótipo é, basicamente, a *assinatura* da
função. Isto é usado para permitir a verificação de tipos dos parâmetros
e do retorno da função.

Bem, o problema que o compilador tem de resolver agora é: onde está o
código da função *printf*? Este processo é chamado de *ligação*, ou
seja, o compilador chamará o *ligador* que procurará nas bibliotecas
binárias onde está o código da função, trazendo este código para o seu
executável final. Normalmente a biblioteca de rotinas da linguagem C é
uma biblioteca dinâmica, ou seja, o seu executável não terá o código da
função *printf* enfiado dentro dele, mas uma referência à biblioteca
padrão da linguagem, que será carregada em memória quando seu executável
for chamado.

Bem, este é todo o processo da compilação, visto de maneira bem
simplificada. A ideia aqui é entender que é possível, do seu código,
enviar comandos ao compilador através de *diretivas de
pré-processamento*. Isto é particularmente útil quando se está criando
código multi-plataforma no intuito de isolar trechos específicos.

#### A estrutura de um programa

Bem, o nosso exemplinho dá uma imagem bem simplificada de como é um
programa escrito em C. Ali temos o seguinte:

-   <span id="3f3f">Todo programa em C tem como ponto de entrada uma
    função notável chamada *main*. Não importa onde você escreva a
    função *main*. Pode ser em qualquer arquivo que componha o seu
    programa. É ela quem vai executar primeiro.</span>
-   <span id="f0a8">Todo programa C pode ter uma ou mais diretivas
    *include*. Esta diretiva inclui arquivos na unidade de tradução.
    Aqui cabe um parêntesis: a diretiva *include* precisa ser usada para
    incluir arquivos de **cabeçalho*,*** com extensão *.h*. Arquivo de
    cabeçalho, conforme veremos mais adiante, é para **declarar** e não
    **definir**. Existe uma **grande** diferença entre estes dois
    termos.</span>
-   <span id="a595">Um programa C pode ter muito mais do que só um
    arquivo. Isso pode parecer meio óbvio. Mas muita gente, quando está
    iniciando, escreve o programa todo num arquivo sacola.</span>

A função *main* é a primeira função *do seu código* a ser chamada, mas
não é a primeira função a ser executada no seu programa. Antes da função
*main* existe uma função gerada pelo compilador chamada de *loader*. O
*loader*, ou carregador, realiza uma série de pequenas tarefas, como
preparar a carga do seu programa, ler e contar os argumentos de linha de
comando e obter as variáveis de ambiente no momento em que seu programa
entra em execução.

O carregador ainda pode definir *handlers* padrão para sinais e definir
algumas características do processo recém criado para executar o seu
programa. O que o carregador faz, na verdade, pouco importa. Você não
tem o que fazer. Ele vai fazer sem você pedir. Fica aqui como uma
informação adicional.

#### Procedural

Acostumado com programação orientada ao objeto? Bom, C é procedural. Não
existem objetos em C. Isto não significa que não seja possível programar
orientado ao objeto em C. Em 2003 eu comecei um projeto com um amigo
chamado de
<a href="https://github.com/ronflima/feijuca" class="markup--anchor markup--p-anchor">Feijuca</a>.
A biblioteca começou no Source Forge e há alguns anos atrás migrei-a
para o Github. Ela é integralmente escrita em C padrão. E é orientada ao
objeto.

Se você tiver a curiosidade de ler o código da biblioteca verá um
amontoado de funções. E é assim que tem de ser: C trabalha com funções e
ponto final. Portanto, não há como chamar uma mensagem de um objeto. A
coisa é meio inversa: você chama uma função passando o objeto como
parâmetro. A função é quem altera o estado do objeto.

No nosso exemplo, temos apenas a função *main*. Porém, chamamos a função
*printf*. E é assim que a coisa funciona: uma função que chama outra
função e assim segue a coisa.

#### Proximidade com a máquina

Apesar de não ficar muito explícito no código que escrevemos, C é uma
linguagem muito próxima da máquina. A função *main* esconde o
carregador. O carregador é altamente depende de plataforma. A ideia por
trás de C é ser uma linguagem altamente portável.

Uma das coisas que assustam quem está aprendendo C são os ponteiros, ou
variáveis de ponteiro. É um conceito simples, porém normalmente é
explicado nos cursos de programação como algo muito abstrato sendo que,
na verdade, o ponteiro não tem nada de abstrato: é meramente um endereço
de memória.

C permite que você leia cada bit de um endereço arbitrário de memória.
Também permite que você mude uma informação bit a bit. Mas isso é bem
mais simples do que parece.

#### Ferramentas

Como eu disse, todo programa em C pode ter uma cacetada de arquivos.
Cada arquivo com várias funções, declarações de tipos, definições das
mais variadas coisas. A questão é: como é que eu junto esse tanto de
tralha e transformo num programa que eu possa executar?

Compilar manualmente um sistema escrito em C é pedir para morrer doido.
Existem ferramentas para isto. A ferramenta mais tradicional é o *make*
e seus *makefiles*. Esta ferramenta faz *tracking* de dependência entre
os arquivos que compõem seu software no intuito de compilar somente
aquilo que ainda não foi compilado ou somente aquilo que foi mudado, no
intuito de otimizar o processo de criação do seu executável.

Para programas em C eu gosto dos *autotools*, um conjunto de ferramentas
do projeto GNU que visam criar scripts e um ambiente de compilação
facilmente portável. Mas nada impede que você use ferramentas mais
atuais como *maven*, *ant* ou até mesmo os task runners como Grunt,
Cake, Gulp e outros. Você pode entender o *make* como um task runner
primitivo. E é isso que o *make* é*.* Já usei o make para fazer coisas
como deployment, instalação de patches em databases e mais uma série de
coisas além de simplesmente gerar um executável.

Eu sou da política de que você precisa usar aquilo que você conhece. Se
você conhece o Grunt, use-o. Vai ser mais rápido do que aprender a usar
o *autotools*. Porém, se você quiser escrever algo em C que possa ser
distribuído para a comunidade de software livre, *autotools* não é uma
opção: é uma obrigação.

#### Chega!

Bom, eu não gosto de artigos muito grandes. Vamos parar por aqui. Como
minha intenção é escrever uma série de artigos, vamos deixar para o
próximo falar mais em código e menos em teoria. Achei por bem iniciar
com uma carga teórica sobre alguns assuntos que considero
imprescindíveis no entendimento da linguagem e seus acessórios.

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [March 4, 2017](https://medium.com/p/4ea1415fb8a0).

<a href="https://medium.com/@ronaldolima/perdendo-o-medo-de-c-4ea1415fb8a0" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
