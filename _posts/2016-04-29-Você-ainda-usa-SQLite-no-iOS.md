---
layout: post
title: Você ainda usa SQLite no iOS
subtitle: Existe coisa melhor do que escrever select na mão.
image: https://cdn-images-1.medium.com/max/600/1*Gm-OI6Z9WZOBj6vqnw5K0g.png
author: ronaldo
categories: [Programação]
---

Muitos programadores iOS ainda insistem em usar SQLite como storage
dos seus aplicativos sem se dar conta de que existe algo muito melhor,
mais confiável e que já traz uma série de funcionalidades prontas e
bem integradas ao Cocoa Touch.

Sim, é válido usar o SQLite para salvar suas coisas e organizar a
persistência do seu app. Porém, é preciso escrever muito *boiler
plate* *code* para iniciar o database, ler e salvar coisas. Além
disso, coisas como *undo, redo* e garantia de salvamento se tornam
tarefas enfadonhas com o SQLite, exigindo toda uma camada de código
chatíssima de ser feita e que, via de regra, acaba virando um monte de
código repetido para cada projeto.

Sim, meus caros amigos, existe coisa melhor do que o SQLite. O mais
curioso é que o driver padrão para salvamento de dados é justamente o
SQLite. Estou falando de uma tecnologia do Cocoa e Cocoa Touch chamada
**Core Data**. Antes de ir adiante, permitam-me discorrer sobre o que
o Core Data **não é**: um banco de dados.

O Core Data não é um banco de dados. Tampouco pode-se considerar o
Core Data um ORM. O ORM é usado para mapear um banco de dados
relacional para um grafo de objetos, compatibilizando os dois
modelos. O Core Data não faz isso. Na verdade, o Core Data implementa
um grafo de objetos com a possibilidade de persistir este grafo de
alguma forma. Como é projetado em camadas de maneira desacoplada, uma
mudança no esquema de dados não reflete uma mudança no grafo de
objetos, como o faria um ORM.

O Core Data suporta dois tipos de *store*: os stores atômicos e os
stores incrementais. Os stores atômicos são úteis quando é necessário
salvar todo o grafo de uma vez e quando o grafo é suficientemente
pequeno. O XML é um exemplo de store atômico. O store incremental é
usado para grandes volumes de dados, sendo que um dos padrões é o
store baseado em SQLite.

O fato é que os conceitos que envolvem o Core Data são um pouco mais
complexos devido aos cenários para os quais o mesmo foi adaptado para
funcionar. A própria Apple diz que o Core Data é uma tecnologia
sofisticada e sou obrigado a concordar com eles. E como toda
tecnologia sofisticada, há suas pegadinhas.

Mas, vale a pena aprender a usar o Core Data? A resposta é um
estrondoso **sim*.*** As vantagens oferecidas pela tecnologia são
muito superiores à dificuldade inicial de aprender a usá-la. Algumas
coisas que o Core Data lhe dá de graça:

- controle de undo, redo automático, com integração ao *shake to undo*
    do iPhone, sem necessidade de *boiler plate code*.
- garantia de persistência quando o aplicativo é desligado pelo
  usuário.
- *lazy load* dos dados, o que economiza memória e outros recursos.
- *faulting*, um recurso que permite que uma instância seja carregada
  da persistência uma única vez, independente do contexto onde isso
  acontece.
- Migração de dados automatizada, com inferência de mudanças em casos
  simples e alterações simplificadas em casos mais complexos.

Esta é uma lista tímida e pequenina dos benefícios, esta é a verdade.
Estes são os pontos que considero os mais importantes da tecnologia,
com especial atenção ao Lazy Load e ao Faulting.

O Lazy Load é tão fantástico que se um objeto tem uma dependência de
outro através de uma propriedade, a propriedade só é carregada quando
alguém faz uma referência a ela através de um getter ou setter. Isso
pode parecer pouco, mas economiza um bocado de memória, fazendo com
que a gestão do grafo de objetos seja o ponto alto do Core Data.

O Faulting é outra coisa fantástica. Se você alterar um objeto em um
contexto e depois usá-lo em outro, as alterações que você realizou já
serão acessíveis pois não é necessário recarregar nada da persistência
pois o Core Data garante que um objeto deserializado sempre será o
mesmo, não importa onde você o obteve. Assim, você pode obter uma
instância em um controller e depois em outro controller que é
garantido serem exatamente a mesma instância.

Outra coisa bacana é o editor de modelo de dados. É todo visual. Você
cria as classes, cria relacionamentos, atributos, validações e mais
uma série de coisas sem a necessidade de escrever absolutamente
nenhuma linha de código. Por outro lado, também é possível definir
toda a sua estrutura de classes por código.

As buscas no Core Data são feitas através de *fetch requests.* Você
pode ordenar os resultados da mesma forma como ordena arrays, através
de sort descriptors. A filtragem dos resultados é obtida através de
*predicates*. Ou seja, toda a tecnologia está muito bem integrada ao
restante do Cocoa e do Cocoa Touch.

Efetivamente programa-se integralmente em Objective C ou Swift, sem a
necessidade de escrever algo numa linguagem de consulta. O código,
portanto, fica bem homogêneo, sem strings com instruções como *select*
ou *update*.
