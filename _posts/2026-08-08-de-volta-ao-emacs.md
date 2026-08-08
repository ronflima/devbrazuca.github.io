---
layout: post
title: "De volta ao bom e velho Emacs"
subtitle: "Ou como os editores modernos matam a produtividade"
IMAGE: "https://cdn.terminaltrove.com/m/6821b9d4-58a3-415d-8918-25718e22d606.png"
author: ronaldo
categories: [programação]
---

Depois de um bom tempo usando VSCode e depois o Cursor, eis que volto para o bom e velho Emacs. E aqui está um pouco do porque estou
voltando às origens.

## Experiência Plena

Para ter uma experiência completa no VSCode e Cursor, não usei os atalhos de teclado do Emacs. Eu queria me tornar fluente nos novos
editores de texto que eu havia selecionado. Criei templates, fiz customizações e tentei usar os editores da forma mais plena
possível.

Os pontos altos: o auto-complete, o agente logo ali na ponta dos dedos. Os pontos baixos: principalmente no Cursor, o acionamento da
IA com TAB me causou mais problemas do que resolveu meus problemas. Pelo hábito de usar o TAB para formatar o código, acabava
apagando código que havia acabado de escrever pois a IA decidia o que sugerir. Como o TAB é usado tanto para formatar quanto para
aceitar as sugestões da IA, o fluxo fica confuso e, no fim, passava mais tempo brigando com a IA do que colhendo os benefícios dela.

O VSCode tem um suporte espetacular a devcontainers. O suporte do Cursor é, no máximo, meia-boca. O Antigravity tem um suporte
simplesmente péssimo. Como eu uso dev containers e isso é parte essencial do meu fluxo de trabalho, acabei abandonando o Cursor e o
Antigravity por este motivo.

O que me fez abandonar o Cursor foi:

- Instável. Não era incomum travar, ou levar o meu PC a 100% de processamento (meu PC é um i7 com 32GB de RAM). 
- Não consegue se atualizar sozinho pois não consegue sobrescrever o arquivo Cursor.exe. O motivo é simples: ele não termina a
  execução do Cursor antes de atualizar, o que faz com que o arquivo não possa ser reescrito. No Windows, os arquivos são sempre
  abertos em modo exclusivo por padrão.
- O fluxo de trabalho com a IA é confuso e muito intrusivo. Ao contrário de entregar produtividade, entrega confusão. 

Assim, voltei a usar o VSCode. Para não ficar sem o meu agente, comecei a usar o Antigrativy CLI ao invés de usar o Cursor em modo
agente puro. O fato é que já pago por isso no Google Workspace e tenho acesso aos modelos que eu já usava no Cursor. 

## A Volta ao Emacs

Bom, comecei a sentir falta do foco que só o Emacs oferece: por ser um editor de textos simples, você faz tudo sem tirar a mão do
teclado. O engraçado é que isso força um foco que não consigo ter em outros editores de texto. O suporte a devcontainers é
igualmente bom no Emacs e dá para rodar agentes sem susto. Sempre fui mais produtivo nele, e por isso resolvi voltar às origens.

Sinto falta do Org Mode, um negócio sensacional para tomar notas no Emacs. Os modos para Graphviz e mesmo para as linguagens que eu
uso são muito maduros e estáveis. E nunca tive problemas de travamento, excesso de uso d CPU ou coisa parecida usando o Emacs. E o
melhor: a experiência em modo texto é praticamente igual à do modo gráfico.

## Volta ao Linux

E sim, estou considerando voltar ao bom e velho Debian. Cansei do Windows. Apesar de uma série de facilidades, como o Powershell,
cansei do sistema. Este texto foi escrito em uma máquina com 16GB de RAM e um processador Ryzen 3. A máquina roda Debian 13.6 de
forma lisa, sem travamento, sem excesso de consumo de recursos.

Eu cansei do Windows 11. Estou começando a construir um novo desktop, poderoso, que vai rodar Debian. Porque Debian? Porque eu gosto
da distro, sempre gostei. É a minha segunda distro favorita. Eu só não volto para o Slackware por conta do suporte do Steam Proton,
que funciona muito bem no Arch Linux e distribuições baseadas no Debian (Ubuntu, estou falando de você).
