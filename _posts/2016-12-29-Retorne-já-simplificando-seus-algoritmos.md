---
layout: post
title: Retorne já: simplificando seus algoritmos
subtitle: Simplifique seus algoritmos e seja feliz
image: "https://cdn-images-1.medium.com/max/800/1*wfGjLviT7L5RzzE2Z7Bq4g.jpeg"
author: ronaldo
categories: [Desenvolvimento, Programação]
---

Academicamente, toda função precisa ter apenas uma única entrada e uma única
saída. Porém, não é incomum encontrarmos situações nas quais não é possível
continuar com o processamento dentro de um determinado trecho de código, levando
a decisões que evitam com que o fluxo normal siga adiante. Por exemplo, quando
validamos parâmetros contra valores inválidos, a função, ou método, realiza uma
série de testes que, se falharem, desviam o fluxo normal de processamento.

Se você seguir a recomendação acadêmica, sua função ou método torna-se um
emaranhado de decisões, tornando o código bem mais difícil de ler. Além disso, o
excesso de decisões torna seu código naturalmente menos eficiente pois pode ser
necessário realizar vários testes ao longo do fluxo de processamento para chegar
ao ponto de retorno, que ficará ao fim da sua função ou método.

#### Retorne já

O primeiro passo para simplificar seu código é retornar imediatamente, caso
alguma condição seja satisfeita para tal. Ao invés de testar esta condição
repetidamente, teste-a apenas uma única vez e retorne o quanto antes. O efeito
colateral de retornar imediatamente é dar à sua função ou método vários pontos
de saída. Porém, é bem melhor que escrever saltos incondicionais para um mesmo
ponto do código ou testar indefinidamente a mesma condição para finalmente
retornar.

Porém, ao retornar imediatamente, você precisa escrever menos código e, com
isso, simplificar enormemente o seu algoritmo.

#### Use lógica negativa

Ao invés de testar se algo está bom para seguir o processamento, faça exatamente
o contrário: se algo não estiver bom, saia imediatamente. A lógica negativa
testa se uma invariante no seu código é falsa ao invés de testar se ela é
verdadeira.

Assim você passa a ter condições de interromper o fluxo imediatamente,
escrevendo menos código e, com isso, diminuindo a probabilidade de adicionar
bugs ao seu sistema. Menos código é menos bug.

#### Não invente moda

Use a linguagem de programação do jeito que ela foi projetada. Não fique
inventando moda. Lembre-se: você não está participando de concurso de código
bonito, mas escrevendo um código que precisa funcionar, ser confiável, eficaz e
eficiente para resolver os problemas propostos. Ninguém quer saber se você é o
ultra master fodão do caralho para escrever código.

Procure entender como sua linguagem de programação funciona, quais são suas
premissas e quais são suas fraquezas. Exercite os pontos fortes da linguagem e
evite suas fraquezas. Por exemplo, a grande fraqueza da linguagem C é o
namespace poluído. Assim, criar tipos de dados ou funções globais com nomes
comuns é pedir para dar merda. Não preciso nem dizer o que acho das variáveis
globais em C, não é?

#### Defina suas invariantes

Quando estiver escrevendo código, defina quais são as suas invariantes. Se você
não sabe o que raio é uma invariante, aqui vai o conceito:

> Invariante: algo que você assume como verdadeiro dentro do contexto do seu
> software.

A partir do momento em que você assume que algo é verdadeiro, não é necessário
testar se este algo é verdadeiro. Por exemplo, se você escreve uma função que
receba um ponteiro válido, você assume isto como verdadeiro e pronto. Você não
fica testando a validade do ponteiro. É responsabilidade do chamador da função
fornecer um ponteiro válido.

Ao definir suas invariantes você, indiretamente, distribui responsabilidades
pelo seu software. No exemplo que mencionei, quem chama a função precisa
garantir que o ponteiro fornecido como parâmetro é válido. Se o ponteiro, por
algum motivo, for inválido, a função não é ativada.

Este pensamento faz com que você escreva menos código, menos checagens e, com
isso, escreva código com melhor eficiência.

Note, não estou dizendo que você precise abandonar verificações de integridade.
Nada disso. O que estou dizendo é que você assume que em determinado ponto do
seu código a informação está íntegra (invariante) e escreve o seu fluxo de forma
que naquele ponto em particular a informação é garantida estar íntegra, de
acordo com as constraints que determinam a validade dos dados.

O fato é que se os dados já foram validados, não há necessidade de validá-los
novamente. Mesmo mudanças de estado dos seus dados devem levar a invariantes
que, em determinado trecho de código, são verdadeiras.

#### Isole as seções críticas

Mesmo fazendo assunções que levam à criação das suas invariantes, há pontos no
código onde suas invariantes não podem ser verdadeiras, ou seja, as famosas
*seções críticas*. Este termo é comumente usado em software com várias linhas de
execução. Porém sua definição é muito ampla:

> Seção Crítica: trecho de código no qual suas invariantes não são verdadeiras.

Por exemplo, digamos que você tenha uma estrutura de dados mestre/detalhe como
uma nota fiscal. A sua estrutura, para ser válida, é uma nota com vários itens
de nota — pelo menos um item para fins de exemplo. Assim, a sua invariante
poderia ser descrita como "*a nota fiscal contém pelo menos um item com valor
que descreve a compra de um cliente"*. Porém, em determinado ponto do seu
sistema, quando criamos a nota fiscal, esta invariante não é válida pois durante
a criação há um momento no qual a nota não tem itens.

Ao isolar as seções críticas do seu código você consegue propagar suas assunções
de forma que o seu código torne-se muito mais simples de ser implementado, com
validações bem localizadas e sem a necessidade de replicar estas validações pelo
código afora. Validações replicadas provocam queda na eficiência e,
consequentemente, aumentam a possibilidade de problemas.

#### Menos código é melhor

Para concluir: menos código é melhor que mais código. Quanto menos código você
escreve, menor a possibilidade de erros, mais eficiente é seu software e mais
rápido ele executa. Se você escreve código demais, procure ver como simplificar
seus algoritmos.

Porém, pensar de forma eficiente é muito difícil. Simplificar seu código não é
fácil. É preciso exercitar-se, aprender como escrever a mesma coisa com menos
código, com menos chamadas de funções, métodos, empilhamentos. Isto exige grande
conhecimento da sua linguagem de programação e como ela otimiza o código final,
para que você tire proveito destas características.

Assim, nunca pare de estudar a sua linguagem de programação. Sempre há um
detalhe, um canto obscuro que passou despercebido e que dará a você mais
ferramentas para tirar proveito e escrever código cada vez mais eficiente.
