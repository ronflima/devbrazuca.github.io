Optionals: quebrando tudo com swift!
====================================

Esta é, sem dúvida, a feature mais quente do swift.

------------------------------------------------------------------------

### Optionals: quebrando tudo com swift!

#### Esta é, sem dúvida, a feature mais quente do swift.

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*F0DxrY5aXA9DGpdB_jySww.jpeg" class="graf-image" />
</figure>Entre todas as características da linguagem Swift, a que mais
me chamou a atenção, quando a Apple apresentou a linguagem pela primeira
vez, foi o uso de opcionais. Essa foi, sem dúvida, uma grande sacada e
uma forma bem interessante de homogeneizar um conceito já há muito tempo
arraigado na computação: o problema do valor inicial.

A ideia por trás do opcional é simples: criar uma variável cujo valor
seja opcional. Isto quer dizer o seguinte: esta variável é de um tipo
bem determinado, mas o valor que ela carrega é opcional. Ou seja, em
algum momento no ciclo de vida desta variável ela conterá um valor que
indica que ela está vazia, ou seja, não tem valor algum.

Para entender por que este conceito é legal, vamos pensar no seguinte
problema: precisamos determinar o maior número de um conjunto finito de
números. Se fôssemos resolver este problema em C, teríamos algo como
isto:

    int max (int *numbers, int size) {
      int greater = -1;
      int *p = numbers;
      while (p - numbers < size) {
        if (*p > greater) {
          greater = *p;
        }
        ++p;
        return greater;
      }
    }

Considere que *numbers* é um array de números inteiros e *size* é o
tamanho deste array. Aritméticas de ponteiro à parte, o algoritmo é bem
simples: ele inicializa *greater* com um valor inicial e sai comparando
este número com todos os demais existentes no array.

É um algoritmo sem-vergonha. Se a lista de números for toda negativa com
números menores que -1, está feita a merda. Uma saída simples é
inicializar *greater* com o primeiro elemento do array e sair comparando
com o resto, o que resolveria o problema, mas não ilustraria o que quero
com os opcionais. Reescrevendo esta jóia em Swift, teremos algo assim:

    func max (numbers: [Int])-> Int {
        var max: Int?
        for x in numbers {
            if max == nil || max! < x {
                max = x
            }
        }
        return max!
    }

Observe que *max* é do tipo inteiro, mas com uma interrogação na frente.
Isto quer dizer que *max* é uma variável opcional. A despeito da péssima
escolha de nomes para a função e sua variável local, há alguma coisa
interessante acontecendo por aqui.

Para que você acesse o valor de uma variável opcional é necessário
realizar um processo chamado de *unwrapping*. O que acontece é o
seguinte: ao declarar uma variável como opcional o compilador gera uma
estrutura de código em torno dela para que um valor especial, *nil,*
seja armazenado nela. A palavra *nil* é uma contração da palavra latina
*nihil*, que significa, no bom português, *nada*.

Em Objective C era possível usar *nil* como valor inválido, mas apenas
para variáveis estruturadas como classes e estruturas. Variáveis de
tipos integrais não podiam usar esta característica, o que criava um
hiato na linguagem.

Bom, em Swift você pode usar opcional em qualquer tranqueira que
inventar, não importa se sua variável é estruturada ou integral. Isso
homogeiniza as coisas. No nosso exemplinho sem-vergonha, há uma
verificação explícita contra *nil*, apesar de não haver nenhuma
inicialização explícita para este valor. Isto se deve ao fato do runtime
do Swift inicializar automaticamente os opcionais com o valor *nil*.

Para realizar o *unwrapping* é preciso usar dois pequenos operadores: ?
ou !. No exemplo, usei o operador !, que faz o *unwrapping* forçado,
enquanto que o operador ? faz o *unwrapping* condicionado. Qual a
diferença entre eles?

Se a variável tiver um valor *nil*, ou seja, um valor inválido, o
*unwrapping* forçado vai provocar uma falha de runtime e sua aplicação
vai cair de forma descontrolada. No caso do *unwrapping* condicionado, o
runtime tentará extrair o valor da variável. Se a variável for *nil*,
nada acontece.

Assim, você deve usar o *unwrapping* forçado sempre que tiver certeza de
que a variável tem um valor válido nela, como foi o caso do nosso
algoritmo sem-vergonha.

Uma construção muito comum para realizar o *unwrapping* é através do if:

    if let valorUnwrapped = valorOpcional {
    }

Se *valorOpcional* tiver um valor válido, ele é atribuído a
*valorUnwrapped* e você pode usar esta constante dentro do *if* sem se
preocupar com o danadinho do *nil*. Isto é equivalente a fazer o
seguinte:

    if valorOpcional != nil {
        let valorUnwrapped = valorOpcional!
    }

#### Unwrapping Automático

Você pode declarar uma variável assim:

    var idade: Int!

Isso daí é muito comum quando você cria *outlets* no seu código, quando
está programando no Cocoa Touch ou no Cocoa. Esta sintaxe quer dizer o
seguinte: idade é uma variável opcional, mas cujo *unwrapping* será
implícito.

Assim, pode-se fazer o teste deste tipo de variável contra *nil* para
verificar-se se a variável é válida. Tentar acessar uma variável
opcional sem que ela tenha um valor válido vai provocar um erro no seu
programa.

Assim:

    var outro = idade + 1

provoca um erro em tempo de execução. Ao tentar fazer o unwrapping de
idade, runtime verifica que não há valor válido e aí a casa cai. O
ideal, aqui seria fazer algo como abaixo

    var outro = 0
    if idade == nil {
     outro = idade + 1
    }

Observe que não foi preciso indicar o unwrapping de *idade*. O
*unwrapping* é feito automaticamente pelo runtime.

#### Anti-patterns

Já falei do trem bonito. Agora é hora de falar do trem feio. Tem um raio
de um povo que faz unwrapping desta forma:

    if let valorOpcional = valorOpcional {
    }

A ideia é aproveitar o nome da variável. Nem preciso dizer que isso é
uma péssima ideia. Funciona, mas deixa seu código bem mais escroto de
ler. Muitas vezes o povo usa esta forma apenas para saber se a variável
é válida ou não.

Outro anti-pattern interessante é fazer isto para ativar métodos de
objetos opcionais:

    if let objetoOpcional = objetoOpcional {
     objetoOpcional.metodoDescolado()
    }

Por que isso é ruim? Por que dá para fazer a mesma coisa sem essa
tanteira de código:

    objetoOpcional?.metodoDescolado()

Faz a mesma coisa. O ? quer dizer que fazemos o unwrapping condicionado,
ou seja, se tiver algo lá, executa o método, senão não faz nada.

Bem, é isso aí. Espero que isso esclareça dúvidas quanto ao uso de
opcionais no seu programa.

Happy Coding!

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [August 31, 2016](https://medium.com/p/6cbfebae82c8).

<a href="https://medium.com/@ronaldolima/optionals-quebrando-tudo-com-swift-6cbfebae82c8" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
