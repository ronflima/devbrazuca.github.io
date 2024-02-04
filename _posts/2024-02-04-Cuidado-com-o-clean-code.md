---
layout: post
title: Cuidado com o Clean Code
subtitle: Nada é bala de prata
image: "https://images.pexels.com/photos/911758/pexels-photo-911758.jpeg"
author: ronaldo
categories: [clean code, desenvolvimento]
---

Vejo muita gente defendendo com unhas e dentes o livro de Bob Martin, [Clean Code](https://www.amazon.com.br/C%25C3%25B3digo-limpo-Robert-C-Martin/dp/8576082675/ref=sr_1_1?__mk_pt_BR=%25C3%2585M%25C3%2585%25C5%25BD%25C3%2595%25C3%2591&amp;crid=3FUVH5OIDGMBQ&amp;keywords=c%25C3%25B3digo+limpo&amp;qid=1707053266&amp;sprefix=c%25C3%25B3digo+limpo%252Caps%252C254&amp;sr=8-1&_encoding=UTF8&tag=devbrazuca-20&linkCode=ur2&linkId=75eb2e058315d013daa991acb4e8a88d&camp=1789&creative=9325"). Eu já li o livro e estou relendo o mesmo. É um guia interessante, porém não é uma instituição de verdades absolutas. Muita coisa que há ali pode não ser possível aplicar a determinados contextos e aqui está um pouco da minha opinião sobre o assunto.

## Não Há Bala de Prata

Vejo muitos desenvolvedores, principalmente os menos experientes, adotando o Clean Code a ferro e fogo. Como todo guia, é preciso ter em mente que o livro foi escrito de forma geral e a sua aplicação pode ser proibitiva dependendo do contexto. Assim como várias metodologias, é preciso ter uma visão crítica sobre o texto. Sem dúvida, o livro é valioso pois tratam-se das experiências de um grande desenvolvedor de software.

No entanto, é preciso ter senso crítico e saber quando quebrar as regras descritas no texto.

## O Contexto

O contexto no qual você está inserido é o que regula a adoção de qualquer metodologia ou forma de trabalho. Não adianta você forçar o uso de determinado método em uma cultura estabelecida, o que pode causar atritos e, consequentemente, problemas de cunho técnico e de aprendizado. Normalmente, empresas de desenvolvimento de software já usam determinado padrão que foi criado ao longo de anos de experiência em determinada área de conhecimento. E vários destes padrões vão, inclusive, contra as regras descritas pelo Clean Code. Tentar estabelecer o Clean Code neste contexto, forçosamente, quebrará anos de padronização e inserirá código alienígena na base de código da empresa, causando mais estragos do que benefícios.

Assim, é preciso ser racional no uso do Clean Code. Nem tudo o que está ali descrito é passível de uso dentro de determinado contexto. É importante avaliar como e quando usar as dicas valiosas de Bob Martin, nunca ignorando o contexto no qual você está inserido.

## O Dialeto

Várias linguagens de programação tem um dialeto bem estabelecido pela comunidade que as usa. Usar o Clean Code cegamente, ignorando o dialeto da linguagem, é perfeito para criar código alienígena que trará dores-de-cabeça na contratação de novos colaboradores: você terá de treiná-los para ignorar o dialeto da linguagem que eles conhecem.

Por exemplo, Go é uma linguagem cujo principal dialeto faz uso de variáveis de uma só letra, o que é condenado pelo Clean Code. Go indica o uso dessas variáveis em contextos muito bem definidos e tentar quebrar isso faz com que o seu código distancie-se de uma prática corriqueira usada pela comunidade que usa a linguagem. Ou seja, você está se distanciando de convenções adotadas por um grande número de pessoas porque simplesmente decidiu seguir cegamente um conjunto de regras.

## Leia o Clean Code

Veja, não estou dizendo, sobremaneira, você não deva adotar as dicas de Bob Martin. O que estou tentando dizer é que você precisa usar o livro como um guia e não como uma tábua de leis. Saiba quando ignorar as dicas pelo contexto do seu projeto. Use as práticas que fizerem sentido para você e saiba que não há bala de prata.

O fato é que a legibilidade do seu código depende muito mais das convenções que você e sua equipe de desenvolvimento adotarem do que as dicas de um livro. O uso do livro, sem dúvida, torna a criação de convenções muito mais simples, pois adiciona à equação toda a larga experiência de Bob Martin. E este é o motivo pelo qual eu indico a leitura do livro.

A minha sugestão é que você primeiro aprenda sobre as convenções adotadas pela comunidade que usa a sua linguagem de programação. Por fim, adote o Clean Code de forma a não ferir estas convenções. Assim, você terá um código legível e de fácil manutenção, precisando gastar menos recursos para treinar novos colaboradores na sua base de código.
