Perdendo o medo de C: tipos de dados
====================================

Todo dado tem seu tipo. Todo tipo tem seu dado…

------------------------------------------------------------------------

### Perdendo o medo de C: tipos de dados

#### Todo dado tem seu tipo. Todo tipo tem seu dado…

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*CtL7L-xuiyljKBcX6kxjug.jpeg" class="graf-image" />
</figure>Dando continuidade à série de artigos sobre linguagem C, me
permitam falar dos tipos de dados. Bem, C é uma linguagem de *tipagem
estática*, ou seja, uma vez que você tenha definido um objeto como sendo
de um tipo, este objeto permanece deste tipo até o fim da sua vida.
Antes de seguir adiante, um parênteses.

> "Objeto" neste contexto não é uma instância de uma classe. C não é
> orientado ao objeto. Aqui, quando falo "objeto" me refiro a um
> elemento da linguagem que é algo pronto para ser utilizado, como uma
> constante, uma variável ou uma função. A literatura trata estes
> elementos da linguagem como "objetos" e achei por bem manter a
> nomenclatura, por mais que possa causar confusão.

Parênteses fechado, vamos adiante. Como eu disse, C é uma linguagem de
tipagem estática. Existem dois conceitos importantes que preciso
apresentar antes de seguir adiante. O primeiro é a **declaração**.
Quando você declara algo você quer dizer como este *algo* deverá ser
usado. Se este algo for uma função, declará-la diz ao compilador o que é
que ela recebe como parâmetro e o que ela pode retornar. O segundo
conceito é a **definição**. Quando você define algo, você diz para o
compilador o que é que este algo faz. Portanto, quando você *define uma
função* você está, na verdade, escrevendo o código do corpo desta
função.

Mesmo as variáveis podem sofrer desta distinção. Ao declarar uma
variável, você pode deixar para definí-la posteriormente. Isto leva o
nome bonito de *forward definition*. Me lembrem de voltar a isto depois.

Bom, temos basicamente dois tipos de dados em C: os tipos integrais e os
tipos estruturados. Os tipos integrais são tipos simples, que suportam
apenas um único valor de cada vez. Os tipos estruturados permitem
armazenar vários valores diferentes no mesmo lugar, permitindo que seu
programa trabalhe com estruturas complicadas de dados através de uma
única variável.

Entre os tipos integrais, temos os seguintes:
`int, float, double, char`. Apesar de parecer um contra-senso, `char` é
um tipo numérico que acumula valores de 1 byte, ou seja, números de -128
a +127, podendo ser de 0 a 255 se for utilizado um *modificador de
tipo.*

Os modificadores de tipo para os tipos numéricos são: `unsigned, long.`
O primeiro declara um tipo numérico sem sinal e o segundo um tipo longo.
Normalmente ambos são usados para tipos inteiros.

Os tipos estruturados permitidos em C são as estruturas e os vetores. As
estruturas são tipos compostos que permitem que valores de tipos
distintos sejam agrupados em um único lugar. Os vetores permitem que
vários valores do mesmo tipo sejam armazenados no mesmo lugar. Os
vetores podem ser unidimensionais ou multidimensionais. A literatura
normalmente se refere aos vetores, de forma mais acertada na minha
opinião, como matrizes.

Existe um tipo integral do qual não falei que é, na verdade, um caso
especial de números inteiros: as enumerações. As enumerações, em C, são
conjuntos limitados de valores que podem ser usados como constantes. C
permite que somente números inteiros sejam usados como membros de uma
enumeração.

Uma *variável* é um objeto dentro do seu programa que armazena um
determinado valor de um determinado tipo temporariamente. É temporário
pois quando o seu programa sai da memória, o valor de qualquer variável
se perde. Assim, podemos começar a ver exemplos de declarações de
variáveis.

    int x;         /* x é uma variável inteira com sinal */
    unsigned y;    /* y é uma variável inteira sem sinal */
    long z;        /* z é uma variável inteira longa */
    char name[11]; /* name é um vetor de char, com 11 posições */
    struct {
        char name[41];
        unsigned age;
        unsigned char married;
    } record;      /* record é uma estrutura de dados */

#### Strings

Nos exemplos eu criei alguns vetores de `char` . Como eu disse, `char` é
um tipo numérico inteiro. O fato de `char` ocupar apenas um único byte
tem um sentido importante: quando foi criada, a linguagem C não
precisava tratar com encodings complexos como o Unicode. O padrão era a
codificação ASCII que cabia em apenas um único byte.

Assim, toda e qualquer cadeia de caracteres poderia ser descrita como
uma sequência de números variando de 0 a 255. Assim, uma string em C é,
na verdade, um vetor de `char` , sendo que o último caractere de uma
string precisa ser, necessariamente, o valor 0 (0x0 em hexadecimal ou
'\\0' como um literal `char`).

