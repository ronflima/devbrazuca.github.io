POO Moderna
===========

Entendendo os principais conceitos.

------------------------------------------------------------------------

### POO Moderna

#### Entendendo os principais conceitos.

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*vLadxMniF0KW0HWeGkipJw.jpeg" class="graf-image" />
</figure>Em outros artigos eu discuti um pouco de como a forma original
de aprender POO estava desatualizada e o quanto a POO é complicada. Bem,
está na hora de explorarmos os conceitos principais desse paradigma
interessante.

#### Programação Orientada ao Objeto é um paradigma

POO não é uma linguagem e muito menos uma tecnologia. Trata-se de um
paradigma, um modelo de programação. Assim, é possível usar a POO em
virtualmente qualquer linguagem de programação, mesmo aquelas que não
suportam diretamente este paradigma.

Por exemplo, a Win32, a antiga API de programação de baixo nível do
Windows é escrita integralmente em linguagem C e é totalmente orientada
ao objeto. Note bem: eu disse C e não C++. C é uma linguagem
*procedural* e não suporta diretamente a orientação ao objeto. 

A
<a href="https://github.com/ronflima/feijuca" class="markup--anchor markup--p-anchor">biblioteca feijuca,</a>
que escrevi com meu amigo Daniel Soares, é integralmente feita em C e é
orientada ao objeto. 

O que quero dizer é que você pode aplicar os conceitos da POO em
qualquer linguagem. Obviamente que é importante respeitar-se as
limitações da linguagem. Por exemplo, na minha
<a href="https://github.com/ronflima/feijuca" class="markup--anchor markup--p-anchor">biblioteca feijuca</a>
eu não tentei mimetizar as linguagens orientadas ao objeto visto que
isso levaria a um código virtualmente impossível de ler. 

Quando uma linguagem suporta a POO ela o faz permitindo a descrição
explícita de classes e objetos sintatica e semanticamente. C é
procedural e, por este motivo, não tem suporte à sintaxes especiais que
permitam que um objeto seja declarado. No entanto, nada impede que você
programe orientado ao objeto em C. Leia a minha bibliotequinha e você
vai entender.

#### Classes e Objetos

Estas são as fundações da POO: as classes. As classes definem um
*modelo* da informação que precisa ser processada pelo seu programa.
Assim, em uma classe você determina quais informações serão armazenadas
e *como* estas informações serão manipuladas. Inclui-se aqui a validação
dessas informações, a forma correta de construir-se um objeto e regras
de dependência com relação a outras classes.

Entenda a classe como o *modelo* sobre o qual você criará os dados que
serão processados pelo seu programa, ou seja, a classe determina o que é
a sua informação e o que fazer com ela. Porém, você pode ter diversas
informações similares que seguem o *mesmo modelo*. Essas informações
similares são os *objetos*, ou seja, são a representação *real* da sua
classe.

Para entender essa abstração vamos a um exemplo. Imagine que você queira
montar um cadastro de nomes bem simples que contenha o nome e o
sobrenome das pessoas. Você chegou a um *modelo* como este:

    MODELO PESSOA
        NOME: CARACTERES
        SOBRENOME: CARACTERES
    FIM-MODELO

Estou usando uma meta-linguagem para fins didáticos. Entenda que o
MODELO é a nossa classe, ou seja, criamos uma classe de informações
chamada PESSOA, que contém dois campos importantes: NOME e SOBRENOME. É
um registro simples de dados.

Ao criar informações com base neste modelo, digamos para *Thomas
Anderson* e para *Douglas Smith*, dizemos que temos dois *objetos*: um
para Thomas Anderson e outro para Douglas Smith.

Em termos técnicos, uma informação criada com base em uma classe é uma
*instância* dessa classe. Isto significa dizer que o objeto Thomas
Anderson é do *tipo* PESSOA. Se eu comparasse Thomas Anderson com outro
modelo, por exemplo, o AGENTE, veria que a comparação resultaria em um
resultado falso pois Thomas Anderson é uma PESSOA e não um AGENTE.

Assim, a classe define o que é a informação e o objeto é a representação
de uma informação com base na classe que a definiu. 

Porém, a definição da classe não se limita a apenas determinar quais os
dados que a compõem. Na programação orientada ao objeto, você também
define operações que efetivamente alteram o estado interno de um objeto.

  

[View original.](https://medium.com/p/792ccbc9e40b)

Exported from [Medium](https://medium.com) on December 25, 2020.
