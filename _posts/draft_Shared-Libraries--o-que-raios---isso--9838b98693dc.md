Shared Libraries: o que raios é isso?
=====================================

Entenda o que são e como funcionam

------------------------------------------------------------------------

### Shared Libraries: o que raios é isso?

#### Entenda o que são e como funcionam

<figure>
<img src="https://cdn-images-1.medium.com/max/2560/1*o1-FXMbTb6yT14bM9EjxmA.jpeg" class="graf-image" />
</figure>

#### Definições

Vamos começar o artigo definindo o que diabos é uma *shared library*.
Basicamente é um conjunto de rotinas que podem ser usadas por diversos
executáveis distintos. O que diferencia as *shared libraries* das
bibliotecas de rotina estática é a *ligação*: os símbolos no executável
que se referem à *shared library* são resolvidos em tempo de execução ao
invés de ser durante a compilação. E isso tem consequências
interessantes.

A primeira consequência é o tamanho do executável final. O executável é
menor, o que facilita o seu *deployment*. Com parte das rotinas está na
biblioteca compartilhada, o executável não precisa ter todo o código
enfiado dentro de si. 

A segunda consequência é uma decorrência da primeira: você pode
atualizar somente parte do seu sistema ao atualizar somente as rotinas
que estão na biblioteca, ao invés de atualizar todo o seu sistema.

Existem prós e contras em relação ao uso das bibliotecas dinâmicas. Sim,
as *shared libraries* também são chamadas de bibliotecas dinâmicas. 

#### Prós e Contras

Vale a pena usá-las? Depende do contexto. É preciso avaliar bem quando
usar ou não uma biblioteca compartilhada. O primeiro contra refere-se ao
*setup* do ambiente de execução. É preciso fazer com que o *linker*
saiba onde está sua biblioteca para que seu executável seja carregado
com sucesso.

Nos sistemas *unix like*, isto é feito ajustando-se a variável de
ambiente `LD_LIBRARY_PATH`. Esta variável contém uma lista de locais que
devem ser pesquisados para que as referências do seu executável às
bibliotecas dinâmicas sejam satisfeitas. Se o linker não conseguir
encontrar as referências, o *loader* termina a execução e simplesmente
mata seu executável com uma mensagem de erro.

O segundo problema refere-se à segurança. Uma pessoa mal intencionada
pode trocar sua biblioteca por outra, injetando código malicioso no seu
executável. O Windows é particularmente sucetível a este tipo de
problema pois é possível injetar uma DLL, o equivalente à *shared
library* do unix, em qualquer processo (referência:
<a href="https://www.amazon.com/Advanced-Windows-Jeffrey-Richter/dp/1572315482" class="markup--anchor markup--p-anchor">Advanced Windows — Jeffrey Richter</a>). 

O terceiro problema é o tempo de carga do seu executável. O uso de
bibliotecas dinâmicas acaba ampliando o tempo necessário para o loader
carregar seu programa na memória. E não é para menos: é preciso resolver
todos os símbolos pendentes antes do seu programa entrar em execução.

Mas nem tudo são problemas. O uso de shared libraries permite que seu
programa ocupe menos espaço em memória, resolvendo símbolos só quando
for necessário. Em verdade, isto precisa ser feito de maneira manual
através de system calls `dlopen, dlclose e dlsym` no unix. Chamadas
semelhantes existem no Windows. O seu programa pode carregar, resolver
os símbolos, executar o que precisa e descarregar as bibliotecas ao seu
bem querer. Isto é particularmente muito interessante no design de
plugins e extensões de um programa.

Outra vantagem é permitir que você compartilhe código com várias partes
do seu sistema sem, contudo, onerar demais o armazenamento em disco. Ao
colocar rotinas e recursos em bibliotecas dinâmicas, vários softwares de
um sistema complexo podem usufruir dos mesmos serviços, minimizando o
tempo e complexidade de deployment. 

Hoje em dia praticamente todos os sistemas modernos são baseados em
bibliotecas dinâmicas pela simplicidade que elas oferecem na atualização
de software. Não é preciso atualizar todo o seu unix quando um problema
na biblioteca de SSL é encontrado e corrigido. Basta trocar a versão da
biblioteca por uma corrigida e já era.

#### Como funciona?

O mecanismo da ligação dinâmica é, na realidade, simples e tem
consequências na forma como o executável é criado. Imagine que você
tenha um sistema de tal forma que o executável dependa de uma biblioteca
dinâmica. Ao compilar o código do seu executável, eis o que acontece,
considerando que você faça uso da ligação dinâmica automática:

1.  <span id="7d82">Os símbolos da biblioteca externa são mantidos como
    não resolvidos. Afinal, o compilador sabe quais são as interfaces,
    mas não tem condições de ligar o código.</span>
2.  <span id="604d">Depois de devidamente compilado entra em ação o
    linker. Ao achar os símbolos da biblioteca externa o linker
    imediatamente procura resolvê-los. Ao verificar que os símbolos são
    resolvidos em uma biblioteca dinâmica, o linker adiciona código para
    realizar a carga e a resolução dos símbolos no seu executável, para
    que isto seja feito de forma dinâmica.</span>
3.  <span id="36a2">O seu executável é terminado e contém uma tabela de
    símbolos tal que os símbolos externos têm referências à bibliotecas
    externas, que serão resolvidos quando seu executável for
    efetivamente carregado.</span>

Quando você chama seu executável, antes de mais nada entra em ação o
*loader*. Esta pequena peça de software é enfiada no seu executável pelo
compilador e a sua função é preparar o ambiente de execução para que o
seu programa inicie-se. Ao encontrar a tabela de símbolos dinâmicos, o
loader dá um jeito de chamar o linker para resolver. O linker, aqui, é
diferente do linker que você usou para gerar seu executável. Trata-se de
um serviço do sistema operacional. Este linker procura pela biblioteca.
Ao encontrá-la, procura pelo símbolo. Ao encontrar o símbolo, realiza as
alocações pertinentes, inicializa a biblioteca dentro do espaço de
endereçamento do seu programa, liga os símbolos pendentes do seu
programa ao código da biblioteca e… vamos adiante!

O seu programa, finalmente, entra em execução. Ao chamar uma função da
biblioteca dinâmica, esta já está resolvida e o código da biblioteca,
que está carregado no espaço de endereçamento do seu executável, ou
seja, dentro do processo, entra em execução como se fosse uma parte
integrante do seu software.

É possível, no entanto, fazer a carga manualmente. Isso tem algumas
vantagens. A primeira delas é que você controla quando e como as
bibliotecas externas serão carregadas. Assim, você pode criar módulos
externos que podem ser carregados depois do seu programa estar em
execução, realizar o que precisa e depois ser descarregados. Este *fine
control* é particularmente interessante em sistemas embarcados nos quais
a memória é um recurso para lá de escasso. Como normalmente estes
sistemas usam armazenagem em memória (flash, ROMs, EPROMs, etc), o
acesso é rápido e o delay pequeno. Obviamente que esta abordagem é
proibitiva para sistemas de missão crítica em tempo real. 

#### Conclusão

As bibliotecas dinâmicas trazem benefícios para o deployment de
aplicações, minimizando a armazenagem necessária para os programas.
Mesmo em sistemas embarcados, como o iOS, esta tecnologia, já bem antiga
diga-se de passagem, sempre esteve presente, ficando disponível para os
programadores fora do âmbito da Apple somente após o iOS 7. 

[View original.](https://medium.com/p/9838b98693dc)

Exported from [Medium](https://medium.com) on December 25, 2020.