Isto significa dizer que C não tem suporte nativo a unicode. Se você
precisa processar unicode, deverá usar uma biblioteca externa. A
linguagem define somente a manipulação de caracteres baseados em
codificação de 1 byte.

Bem, strings em C são vetores de caracteres terminados com um caractere
zero. Isto permite que a string não tenha limitação quanto ao seu
tamanho. Pode ser de qualquer tamanho. A quantidade de caracteres de uma
string é a contagem de caracteres diferentes de zero que existem na
string.

#### Ponteiros

Impossível falar de strings e matrizes sem falar de ponteiros. Este é o
tipo de dado que mais causa confusão a quem está aprendendo C: os
ponteiros. O ponteiro, na verdade, é um número inteiro, sem sinal. O que
é armazenado no ponteiro é um endereço de memória. E aqui cabe outro
parênteses.

Tudo o que pertence ao seu programa é armazenado, temporariamente, em
algum lugar da memória do seu computador. A *memória* pode ser física ou
virtual. A memória física é a memória *de facto*, ou seja, é um chip
projetado especificamente para armazenar informações temporariamente. A
memória virtual é criada pelo sistema operacional e é armazenada em
disco. Ou seja, o disco é usado como memória.

O *tamanho* de um ponteiro depende do tamanho máximo do registrador de
endereçamento da CPU. Atualmente, o tamanho do ponteiro é de 64 bits (8
bytes) nas CPUs modernas.

Normalmente o ponteiro refere-se à memória que existe dentro dos limites
do seu programa. Como os sistemas operacionais trabalham, atualmente, em
modo *protegido*, é impossível para um programa tentar acessar um
endereço que não pertença ao seu próprio programa, a não ser que se
trate de memória compartilhada — um conceito existente no unix.

A ideia por detrás do ponteiro é bem simples: ele funciona como uma
*referência* a algum objeto do seu programa. O ponteiro tem este nome
por que ele *aponta* para um endereço de memória onde está informação.
Por exemplo:

    int a = 10;
    int *b = &a;

A variável `a` é um número inteiro que é inicializado com o valor 10. A
variável `b` é um ponteiro que referencia um valor inteiro e que está
inicializado com o endereço de `a`. O operador `&`, como você já deve
ter imaginado, extrai o endereço de memória onde `a` está armazenado.

Se traduzirmos este trecho de código para o bom português, o que
queremos dizer ali é o seguinte:

    Declare a variável "a" como inteira com sinal e defina seu valor como 10;
    Declare a variável "b" como ponteiro para um inteiro com sinal e defina seu valor para o endereço de memória onde "a" está armazenado.

Isto quer dizer que se acessarmos o conteúdo do endereço de memória
armazenado em `b`, conseguiremos ver o valor `10` lá dentro, pois `b`
agora é uma referência para `a`. Se mudarmos o conteúdo da memória para
onde `b` aponta, mudamos o valor de `a`:

    *b = 25;

Como você já pode ter imaginado, o operador `*` é usado para olhar
dentro da memória para onde `b` aponta. A atribuição acima faz com que o
conteúdo da memória para onde `b` aponta seja alterado para 25. Como `b`
aponta para o endereço de `a`, o que estamos fazendo, efetivamente, é
mudando o valor dentro de `a`.

Se você conseguiu seguir o raciocínio até aqui e entendeu que `b` é uma
referência que é realizada através do endereço de memória da variável
`a`, você conseguiu aprender o conceito mais complicado da linguagem C.

A ideia de referência é melhor percebida quando trabalhamos com
parâmetros de função. Os parâmetros de função podem ser passados por
referência. Neste caso, se a função alterar o valor destes parâmetros
dentro dela, estes novos valores são transmitidos para as variáveis
usadas como parâmetro para chamar a função.

> Não existem tipos de dados além destes em C. Dicionários, listas,
> arrays extensíveis, stacks, filas, tabelas de hash, sets, multisets e
> outros tipos não são definidos pela linguagem. Caso precise de uma
> estrutura de dados como estas você tem duas opções: ou escreve o
> algoritmo ou usa uma biblioteca de terceiros que as implemente.

#### Até Aqui

Apresentei de forma sucinta os principais conceitos relacionados aos
tipos de dados. Este artigo não tem a intenção de ser um tratado sobre o
assunto, mas uma rápida introdução. O mais complicado que apresentei foi
o ponteiro. Tentei usar uma forma mais direta com explicações mais
abrangentes para que o conceito seja totalmente compreendido.

Vou finalizar por aqui pois já foi informação demais. Em outro artigo
falarei dos aliases de tipo e das declarações *forward*.

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [March 7, 2017](https://medium.com/p/2a804f05bd66).

<a href="https://medium.com/@ronaldolima/perdendo-o-medo-de-c-tipos-de-dados-2a804f05bd66" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
