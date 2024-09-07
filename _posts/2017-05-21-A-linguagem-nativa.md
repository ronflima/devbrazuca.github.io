---
layout: post
title: A linguagem Nativa
subtitle: Saiba por que você chama sua linguagem de "nativa"
image: https://cdn-images-1.medium.com/max/800/1*EMUzCn2MMj_Q7bde85XRaA.jpeg
author: ronaldo
categories: [Programação]
---

Ultimamente muito se fala sobre *linguagem nativa*. Muita gente fala sobre isso
sem ter a mais remota ideia do que se trata. Do meu ponto-de-vista, não existe,
de fato, esse negócio de *linguagem nativa.* Trata-se de uma concepção
artificial.

O fato é que mesmo o executável tem um formato que depende não só da máquina mas
também do sistema operacional. Cada formato tem seções específicas que são
usadas pelo sistema operacional para criar o processo corretamente. No caso dos
sistemas operacionais da Apple, ou seja, macOS, iOS, tvOS e watchOS, o formato é
conhecido como [Mach-O](https://en.wikipedia.org/wiki/Mach-O).

O que existe, de verdade, é a diferença entre linguagens que geram
executáveis e linguagens que dependem de um intérprete.

#### Linguagens interpretadas

A linguagem interpretada não produz um executável de verdade. No entanto,
depende de um software especialista, chamado de *intérprete*. O intérprete
realiza a interpretação do código, executando suas instruções conforme o
programa vai sendo executado.

A principal diferença com relação à linguagem que produz um executável é que o
intérprete interpõem-se entre o seu programa e o sistema operacional. Assim, o
sistema operacional primeiro precisa carregar o intérprete para depois carregar
o seu programa e, efetivamente, executá-lo. Quem executa seu programa, portanto,
é o intérprete e não o sistema operacional.

Isto tem uma série de vantagens e desvantagens. A principal vantagem é que o seu
código não precisa ser modificado se você colocá-lo para executar em outra
plataforma. Basta que o intérprete seja portado para lá e está feito o truque.
Obviamente que na prática não é bem assim. Algumas diferenças acabam forçando
algum tipo de adaptação.

A principal desvantagem está na performance. Toda linguagem interpretada, por
mais otimizado que seja o seu intérprete, nunca será capaz de executar na mesma
velocidade que uma linguagem que tem um compilador. No entanto, esta desvantagem
vem tornando-se irrelevante ao longo dos anos dado o poder de processamento dos
processadores atuais. Já há cenários que a diferença é quase indistinta pois os
programas passam mais tempo aguardando por I/O do que efetivamente executando
alguma forma de processamento.

#### Linguagens Compiladas

As linguagens compiladas produzem um executável no formato da plataforma. Portar
o código para outra plataforma é questão de portar o compilador, ligador e
montador para a nova plataforma. No entanto, os programas precisam ser
recompilados em cada plataforma para a qual forem portados.

A principal vantagem é a performance: nada executa mais rapidamente do que
código de máquina. Não há um intérprete no meio do caminho. Porém, a principal
desvantagem é a falta de dinamismo. Normalmente linguagens compiladas não contam
com o dinamismo de linguagens interpretadas pois tudo precisa ser resolvido em
tempo de compilação. As linguagens interpretadas, por outro lado, podem tirar
proveito da interpretação e os intérpretes podem fazer assunções que podem ser
resolvidas posteriormente, sem a necessidade de ter tudo resolvido em tempo de
compilação.

#### Por que não faz sentido falar em linguagem nativa

Eu poderia escrever código para iOS em Kotlin ou em C\#? Claro. Contanto que
exista um compilador que gere um executável em formato Mach-O e que permita-me
usar os SDKs da Apple para interagir com o sistema operacional. Bastaria alguém
escrever um front-end para o LLVM que permitisse compatibilidade binária com os
frameworks da Apple. Detalhe: não importa qual linguagem foi usada para gerar os
frameworks pois os frameworks são código Mach-O. Seguindo-se as convenções de
chamada e mantendo-se a compatibilidade binária é tudo o que se precisa.

Ou seja, a linguagem em si não é *nativa*. O que é nativo é formato do
executável final. No linux, o formato precisa ser ELF, ao passo que no
Windows precisa ser PE32 ou PE32+ dependendo da edição.

Na minha opinião trata-se de uma divisão artificial para separar as
linguagens oficialmente mantidas pelos grandes *vendors* das linguagens
alternativas que podem ser tão boas, ou melhores até que as linguagens
tidas como *oficiais*.

#### E os híbridos?

Os tais híbridos nada mais são que uma linguagem interpretada que
permite que você tenha acesso a facilidades do sistema operacional
através do uso de extensões do intérprete. Normalmente os intérpretes
permitem que você escreva extensões, ou seja, novos comandos que são
escritos em uma linguagem mais forte, como C ou C++, o que dá
habilidades à linguagem que não estão disponíveis no intérprete
original.

Por exemplo, o Java conta com o JNI, algo que permite quebrar o
hermetismo da JVM e dar acesso ao hardware indistintamente, através de
uma ponte normalmente escrita em C.

Esta ideia de *híbrido* é interessante, mas é difícil manter as camadas
de compatibilidade entre as diversas plataformas e sistemas
operacionais. O fato é que a portabilidade com custo zero não existe.
Sempre é preciso fazer algum ajuste no código para que o seu software
execute bem em todas as plataformas para as quais for portado.

Outro problema dos híbridos está na performance: não só por se tratar de
uma linguagem interpretada, mas por conta, principalmente, da extensa
camada de compatibilidade que precisa ser construída no intuito de
compatibilizar o código final com diversas plataformas. É virtualmente
impossível criar uma camada de compatibilidade que entregue a mesma
performance do acesso direto às APIs do sistema operacional.

Porém, como toda tecnologia, os híbridos tem diversos cenários de uso. É
importante ter em mente, no entanto, que não são balas de prata. Como eu disse,
programação multi-plataforma com custo zero não existe.
