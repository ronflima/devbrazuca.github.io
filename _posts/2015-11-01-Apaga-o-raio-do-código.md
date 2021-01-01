---
layout: post
title: Apaga o raio do código!
image: https://images.pexels.com/photos/850216/pexels-photo-850216.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=1920
author: ronaldo
categories: [Programação, Opiniões]
---

### Apaga o raio do código!

O cenário é bem conhecido de qualquer programador: você está dando
manutenção em um código e parte do código deixou de ser útil. É a vida,
meu caro. Requisitos mudam. Código fica antiquado e precisa ser apagado.
Porém, ao invés de apagar o código, você faz o que não devia fazer:
comenta o código.

Por que isso é uma péssima ideia? Você está, na verdade, deixando
sujeira para trás, diminuindo a legibilidade do código. O fato é: o
código ficou inútil, apague! Se precisar ver como era o código antes da
sua manutenção, faça um diff! É para isso que servem os controladores de
versão de código.

A regra de ouro é sempre escrever o mínimo de código possível. Isso
inclui evitar excessos de comentários ou qualquer outra coisa que possa
diminuir a legibilidade do que está escrito. Infelizmente, tomado por um
medo irracional de *não mexer aqui,* muita gente comenta o código ao
invés de simplesmente apagar.

Assim chegamos no ponto central que eu queria discutir: os controladores
de versão. A verdade é que muita gente usa mal o controlador de versões
ou não compreende completamente para que serve. A ideia do controlador
de versões é justamente manter um histórico de desenvolvimento
permitindo que você, desenvolvedor, não só saiba como estava o código
como também permite voltar coisas que você ou outros fizeram,
restabelecendo a ordem e estabilidade do seu código quando necessário.

Controladores como o GIT, por exemplo, incentivam o developer a realizar
*commits* com muita frequência. O ideal é realizar um *commit* sempre
que terminar um trecho útil de código. Se você escreve código demais
antes de fazer um *commit*, fica mais difícil voltar atrás.
Controladores como o GIT são muito ágeis por que fazem o *commit*
localmente, o que é muito rápido. Assim, faça *commits* frequentes e dê
a você mesmo a oportunidade de se permitir voltar alterações pequenas de
forma automatizada, com segurança.

Voltando ao código comentado: há linguagens de programação que trabalham
com diretivas de pré-processamento que permitem que você "comente"
código sem usar a sintaxe de comentários. Por exemplo, você pode usar um
*ifdef* para extirpar código da compilação. Isso é uma ideia ainda pior
do que comentar código. Nem todo editor de textos está preparado para
colorir código dentro de blocos *ifdef* e pode dar a impressão que o
código está ativo, levando a erros grotescos de análise.

Assim, se precisar eliminar código, faça do jeito fácil: selecione o
código que deseja extirpar e aperte DELETE. Simples, rápido, vai evitar
confusões no futuro e vai economizar muito tempo seu. O importante hoje
em dia não é escrever o código mais perfeito do mundo, mas ser rápido
para dar manutenção no seu código. Se o seu código tem qualidade e é
rápido de manter, você tem um diferencial de mercado.
