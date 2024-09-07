---
layout: post
title: "Powershell: tornando o Windows mais developer friendly"
image: https://cdn-images-1.medium.com/max/800/1*5xZG6DQp4EXpfO-W9jqaTQ.png
author: ronaldo
categories: [Programação]
---

Depois que voltei a programar para Windows, saí explorando o novo
sistema operacional da Microsoft, o Windows 10. Não me surpreendi.  No
entanto, este artigo não tem haver com meter o pau no Windows, mas
para falar bem do *powershell*.

Uma coisa que sempre me incomodou no Windows foi a falta de uma
linguagem de scripting nativa que permitisse a simples automação de
tarefas. O interpretador de linha de comando padrão usava a sintaxe
dos arquivos BAT que, convenhamos, é uma grande bosta mole. Sim, é
possível automatizar uma penca de coisa com arquivo BAT, mas muitas
vezes a complicação do código é tanta que você termina programando um
utilitário numa linguagem de programação mais decente.

Lá pelo Windows 95 a Microsoft inventou o Windows Scripting Host, algo
que permitia escrever scripts em VBscript ou Javascript. Aí sim a
brincadeira começou a ficar mais séria. No entanto, grande parte dos
developers desconhecem o WSH e essa tecnologia meio que não vingou,
apesar de ser excelente. Eu usei pesadamente o WSH, principalmente
para implementar scripts de login no Windows Server.

Apesar de vir instalado em virtualmente todas as versões do Windows
depois do Windows 95, o WSH não tinha um shell próprio e dependia do
interpretador de comandos do DOS, o que é uma lástima. Sim, era
excelente escrever scripts de build, automação de login, mas ainda
assim era preciso rodar tudo dentro de um shell do DOS.

Bem, tempos depois a Microsoft inventou o Powershell, um shell que é
possível programar numa linguagem muito parecida com o C\# e que tem
acesso a muita funcionalidade interessante. Agora sim a brincadeira
ficou séria.

Fiz alguns scripts de automação no Powershell. Não é difícil aprender
a linguagem de programação, principalmente se você já programa em
C\#. O shell é bem interessante e a automação que ele permite é,
igualmente, interessante. Venho automatizando algumas tarefas no
Windows usando o Powershell e notei o quanto isso é mais developer
friendly do que as soluções anteriores.

Antigamente eu costumava instalar um bash no Windows para não depender
das soluções de automação da Microsoft que, na época, eram muito
ruins.  Porém, com o Powershell não penso em enfiar um bash no meu
Windows visto que posso escrever scripts usando-o que serão melhor
integrados ao ambiente e, consequentemente, serão mais poderosos e
simples de escrever.

Se você desenvolve para Windows aprenda o Powershell. Você criará boas
ferramentas que estarão bem integradas ao Windows e que te
economizarão um monte de tempo.

Happy Scripting!

