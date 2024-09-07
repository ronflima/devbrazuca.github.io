---
layout: post
title: O Modelamento Relacional
subtitle: E por que ignorá-lo é uma péssima ideia
image: "https://cdn-images-1.medium.com/max/800/1*gPOuqhPzpLX9GLL0d4F2_w.jpeg"
author: ronaldo
categories: [Programação]
---

Vivemos num mundo que é regido, atualmente, pelo ORM. Muita gente deposita sua
fé cegamente no *Object-relational Mapping* e esquece-se de que, no fim, os
dados serão armazenados no velho banco de dados relacional.

# Por que o ORM é bom

Antes que me falem que estou metendo o pau no ORM, deixe-me dizer que eu uso
ORMs no meu dia-a-dia. É prático, é fácil de usar e economiza um tempo
miserável. E tem uma grande vantagem: permite que você escreva código que fica
independente do banco de dados.

No passado era necessário escrever um adapter e uma montanha de drivers para
fazer com que o código ficasse independente de SGDB. Era um saco, tomava um
tempo do inferno e todo adapter acabava ficando muito específico. Além disso,
era necessário criar um DDL para cada banco de dados. Migração? Tome DMLs
complexos.

O ORM elimina toda a trabalheira que dá manter um banco de dados relacional do
ponto-de-vista do developer.

# Por que você precisa entender o modelo relacional

Apesar de todos os benefícios do ORM, é importante conhecer-se o modelo
relacional. E o motivo é muito simples: existem alguns truques que só funcionam
para o modelo relacional e que são bem complicados de fazer com um ORM.

A verdade é que o ORM é construído sobre uma premissa muito simples: a
normalização dos dados. Mas, e o que acontece quando você precisa denormalizar
os dados por algum motivo? Até há alguns anos atrás os puristas metiam o pau na
denormalização. Hoje em dia a denormalização de dados é algo tão corriqueiro que
os bancos de dados vedetes são todos NOSQL, ou seja, trabalham basicamente com
dados denormalizados.

Entender o modelo relacional, portanto, te ajuda a modelar melhor seu grafo de
objetos, além de lhe dar ferramentas para criar elementos no banco de dados que
o permitem usar o melhor dos dois mundos.

# Relatórios, views e tabelas denormalizadas

Criar relatórios em sistemas é uma tarefa corriqueira. Quase todo sistema de
informação exige algum tipo de relatório para o usuário final. Porém, criar
relatórios usando um ORM pode ser simples, do ponto-de-vista de quem escreve o
código, mas normalmente leva a sistemas lentos pois os acessos podem tornar-se
complexos e envolver diversas entidades do banco de dados sem que o programador
tenha noção disso.

É neste quesito que alguns elementos do SGBD se sobressaem. As *Views* permitem
que os relatórios sejam gerados de forma simples, mesmo que sejam construídas
por sobre diversas tabelas. As views já tem o plano de acesso computado e não é
preciso que o database realize esta tarefa durante uma query. Por si só isto já
é uma excelente otimização. Sim, alguns SGDBs fazem cache de planos de acesso,
porém a view não precisa ter o plano de acesso calculado pois isto é feito
quando a mesma é criada no database.

Ao usar uma view, o acesso para gerar o seu relatório torna-se extremamente
simples e muito mais eficiente. Ao invés de criar um statement complexo, cheio
de outer e inner joins, basta executar um select simples. Do ponto-de-vista de
um ORM, basta realizar um filtro simples, sem quase nenhum código.

Pelo menos os ORMs com os quais já trabalhei não suportam views, pelo menos não
diretamente. É possível mapeá-las como classes do ORM, mas não é possível
criá-las como um elemento do ORM em si, ou seja, deixá-las para o ORM cuidar
delas.

