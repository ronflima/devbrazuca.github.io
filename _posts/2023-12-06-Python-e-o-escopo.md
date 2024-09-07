---
layout: post
title: Python e o escopo
subtitle: Algumas dicas interessantes
image: "https://images.pexels.com/photos/6091168/pexels-photo-6091168.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
author: ronaldo
categories: [Programação]
---

O entendimento do escopo é sempre confuso nas linguagens de programação. Em
linguagens que permitem a declaração aninhada, então, isso fica ainda mais
confuso. Portanto, vamos falar um pouco do escopo, focando na linguagem Python.

O escopo é limitado pelo espaço de nomes. E é importante ter em mente este
conceito antes de nos adentrarmos na parte legal do código. 

# Espaço de nomes

O **espaço de nomes**, como o próprio nome diz, é um espaço que delimita a
declaração de nomes. Assim, determinado nome é conhecido somente dentro de
determinado "espaço". Para que seja possível acessar o nome dentro de um espaço,
é necessário, portanto, referenciar-se ao espaço que contém o nome desejado. 

Por exemplo, digamos que você criou um espaço chamado "validations" e dentro
deste espaço você declarou uma função chamada "cpf" que valida um CPF. 

Para referenciar a rotina "cpf" você, portanto, precisa referenciar o espaço que
contém a rotina:

```
validations->cpf
```

Note, esta não é uma sintaxe de Python. Estamos discutindo o conceito apenas. 

## Como Python Organiza o Espaço de Nomes

O espaço de nomes é organizado por pacotes e módulos. Os pacotes são módulos que
contém outros módulos. Um módulo contém um espaço de nomes no qual objetos da
linguagem são declarados. 

Ao invés de descrever em detalhes como isso funciona, é melhor que você leia
[este excelente
artigo](https://docs.python.org/3/reference/import.html#packages) existente na
documentação do próprio Python.

Para fins da nossa discussão, o importante é que você saiba que o módulo limita
um espaço de nomes. Um pacote, por outro lado, por permitir uma hierarquia de
módulos, descreve uma hierarquia de espaços de nomes. 

# Escopo global

Como o espaço de nomes é determinado por um módulo, não existe, de fato, um
"escopo global". A ideia de "global" aqui é limitada dentro de um módulo. Claro,
o sistema de importação do Python permite que você traga ao espaço de nomes
atual um outro espaço de nomes, através da importação de módulos.

A principal vantagem desta forma de organização imposta pela linguagem é que
isso diminui substancialmente a colisão de espaços de nomes, um problema muito
conhecido de quem programa em C.

Quando você cria algo no "escopo global", este "algo" fica disponível em todo o
escopo de um módulo. Vamos a um pequeno exemplo:

```
def bar():
    print('foo')

def thing():
    bar()

thing()
```

Ambas as funções `bar` e `thing` estão no escopo global. Isso torna possível
referenciá-las dentro do módulo. Pode não ser lá muito evidente, porque todo
programador Python está mais do que acostumado com esse tipo de construção. 

Isso fica ainda mais evidente quando referenciamos uma variável em outro escopo.
Por exemplo: 

```
foo = 'foo'

def bar():
    print(foo)

bar()
```

Neste caso, estamos referenciando a variável `foo` dentro da função `bar`.
Porém, `foo` está declarada no escopo superior. Assim, é possível referenciar
esta variável dentro do escopo de `bar`.

No entanto, se precisarmos mudar o valor de `foo` dentro de `bar` teremos
problemas:

```
foo = 'foo'

def bar():
    foo = 'bar'
    print(foo)

bar()
print(foo)
```

Ao executar este trecho de código, você verá algo como:

```
bar
foo
```

Mas... Mudamos o valor de `foo` dentro de `bar`! Isso aconteceu porque foi
criada, dentro do escopo de `bar`, outra variável local chamada `foo`, que não
tem nenhuma relação com a variável global `foo`. 

Na prática, isso quer dizer que ao invés de uma, temos **duas** variáveis `foo`,
uma em cada escopo. 

Para corrigir este código, é necessário realizar a seguinte alteração:

```
foo = 'foo'

def bar():
    global foo
    foo = 'bar'
    print(foo)

bar()
print(foo)
```

Agora a saída deste programa será:

```
bar
bar
```

A declaração `global foo` determina que a variável `foo` referencia-se a uma
variável dentro do escopo global do módulo sob exame. Assim, ao alterar o valor
da variável dentro de `bar`, isso altera o valor, inclusive, fora do escopo de
`bar`.

Vamos complicar o nosso código um pouco mais. Digamos que `bar` é uma função
declarada dentro do escopo de outra função chamada `thing` e é retornada por
`thing`. Agora, `bar` referencia-se a uma variável que é local a `thing`. O
código será algo assim:

```
def thing():
    foo = "foo"

    def bar():
        print(foo)

    return bar

thing()()
```

Mas, e se quisermos mudar o valor de `foo`? 

```
def thing():
    foo = "foo"

    def bar():
        print(foo)
        foo = 'bar'
        print(foo)

    return bar

thing()()
```

Se você teve a curiosidade de executar este exemplo, verá que isso dará um erro.
O fato é que `foo`, dentro de `bar` é uma variável local e não a variável
declarada em `thing`. A linha `foo = 'bar'` faz duas coisas:

- declara uma variável local `foo`
- associa o valor `bar` à esta variável

Para corrigir este erro, é necessário dizer ao Python que `foo` é uma referência
a um escopo acima de `bar`:

```
def thing():
    foo = "foo"

    def bar():
        nonlocal foo
        print(foo)
        foo = 'bar'
        print(foo)

    return bar

thing()()
```
Agora sim! A variável `foo` é declarada como sendo não-local ao escopo de `bar`
e, com isso, conseguimos referenciar o escopo superior. 

# Dicas Finais

Sugiro fortemente que use com parcimônia a referência a objetos entre escopos.
Esta é uma fonte interminável de problemas. Este tipo de coisa é comum quando
você escreve _decorators_ em Python.

É importante ter em mente como o escopo funciona para evitar problemas cabeludos
no seu código. 
