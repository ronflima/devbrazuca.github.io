Por que C é uma linguagem simples?
==================================

Muita gente vê na linguagem C algo complicado, ou para malucos. Na
verdade, C é uma das linguagens mais simples que existem. E a…

------------------------------------------------------------------------

### Por que C é uma linguagem simples?

Muita gente vê na linguagem C algo complicado, ou para malucos. Na
verdade, C é uma das linguagens mais simples que existem. E a
simplicidade da linguagem C tem um preço a pagar.

Muita gente me diz que C é uma linguagem antiquada. E sou obrigado a
concordar com essas pessoas. Porém, mesmo sendo antiquada, C é uma
linguagem extremamente flexível e com princípios de funcionamento tão
simples que hoje é a alternativa para os sistemas embarcados dado o seu
baixíssimo *footprint*.

O fato de C ser leve, rápida e com pequeno *footprint* é efeito direto
da sua simplicidade. Vamos começar pelos tipos de dados. Os tipos de
dados não carregam em si informações sobre seus tipos, como ocorrem nas
linguagens mais sofisticadas, como Java ou Swift. O que isso quer dizer?
Isso quer dizer que um inteiro não carrega em si informações que o
identifiquem como um tipo inteiro. Assim, você não pode perguntar para
uma variável do tipo inteiro se ela é, de fato, do tipo inteiro.

Ou seja, o tipo não tem informação suficiente para permitir a
introspecção. Isso minimiza o peso da linguagem, mas tem um preço. Passa
a ser responsabilidade do programador garantir que determinado valor é
do tipo esperado em determinado contexto do software. Ou seja, é
possível que um determinado valor chegue a um ponto do seu programa sem
ser do tipo que você espera. E o resultado é catastrófico.

Mesmo os tipos estruturados da linguagem não permitem a introspecção. A
linguagem simplesmente não foi projetada para este fim. Isso aumenta a
responsabilidade do programador em garantir que os tipos certos cheguem
nos lugares certos.

A falta de introspecção da linguagem é evidente na necessidade dos
arquivos de cabeçalho, algo que vários programadores não conseguem
entender por que existem. A ideia dos arquivos de cabeçalho é informar
ao compilador quais os tipos corretos das funções que exportam.
Normalmente usam-se arquivos de cabeçalho para exportar tipos
estruturados e protótipos de funções. Os protótipos de funções indicam
ao compilador quais os tipos dos parâmetros e em quais posições estes
tipos são esperados. Sem isso, o compilador simplesmente gera código da
chamada da função sem se preocupar com isso.

Assim, o protótipo da função é uma forma de forçar a checagem de tipos
em tempo de compilação. Este é notoriamente uma das maiores limitações
da linguagem, e grande fonte de problemas de software. Quando surgiu, o
Java prometia eliminar este problema, algo que conseguiu com bastante
elegância. Ao tornar todos os tipos, mesmo os integrais, classes, a
linguagem consegue realizar verificações mesmo em tempo de execução, o
que é algo que simplifica o processo de desenvolvimento e agiliza a
correção de defeitos.

C é uma linguagem simples por que lhe falta muita coisa sofisticada que
existe nas linguagens modernas. Por exemplo, em C você não tem um
coletor de lixo, a não ser que você implemente o seu próprio. C deixa
para o programador toda a responsabilidade de liberação de recursos. O
vazamento de memória é um dos problemas mais comuns que existe no
desenvolvimento de aplicações em C. Normalmente, este problema é
detectado com *memory debuggers*, bibliotecas especializadas que
substituem as funções de alocação por funções que verificam o vazamento.
Algumas implementações da biblioteca STDC vem com depuradores de memória
embutidos, com o a GLIBC.

A falta de sofisticação da linguagem C, a sua simplicidade, faz com que
programadores novos tenham dificuldade no aprendizado. E não é para
menos: coisas como o operador endereço-de (&) confundem-se com o
operador relacional E (&&) e com o operador bitwise E (&). São coisas
completamente diferentes, mas que usam exatamente o mesmo símbolo.

O mesmo se diga com relação ao operador conteúdo-de (\*) e a
multiplicação (\*) juntamente com o declarador de ponteiros (\*). A
semântica é dada pelo contexto e muita gente não consegue discernir
quando usar o que.

Concluindo, C é uma linguagem simples. E a sua simplicidade é o seu
grande mérito e, também, seu grande problema.

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [August 10, 2015](https://medium.com/p/b5feae73233b).

<a href="https://medium.com/@ronaldolima/por-que-c-%C3%A9-uma-linguagem-simples-b5feae73233b" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
