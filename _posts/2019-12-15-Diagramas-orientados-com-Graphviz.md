---
layout: post
title: Diagramas orientados com Graphviz
subtitle: Ferramenta Porreta!
image: "https://cdn-images-1.medium.com/max/800/1*S0UJuuv0e_WjkHoxlPD20A.png"
author: ronaldo
categories: [Desenvolvimento, Dicas]
---

Se há algo chatíssimo de fazer é um diagrama, principalmente quando há elementos
demais para tratar. Quando você precisa adicionar um elemento novo, então, é um
Deus nos acuda! Se você usa um processador de textos, como o Word, é uma
dor-de-cabeça sem fim: adicionou uma linha que seja e tudo sai de formatação.

O fato é que existe uma ferramenta, muito antiga, que dá conta do recado:
[Graphviz](https://www.graphviz.org/)! Esta ferramenta é, na verdade, um
conjunto de intérpretes que executam uma linguagem simples, cujo resultado é um
diagrama — orientado ou não. A principal vantagem é que a linguagem é um arquivo
texto plano pé-de-boi. Mais simples impossível!

O resultado é um diagrama cujos elementos são automaticamente
organizados. Assim, você não precisa ficar colocando cada elemento na
mão, o que dá um trabalhão.

![Diagrama de Dependências do Zewo - Projeto Original](https://cdn-images-1.medium.com/max/600/1*jJTt3LJr9y6a933R7R0XHA.png)

O diagrama acima é o grafo de dependências dos componentes do Zewo, um projeto
open-source com o qual colaborei no passado. Se eu tivesse que fazer isso na
mão, com um Word que seja, ou com qualquer editor de diagramas atual, teria
arrancado os cabelos do sovaco para chegar neste resultado.

O Graphviz organiza os elementos de tal forma que o diagrama fique o mais
legível possível. Assim, se você alterar alguma coisa, ele reposiciona cada
elemento para você de forma simples e rápida.

A saída dos diagramas é você quem determina. Você pode gerar imagens desde JPGs
e PNGs até formados mais exóticos como VRML ou XLIB. Sim, webp é suportado.

A linguagem é super simples e não tem segredo algum. Ela é baseada em nós em
bordas por que considera que cada elemento é parte de um grafo, que pode ser
orientado ou não. O utilitário principal é o DOT e aqui está um exemplo:

```
    digraph EXAMPLE {
        A -> B -> C;
        C -> A;
        C -> END;
    }
```

O resultado do processamento deste diagrama simples é este:

![Diagrama](https://cdn-images-1.medium.com/max/800/1*Q4yPZXfDIoHoMrALjBU21g.png)

Agora, imagine que você queira que isso seja um diagrama de
transição de estados:
```
    digraph STATE {
        node [shape="box"]
        START [shape="point", fillcolor="black", style="filled", height=".5"];
        END [shape="doublecircle", fillcolor="black", style="filled", label=""];
        START -> A -> B -> C;
        C -> A;
        C -> END;
    }
```

E o resultado:

![Diagrama](https://cdn-images-1.medium.com/max/800/1*eQy03ufCu6F-0cvVMf86zg.png)

Para entender melhor a linguagem, [Há um
manual](https://graphviz.org/documentation/) no site da ferramenta. Você verá
que a linguagem é simples, rápida de aprender e cujo efeito é fenomenal.

O interessante é que a grande maioria dos editores de textos feitos para
programadores tem já a gramática da linguagem do DOT. Vim e Emacs são dois belos
exemplos. E a aplicação está disponível na sua distro linux favorita, com
versões disponíveis para macOS via *homebrew* e também para Windows. Se você usa
o Windows, recomendo usar o Graphviz no WSL.

Tá aí. Acabou seu sofrimento com diagramas.

Happy Coding!
