---
layout: post
title: Você sabe que caralhos é um closure?
subtitle: Abaixando o nível da conversa
image: "https://cdn-images-1.medium.com/max/800/1*4jXeHRPqKQz7VLiVhUewYg.jpeg"
author: ronaldo
categories: [Desenvolvimento, Programação]
---

O *closure* tem suas origens nas funções anônimas. A ideia era permitir que
código executável pudesse ser acessado de uma variável. Digamos que *x* é esta
variável. Assim, poder-se-ia fazer algo como:

`x()`

Assim, você consegue parametrizar não apenas dados, mas também ações. A
linguagem C implementa essa coisa através de ponteiros para funções, ou seja,
uma variável especial que recebe como valor o endereço de memória da primeira
instrução de uma determinada função. É possível usar este ponteiro para ativar a
função. Porém, esta solução tem um problema: você ainda precisa dar nomes às
funções para poder extrair delas o ponteiro.

Normalmente, quando se trabalha com programação orientada a *callbacks*, que é
isto que o *closure* permite em última instância, ter um nome único para uma
função dentro do seu *namespace* é algo indesejável. Foi assim que nasceram as
funções *lambda*, ou funções anônimas: você declara toda a função mas atribui
ela para uma variável ao invés de dar um nome; ou simplesmente a declara *in
place*, onde será usada.

Outra limitação dos ponteiros para função em C é que não é possível capturar
variáveis de outro escopo e usá-las dentro da função. Para isto, é necessário
que as variáveis sejam, obrigatoriamente, globais, ou pelo menos global na
unidade de tradução. Variável global, em C, é uma péssima ideia falando de
maneira geral, pois C conta apenas com o *namespace* global. Não há
especializações de *namespace* como acontece com linguagens mais novas como C++,
Java, Swift, etc. Por exemplo, seria possível fazer algo assim em Pascal, por
uma questão simples: Pascal permite que funções locais sejam declaradas,
enquanto C não permite. Uma função dentro de outra função pode usar as variáveis
declaradas no escopo superior. Assim, as variáveis não precisam mais ser
globais.

## Complicações

Normalmente toda linguagem que trabalha com *closure* permite que se declare
funções no escopo de funções. Porém, isto tem um preço: a manutenção da pilha
torna-se muito mais complexa, principalmente em ambientes nos quais o processo
conta com múltiplas linhas de execução. Imagine o seguinte cenário, muito comum
para quem programa em Swift para as plataformas Apple: seu método ou função
dispara uma atividade em outra thread, mas precisa chamar um *callback* ao
terminar. Este *callback* é executado sempre em uma determinada thread,
normalmente diferente da thread que fez todo o processamento antes de ativar
este *callback*.

O *callback* certamente será ativado bem depois do método ou função no qual foi
declarado ter retornado. Se este *callback* referencia, internamente, alguma
variável automática do escopo superior, temos um problema: as variáveis
automáticas são extirpadas da pilha tão logo o escopo na qual foram declaradas
deixa de ser válido. Mas, se a execução do *callback* ocorre bem depois do
escopo onde tudo foi declarado ter se tornado inválido, fica a pergunta: fodeu?

Não, não fodeu. O intérprete ou compilador da linguagem teve de ser adaptado
para que as variáveis automáticas que tivessem referência dentro de closures
tivessem estas referências tratadas como fortes, de forma a não se tornarem
inválidas quando o escopo no qual foram declaradas torna-se inválido. Assim, o
próprio *closure*, que também foi declarado em um escopo que torna-se inválido,
continua válido e tudo é executado de maneira correta.

O fato é que os intérpretes e compiladores tiveram de sofrer adaptações para que
pudessem suportar de maneira transparente a captura de escopo de objetos de uma
forma geral. Notem, *objeto* aqui não é uma instância de uma classe. É um objeto
reconhecível pelo seu intérprete ou compilador (variável, função, constante,
etc).

## Ponteiros para Função

Os closures são praticamente ponteiros para função, com a diferença que podem
capturar objetos que estejam em escopo superior ao que foram declarados, uma
característica das linguagens modernas.

Em alguns casos, a interoperabilidade com linguagens antigas faz com que os
closures sejam realmente tratados como ponteiros para função. Por exemplo, ao
integrar C com Swift, os *callbacks* em Swift são closures que são passados como
parâmetro para as funções em C que recebem ponteiros para função. Depois abra um
*playground* e experimente usar a função *qsort* da biblioteca STDC. Você verá
que o *callback* que é, de fato, um ponteiro para função, é traduzido para o
Swift como um *closure*.

## Programação Orientada ao Objeto?

Se olharmos bem o paradigma da POO, veremos que os *closures* basicamente são um
elemento estranho: são funções. Pode-se conseguir algo parecido em Java, por
exemplo, que não suporta funções, ao criar métodos de classe. Porém, linguagens
como Swift e C++ tornam-se uma miscelânea de funções e objetos interagindo. O
fato é que a utilidade dos *closures* é tão grande que, convenhamos, foda-se a
pureza da POO. Afinal nós, programadores, precisamos de ferramentas e linguagens
que possam estruturar da forma mais simples o nosso pensamento lógico.

Isto é assunto para outro artigo, porém a programação orientada ao objeto sofreu
bastante mudança ao longo dos anos, saindo do modelo *waterfall* que
contextualizava o momento no qual o paradigma foi criado, para o momento atual
no qual as mudanças fazem parte de qualquer sistema moderno.

Hoje em dia os sistemas tornam-se uma miscelânea de objetos e funções
interagindo entre si. Em alguns casos, várias linguagens interoperando dentro do
mesmo processo.
