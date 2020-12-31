---
layout: post
title: Checagem de CPF em C
image: assets/images/2015-05-31-Checagem-de-CPF-em-C.jpeg
author: ronaldo
---

Depois de um longo e tenebroso inverno, eis que resolvi escrever um
pequeno código de exemplo que valida um número arbitrário de CPF.
Trata-se de um algoritmo muito sacado e praticamente todo programador já
teve de implementá-lo alguma vez. Como estava aqui caçando o que fazer,
curtindo uma bela gripe e numa noite fria, resolvi relembrar o bom e
velho C e escrevi um utilitário simples de linha de comando que valida
um CPF qualquer.

Bem, aqui está o código principal:

A função de interesse é a *cpfIsValid*. Trata-se de um workflow simples
que:

-   <span id="a5bc">valida se a entrada é realmente um pointer válido,
    apesar dessa validação não ser lá muito contundente;</span>
-   <span id="6b4e">valida o tamanho do CPF — ele precisa ter 11
    dígitos. Se tiver menos, simplesmente cai fora;</span>
-   <span id="9aaa">verifica se há algum alfa-numérico na string. CPF
    contém somente dígitos numéricos;</span>
-   <span id="2afb">verifica se o CPF é composto de números repetidos.
    Por exemplo, 11111111111 não é um CPF válido mas acaba passando no
    teste do módulo 11;</span>
-   <span id="ab0e">por fim, extrai os dígitos verificadores do CPF,
    calcula os dígitos verificadores e checa se são iguais.</span>

O número do CPF é um exemplo de validação cíclica na qual a informação a
ser validada contém a própria validação. Isso é algo parecido com o CRC,
uma das primeiras formas de validação de dados que era muito usado nas
primeiras transmissões de dados nas primeiras redes de computadores.

Existem alguns truques neste código. O primeiro está na função
*cpfIsValid*. O cálculo do dígito verificador é concatenado
multiplicando-se o primeiro dígito por 10 e somando-se com o segundo
dígito. Esta é uma forma simples de concatenar dígitos no mesmo número,
uma característica simples dos números decimais.

O segundo truque está na função *checkDigits*. Na verdade, esta é uma
função cheia de truques. O primeiro é a determinação do tamanho da
string fora do loop. Se for feito dentro do loop, *strlen* será chamado
10 vezes, no pior caso. Assim, determinando ANTES, ampliamos a
performance desta pequena função. O outro truque é a conversão de string
para inteiro: *(cpf\[i\] — ‘0‘)*. Um truque conhecido de quem programa
em C: calcula-se a distância entre os dígitos e a distância é,
evidentemente, o número procurado.

Outro truque interessante, que uso com bastante frequência, é usar os
próprios argumentos da função como incremento. Como os argumentos são
passados por valor, posso incrementá-los à vontade dentro da função sem
risco de bagunçá-los do lado de fora.

Este é um código bastante otimizado. Com um pouco de esforço, certamente
você será capaz de otimizá-lo ainda mais. Porém, note que o código não
funciona com unicode. Trata-se apenas de uma demonstração simples de
como determinar a validade do CPF através de um código C.

O algoritmo aqui apresentado pode ser facilmente portado para outras
linguagens. Originalmente, escrevi este código com suporte a unicode em
Objective C.

Na próxima coloco uma versão em *swift*.

Quem quiser ver o código em ação, basta fazer um clone:

<a href="https://github.com/ronflima/cpfcheck" class="markup--anchor markup--p-anchor">https://github.com/ronflima/cpfcheck</a>

No terminal, digite *make* e fique feliz. Basta ter um compilador C e o
utilitário Make que isso compila sem medo.

*Originally published at*
<a href="http://www.ronaldolima.eti.br/2015/05/15/checagem-de-cpf-em-c/" class="markup--anchor markup--p-anchor"><em>www.ronaldolima.eti.br</em></a>
*on May 15, 2015.*

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [May 31, 2015](https://medium.com/p/a64fe7a386f5).

<a href="https://medium.com/@ronaldolima/checagem-de-cpf-em-c-a64fe7a386f5" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
