---
layout: post
title: Conheça os operadores Bitwise
author: ronaldo
image: https://miro.medium.com/max/3000/1*KLRByQhD_Lldtaj1Rw_5dg.png
---

O operador é um dos blocos construtivos básicos de qualquer linguagem de
programação moderna. A primeira coisa que se aprende em qualquer
linguagem de programação é o operador atribuição (=). Porém, existem
operadores que são menos usados mas que são igualmente importantes: os
operadores *bitwise*. Estes operadores foram criados no intuito de
operar em palavras binárias, implementando operações bit a bit tão
necessárias quando se tratando diretamente com o *hardware*.

Porém, os operadores *bitwise* são bem mais úteis do que simplesmente
interpretar status de retorno de algum *hardware*. É possível, por
exemplo, usar os operadores para multiplexar uma série de flags em
palavras binárias. O fato é que você usa isso todos os dias mas nunca se
apercebeu disso.

No desenvolvimento iOS, o uso de *bitwises* é corriqueiro. Por exemplo:

Observe que a chamada do método components:fromDate do NSCalendar usa um
conjunto de operadores *bitwise* para multiplexar um conjunto de flags
em uma única palavra binária.

Bem, vamos aos detalhes!

### Operadores Bitwise

Os operadores bitwise são, normalmente, os seguintes:

-   <span id="5e45">Operador E binário: &</span>
-   <span id="fd40">Operador OU binário: |</span>
-   <span id="f70e">Operador NÃO binário: ~</span>
-   <span id="88a0">Operador OU EXCLUSIVO binário: ^</span>
-   <span id="6920">Operador ROLAGEM DE BITS à direita: &gt;&gt;</span>
-   <span id="b933">Operador ROLAGEM DE BITS à esquerda: &lt;&lt;</span>

É importante não confundir estes operadores com os operadores lógicos e
operadores lógicos relacionais. Estes operadores usam como operandos
números inteiros e devolvem como resultado também números inteiros. A
ideia aqui é permitir que você manipule cada bit de uma palavra binária
individualmente ou em conjunto. Algumas linguagens de programação usam
operadores com sintaxe ligeiramente diferente mas, no geral, estes são
os símbolos comumente usados. Consulte o manual da sua linguagem
predileta para verificar como ela implementa os operadores *bitwise*.

Como eu disse, originalmente estes operadores foram pensados para dar a
habilidade de interfaceamento com hardware mais fácil para as linguagens
de programação. Porém são operadores tão flexíveis que logo ganharam
foco no desenvolvimento comercial.

Bem, da mesma forma que os operadores lógicos e lógicos relacionais, os
operadores bitwise, também chamados de *operadores binários*, operam em
termos de verdadeiro ou falso. No entanto, a operação ocorre bit a bit:
se o bit está ativo, ou seja, 1, ele é verdadeiro; analogamente, se está
inativo, ele é falso.

Estes operadores também têm uma *tabela verdade*, que é a tabela que
demonstra o resultado das operações de acordo com os operandos
fornecidos.

Os operadores de rolagem de bits, por outro lado, têm resultados
interessantes:

Estas operações sempre ocorrem bit a bit.

### Usos Práticos

Perfeito, já sei o que são os *bitwises*. Por que devo usar isso?

O uso mais corriqueiro de *bitwises* é para multiplexar flags em uma
única palavra binária. Ao invés de você usar várias variáveis booleanas
para armazenar os flags, simplesmente use uma palavra binária sem sinal
para isso. Nas plataformas atuais, você consegue armazenar até 64 flags
em um número inteiro.

A forma mais elegante de dar significado a cada bit é através de
enumerações. Pegando o exemplo da própria Apple:

Desta forma você consegue salvar dentro de um *unsigned long* até 64
flags. Para testar se um determinado flag está ativo, basta fazer isto:

Para ajustar um conjunto de flags dentro de uma palavra binária, é
igualmente simples:

```
flag = kCFCalendarUnitEra | kCFCalendarUnitYear | kCFCalendarUnitDay;
```

Agora que você já sabe o que são os bitwises e como usá-los, vai mesmo
continuar criando aquele monte de flags booleanos no seu software?
