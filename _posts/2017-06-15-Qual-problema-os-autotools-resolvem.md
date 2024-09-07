---
layout: post
title: Qual problema os autotools resolvem?
subtitle: É bem mais complicado do que parece
image: "https://cdn-images-1.medium.com/max/800/1*AHOXgoPLadRw7C6htm8ZiA.png"
author: ronaldo
categories: [Programação]
---

Muita gente critica os makefiles por que consideram a sua sintaxe antiga e
inadequada. Só por que seu build system usa algo mais bonitinho, como javascript
ou XML, não quer dizer que seja um software simples. Na verdade, os sistemas de
construção de software tornaram-se bem sofisticados nos últimos anos e, com
isso, chegamos a um ponto no qual não há mais um sistema simples.

Num mundo que hoje tem o ANT, Maven, Grunt, Gulp e mais um tanto de *task
runners* e build support systems, os *autotools* acabaram ficando um pouco de
lado. Porém, trata-se de um conjunto de ferramentas absolutamente fantástico
para quem programa em linguagem C e vale a pena dissertar um pouco sobre.

#### Qual problema os autotools resolvem?

Houve uma época em que construir software era muito mais fácil. Normalmente o
software era criado para uma plataforma específica e era construído de forma
igualmente específica. Com a popularização dos sistemas de código aberto isso
mudou radicalmente a ponto de chegarmos a um entrave: como ter o ambiente
correto para compilar meu código de forma adequada, sendo que os sistemas são
altamente customizáveis?

Este é um problema complexo de resolver. Você nunca sabe o que há instalado no
sistema no qual seu código vai compilar. Será que todas as dependências estão
lá? Será que estas dependências estão todas instaladas nos lugares certos?

Isso fez com que os build systems tivessem que evoluir para algo mais dinâmico,
que investigassem o ambiente e que gerassem as instruções de construção de forma
apropriada. Até então o utilitário *Make* e suas variações como o NMake da
Microsoft, era o padrão de mercado. Porém, escrever makefiles de forma estática
já não atendia a demanda pois os sistemas se tornaram heterogêneos demais.

A saída foi criar um sistema que gerasse os makefiles de acordo com as
limitações ambientais: autotools. A ideia original era criar um ambiente de
compilação altamente configurável para o Projeto GNU e o seu sistema operacional
Hurd. Como tudo era escrito em C, é natural ver os autotools fortemente
atrelados a projetos escritos em C.

#### Configure and go

Os autotools são construídos por sobre as seguintes ferramentas:

-   interpretador de macros M4, uma linguagem relativamente simples e bastante
    limitada, porém suficientemente poderosa para realizar a geração de
    arquivos, busca por diretórios e verificações de sistema.
-   gerador de shell scripts Autoconf, que cria shell scripts com base em
    arquivos de macros M4. Os scripts gerados pelo autoconf são muito extensos e
    bastante completos, a ponto de realizar uma varredura completa em um
    determinado ambiente para determinar os melhores parâmetros de compilação.
-   gerador de makefiles Automake, que cria makefiles altamente configuráveis
    que são completados pelos scripts de configuração gerados pelo autoconf.

Existem outras ferramentas que fazem parte dos autotools, como o gerador de
documentação texinfo, ferramentas de suporte como o autoscan e autoheader e por
aí vai. Mas como este artigo não é um tutorial, não vou ficar discorrendo sobre.

Estas ferramentas trabalham em conjunto para analisar a sua árvore de código no
intuito de prepará-la para ser compilada em qualquer ambiente. O produto final
da análise são arquivos Makefile.in, que são templates de makefiles
especializados para a sua árvore de código, arquivos de shell script de suporte
e um shell script complexo chamado *configure*.

A função do shell script configure é varrer seu sistema coletando informações
que serão depois usadas para gerar os Makefiles. Uma vez gerados os makefiles,
basta executar algo como `make` para ver seu código compilando.

#### Conclusão

Se você trabalha com desenvolvimento de código em C para projetos de código
aberto, não faz mais sentido usar o velho *makefile* romanticamente escrito à
mão. Seu makefile, por mais expert que você seja no assunto, será incapaz de
verificar a contento o ambiente e adequar-se a ele.

Como os ambientes tornaram-se altamente heterogêneos devido às customizações, é
importante usar algum tipo de build system mais avançado do que o mero makefile.
Para quem trabalha com linguagem C, os autotools são uma excelente opção por se
tratar de um conjunto de ferramentas estável e confiável.