Outra técnica interessante é o uso de tabelas denormalizadas para consumo de
informações. A principal vantagem é que toda a informação está lá, pronta para o
consumo, sem a necessidade de queries complicadas. A diferença com relação às
views, é que o acesso é muito mais rápido pois não é necessário buscar dados em
data files diferentes, algo que pode acontecer com uma view. O Oracle, por
exemplo, permite uma construção chamada de *materialized view*, que é uma view
que ocupa espaço em um data file. A *materialized view* é, na verdade, uma
tabela que mantém um *snapshot* de uma query. Infelizmente, precisa ser
atualizada para que o *snapshot* de dados reflita novas inserções, atualizações
e remoções.

A forma mais simples é manter estas tabelas denormalizadas atualizadas com
*triggers*. Pode-se, também, usar stored procedures disparadas por um script
cron para manter estas tabelas atualizadas. O principal conceito é que as
tabelas denormalizadas podem ser usadas por sistemas que precisam ter acesso a
dados rápido quando o volume é muito alto a ponto de inviabilizar uma query
direta no modelo relacional.

Este é um truque que é difícil de realizar com um ORM pois cria um grafo de
classes bem esquisito, com replicações. Na minha visão, o grafo de classes
precisa ser, necessariamente, um modelo dos dados sobre os quais a aplicação
trabalha. Os macetes para ganhar performance e minimizar tempos de acesso e
latência de rede são otimizações que não deveriam fazer parte do modelo de
negócio de uma aplicação, mas parte do modelo de implementação.

De toda forma, estes truques só são possíveis, hoje em dia, se há conhecimento
do modelo de entidades e relacionamentos sobre o qual os SGDBs clássicos são
construídos. Porém, quando falamos de NOSQL, o buraco é bem mais embaixo…

# NOSQL e ORM: um romance que não pode dar certo

Aqui está uma coisa esquisita: criar um ORM para um banco NOSQL. É quase como
forçar um cavalo a cruzar com uma vaca só por que os dois são quadrúpedes. A
premissa sobre a qual um banco NOSQL é construído é completamente diferente da
premissa sobre a qual um ORM é construído. Não há relacionamentos nos bancos
NOSQL. Por exemplo, o Cassandra, que é um banco NOSQL baseado em Big Tables, não
permite chaves estrangeiras por uma questão simples: as tabelas podem ser
distribuídas em várias máquinas através de uma técnica chamada de *sharding*.

Com o MongoDB isto também pode acontecer, ou seja, uma árvore inteira pode ser
distribuída por um conjunto de máquinas. Isto torna a atualização de
relacionamentos entre informações algo custoso, complexo e suficientemente lento
para ser parte de um database deste tipo. No caso específico do MongoDB, a coisa
ainda é mais complicada: o *schema* do banco de dados não precisa ser criado *a
priori* para que as informações sejam persistidas.

Como o ORM foi construído para um mundo de objetos e relacionamentos, usar um
NOSQL por baixo disso é uma tarefa muito complicada. Existem já adapters para
ORMs, mas imagino o quanto isso deve ser complicado *under the hood,*
principalmente para manter as atualizações em cascata entre entidades em
composições.

A própria sigla do ORM já dá uma visão do que para que serve a ideia: mapeamento
de objetos e relacionamentos. Ou seja, se não há relacionamento, como mapear a
coisa toda? É possível? Sim, é possível. Mas a que custo?

# Adapters

Bom, antes de ir vale a pena lembrar de um *design pattern* muito útil quando se
pretende suportar diversos bancos de dados na mesma aplicação. Basta fazer com
que todo o acesso seja feito através de um *adapter*. Isto faz com que todo o
acesso ao SGDB seja isolado em módulos bem definidos, fazendo com que o restante
da sua aplicação permaneça independente do banco de dados.

Esta é, na verdade, uma técnica bastante antiga e dispendiosa em termos de
desenvolvimento, pois os adapters funcionam de forma muito específica, sendo
muito dependentes do domínio da sua aplicação. Sim, é possível generalizar para
que os adapters retornem objetos genéricos, como listas de dicionários por
exemplo.

Por que estou falando disso? Trata-se de uma alternativa boa aos ORMs quando os
ORMs não atendem às necessidades. Note: não estou falando para você não usar
ORMs. O que estou dizendo é que os ORMs não conseguem cobrir todos os cenários.

Happy Coding!
