Protocolos: evitando herança múltipla
=====================================

É para isso que existem os protocolos…

------------------------------------------------------------------------

### Protocolos: evitando herança múltipla

#### É para isso que existem os protocolos…

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*9Lvpct1eq9cjBgFWI2wJ3g.jpeg" class="graf-image" />
</figure>Imagine a seguinte situação: você tem uma classe que é composta
por uma série determinada de métodos. Porém, ela tem alguns
comportamentos semelhantes a outra classe que está em outra hierarquia.
Digamos ainda, que você queira escrever um código que ative métodos de
ambas as classes, mesmo que estejam em hierarquias diferentes, mas de
forma transparente, polimórfica.

A linguagem C++ resolveu este problema com a herança múltipla, ou seja,
bastaria fazer a classe fazer parte de duas ou mais hierarquias para que
atendesse aos requisitos de interface necessários para que fosse usada
de maneira polimórfica e transparente. Por um tempo isto foi bom, até
que começaram a aparecer problemas: mudanças em uma hierarquia começavam
a bagunçar a outra. Métodos comuns nos ancestrais eram sobrescritos
inequivocadamente nos descendentes. E estava feita a bagunça.

Como o Objective C e, agora, a linguagem Swift resolveram este problema?
Protocolos. Os protocolos estão para o Objective C e o Swift assim como
as interfaces estão para o Java. Trata-se de um mecanismo simples que
evita toda a confusão da herança múltipla, algo relativamente comum
quando se programa em C++.

[View original.](https://medium.com/p/16c850a7a518)

Exported from [Medium](https://medium.com) on December 25, 2020.
