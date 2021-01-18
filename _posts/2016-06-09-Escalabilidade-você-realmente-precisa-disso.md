---
layout: post
title: "Escalabilidade: você realmente precisa disso?"
subtitle: Ou como torrar recursos importantes em coisas que você não precisa.
image: https://cdn-images-1.medium.com/max/800/1*1OsM8dy5ufWwXEgGYyojWA.jpeg
author: ronaldo
categories: [Desenvolvimento, Tecnologia, Opiniões]
---

Hoje em dia está na moda falar sobre escalabilidade. Virou quase uma
obrigatoriedade criar sistemas *escaláveis* como se fosse um pecado
mortal não o fazer. Mas, será que seu sistema realmente precisará
escalar?

A escalabilidade não é algo fácil de ser conseguido. Estamos falando
de uma arquitetura de sistema que permita o processamento e o
armazenamento de informações distribuídos, com mecanismos que permitam
que cada elemento do seu sistema seja gerenciado de maneira simples e
com pouco esforço.

Isso quer dizer que o seu sistema precisa denormalizar os dados para
que se possa distribuí-los, visando o máximo *throughput* possível.
Denormalizar dados no intuito de obter-se performance também não é uma
tarefa lá muito fácil pois requer muita replicação de informação e,
também, uma boa coordenação na manutenção dessa informação. Este, no
entanto, é só um aspecto do problema.

Eu entendo que a escalabilidade é uma otimização: a demanda pelo seu
serviço aumentou tanto que tornam-se necessárias alterações na
arquitetura da sua solução no intuito de entregar aos consumidores do
seu sistema informações com eficácia, eficiência, performance e
segurança.

Mas e se a sua demanda não aumentar? E se o aumento tiver uma taxa muito
abaixo do esperado? Isto quer dizer que você investiu em soluções que
ficaram grandes demais para a situação atual do seu sistema. Ou seja,
você perdeu dinheiro.

#### Arquitetura!

Sem dúvida, qualquer sistema profissional que se preze precisa de uma
boa arquitetura. E uma boa arquitetura passa por uma boa
modularização, ou como querem os mais novos, uma boa
componentização. Criar sistemas baseados em componentes não é,
absolutamente, uma ciência nova.

Trata-se, na verdade, de uma forma de desenvolver funcionalidades
auto-contidas de forma que se possa alterar um ponto do sistema sem,
necessariamente, causar impactos em outros cantos, principalmente
quando falamos em sistemas muito grandes.

Mesmo uma boa arquitetura de um sistema é dependente do contexto no
qual o sistema foi criado. E este contexto muda com o tempo. Assim,
tentar partir para uma arquitetura altamente escalável no início dos
tempos do seu sistema é tentar prever um futuro que pode não
chegar. Sim, uma boa arquitetura modularizada é algo importante, mas
não por conta da tal escalabilidade, mas por conta da manutenção.

Normalmente sistemas mais componentizados tendem a ter um ciclo de
manutenção mais simples. Eu disse "tendem". Ainda há casos nos quais
uma alteração do sistema toca diversos componentes.

#### Sistemas Operacionais Antiquados

Sabe o sistema operacional do servidor que você usa para hospedar o
seu sistema? Ele é antiquado para este novo paradigma que está
surgindo no horizonte: o processamento e armazenamento
distribuídos. Linux, Windows, Mac OS X, não importa. Todos estes
sistemas foram concebidos para executar exclusivamente em uma única
máquina. Existem formas de criar clusters e grids com estes sistemas,
mas ainda assim não é um sistema distribuído puramente distribuído, o
que exige um alto grau de complexidade no projeto de aplicações que
aproveitam-se da distribuição de processamento.

O [Plan 9](http://plan9.bell-labs.com/plan9/), sistema operacional
experimental criado pela Bell Labs, é um sistema criado para ser
distribuído. Aqui várias funções de distribuição fazem parte do
sistema operacional, o que evita que o programador tenha de
preocupar-se com isso.

No entanto, o Plan 9 ainda é um sistema operacional experimental. E
provavelmente será um sistema operacional para resolver o problema de
distribuição de processamento de forma simples.

Sim, existem outras formas de distribuição de processamento, como
clusters Beowulf, sistemas Open MPI e por aí vai. Mas será que você
precisa de todo esse *fire power*?

#### O crescimento é o que importa

O seu sistema, qualquer que seja, sempre nascerá com um conjunto
finito de premissas. Estas premissas irão mudar ao longo do tempo à
medida em que novas funcionalidades são adicionadas. O fato é que o
crescimento do seu sistema é o que realmente importa: como fazer para
crescê-lo de forma ordenada?

Assim, é preciso um plano de longo prazo cujo objetivo é crescer seu
sistema sem partir para a *programação orientada a puxadinho*, onde
cada nova *feature* torna-se um puxadinho aqui e acolá. Revisões
periódicas da arquitetura, análises de performance e eficácia são
sempre necessárias. Caso contrário seu sistema cresce sem controle e,
quando você menos esperar, terá um monstro consumidor de recursos nas
suas mãos.

A gestão de recursos em qualquer sistema é o que vai ditar a diferença
entre seu sistema e o sistema do concorrente. Quanto menos recursos
seu sistema utilizar para executar a mesma tarefa do seu concorrente,
maior será sua margem de lucro. Simples assim.
