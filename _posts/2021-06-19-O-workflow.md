---
layout: post
title: O workflow da sua aplicação
subtitle: Uma máquina de estados para lá de complexa
image: "https://images.pexels.com/photos/1181311/pexels-photo-1181311.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260"
author: ronaldo
categories: [Desenvolvimento,Software]
---

A coisa mais complexa que existe em uma aplicação é seu workflow, ou seja, o seu
fluxo de operação. Toda aplicação acaba implementando um fluxo absolutamente
longo e complexo, difícil de documentar e, normalmente, bem complexo de manter.
E, até hoje, nunca vi um framework, ou uma forma simples de descrever em uma
linguagem de programação este fluxo. 

Existem tentativas que quase chegaram lá. O React, com seus redutores, quase
chegou lá. Fluxos complexos, cheios de branches de execução ainda são um grande
desafio, mesmo facilitados por frameworks modernos. Mas porque é tão difícil?

# Milhares de Estados, Milhares de Transições

O primeiro problema da máquina de estados da sua aplicação reside na quantidde
de estados e transições possíveis. São tantos estados e tantas transições que
isso torna o trabalho de manutenção disso tudo algo hercúleo. Cada estado cria
uma quantidade enorme de possibilidades. 

Cada estado permite transitar para outro de acordo com uma série de invariantes.
Se essas invariantes são falsas, a transição não é permitida e você pode chegar
a becos sem saída nos quais não se consegue transitar para outro estado. E estes
são problemas complexos de resolver e cuja resolução pode causar efeitos
colaterais indesejáveis e, até mesmo, falhas de segurança no seu software. 

Os estados, e suas respectivas transições, criam um grafo complexo que pode
conter diversos loops, criando dependências temporais entre componentes do seu
software. Essas dependências nem sempre são evidentes e podem levar a problemas
dos mais variados tipos. 

