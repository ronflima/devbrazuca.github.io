---
layout: post
title: Complicóquio da desenvolveção
subtitle: Ou como complicar desnecessariamente seu projeto
image: https://cdn-images-1.medium.com/max/800/1*6ZVJuYVMTKs4Spoma6gObQ.jpeg
author: ronaldo
categories: [Desenvolvimento, Programação, Tecnologia da Informação]
---

Quando comecei a programar, lá pelos idos de 1988, a tecnologia era bem mais
simples. A linguagem do *momento* era o BASIC. Os caras realmente bacanas
programavam em COBOL. Os dados eram salvos em arquivos sequenciais por um motivo
simples: o *storage* eram fitas K-7.

De lá para cá a tecnologia andou, complicou-se e tornou-se bem mais sofisticada.
As linguagens que existem hoje são bastante sofisticadas, com frameworks
complexos e completos que fazem praticamente tudo. Apesar das facilidades que
existem hoje em termos de IDEs, ferramentas, etc, há quem goste da complicação:
código complicado, intrincado, com alto nível de complexidade, acoplamento,
utilização de conceitos avançados para resolver problemas triviais e por aí vai.
E é sobre a complicação que trata este artigo.

Hoje as principais linguagens e plataformas têm à sua disposição gerenciadores
de pacotes. À primeira vista uma excelente ideia pois permite reutilizar código
pronto, testado e validado. Porém, há o lado negro da força: muita gente usa
componentes de software simplesmente por que quer usar, sem argumentos técnicos
suficientes que justifiquem criar uma dependência extra no projeto.

O problema aqui não são os gerenciadores de dependência ou pacotes. Nada disso.
O problema é usar um canhão para matar um mosquito. Por exemplo, quem programa
em Swift para iOS conhece a famosa (Alamofire)[https://github.com/Alamofire/],
um framework de conectividade que simplifica bastante a escrita de código que
necessite de acesso a um web service, apesar da biblioteca ser muito mais do que
somente isto. Trata-se de um framework sofisticado, muito completo e muito bem
escrito. Porém, para tarefas triviais, como recuperar imagens de um servidor ou
carregar dados simples através de protocolos bem conhecidos como o HTTP, a
Alamofire torna-se um tiro de canhão. NSURLSession faz tudo isso sem muito
*boiler plate*, e com bastante eficiência. Diga-se de passagem, a Alamofire é
construída por sobre o Cocoa e usa o NSURLSession internamente.

Não estou criticando a Alamofire, muito antes pelo contrário. Estou apenas
usando-a como exemplo para demonstrar como é comum o uso de canhões para matar
camundongos. O uso ostensivo de pacotes externos leva a um problema sério com as
dependências: quando é necessário fazer upgrade de linguagem ou algum tipo de
migração, as dependências causam um efeito negativo que acaba por aumentar a
carga de trabalho. Se foram devidamente atualizadas pelos desenvolvedores,
maravilha. Caso contrário você deverá fazer a atualização por sua própria conta
e rezar para o desenvolvedor adicionar seu pull request à base de código.

Exemplos? Veja o Swift. Agora, com o Xcode 8 livre e à solta, ou você usa Swift
2.3 ou está no sal. Se o seu projeto usa Swift 2.2, a versão máxima suportada
pelo Xcode 7.3.1, você será forçado a fazer o upgrade da sua base de código para
continuar usando a nova versão da ferramenta de desenvolvimento da Apple.
Entendeu onde o problema da dependência bate?

O problema das dependências não é novo. Na verdade, sempre que seu código
depende de uma biblioteca de terceiros, fazer upgrade é sempre um problema
complicado de ser resolvido. Por exemplo, quando trabalhava com unix, era comum
depender das bibliotecas de acesso a dados da Oracle. Alguns clientes, no
entanto, usavam versões de unix mais novas que as suportadas pela Oracle e fazer
o upgrade do software para estas versões de unix era sempre um problema
complicado de resolver. Em alguns casos era necessário esperar vários meses até
que a Oracle começasse a suportar determinada plataforma.

O fato é que hoje em dia, com a facilidade que há em usar software de terceiros,
há developers que usam componentes de forma quase irresponsável. Por um lado o
seu desenvolvimento anda mais rápido, é mais produtivo. Por outro, upgrades
tornam-se dores-de-cabeça infindáveis com problemas de dependências, projetos
que não são mais mantidos e por aí vai.

Assim, ao invés de partir de cara para adicionar uma dependência no seu projeto,
o primeiro passo é verificar se a linguagem ou framework que você já usa faz o
que você precisa. Se não fizer o que você precisa e se isto for imprescindível
para o seu projeto, tenha a consciência de adotar o componente não apenas como
uma dependência do seu projeto mas também como parte da sua base de código, ou
seja, é necessário passar a manter o componente. Caso contrário, você terá um
componente que poderá ser abandonado pelo desenvolvedor e ficará às voltas com
problemas difíceis de resolver, principalmente quando for necessário realizar um
upgrade da sua base de código.
