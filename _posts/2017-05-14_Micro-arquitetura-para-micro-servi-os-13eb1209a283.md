Micro-arquitetura para micro-serviços
=====================================

Novo nome, coisa antiga.

------------------------------------------------------------------------

### Micro-arquitetura para micro-serviços

Novo nome, coisa antiga.

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*NbQl1WHxPaqNeMivhrMB-g.jpeg" class="graf-image" />
</figure>Esta semana assisti à uma palestra sensacional que explicava a
arquitetura usada no
<a href="http://olist.com" class="markup--anchor markup--p-anchor">olist.com</a>.
Uma arquitetura baseada em micro-serviços e altamente modularizada.
Alguém poderia afirmar que isto introduz diversos pontos de falha, porém
a forma como foi projetado faz com que uma falha em um componente não
cause um impacto sistêmico justamente por que a arquitetura foi criada
sem a existência de dependências entre componentes. Sim, há dependência
funcional. Porém, ao trabalhar como um workflow, o sistema permanece
funcionando até que os problemas sejam sanados, o que torna-o altamente
resiliente.

A arquitetura que apresentaram é uma extrapolação de um workflow simples
que era feito com multi-processos em sistemas que precisavam de um alto
grau de paralelismo e confiabilidade. Porém, os sistemas antigos eram
executados na mesma máquina e, às vezes, na mesma rede local. O
princípio que explico aqui não é novo, mas é suficientemente poderoso
para ser aplicado em menor escala em sistemas de multi-serviços.

#### Mullti-processo sim senhor!

O multi-processamento foi substituído pelas múltiplas threads ao longo
dos anos. O cartaz dizia que as threads eram mais baratas do que um
processo inteiro. E realmente são. A forma como se fazia sistemas antes
das threads era mais ou menos assim:

-   <span id="893f">Chegava uma requisição. Esta requisição forçava o
    software a criar um processo para tratá-la.</span>
-   <span id="9bbd">Este processo criado tratava a requisição e devolvia
    o resultado para o processo que recebeu a requisição, retornando e
    liberando recursos do sistema.</span>

Qual o problema com isso? Criar processos é muito caro. Não dá para
criar processos indefinidamente pois há uma série de recursos que
exaurem-se numa máquina, entre eles os identificadores. A identificação
de um processo é um número inteiro que é determinado através de uma fila
circular. Eventualmente esta fila pode encher de forma a ficar
impossível criar um novo processo. Por outro lado, cada processo precisa
ser criado, carregado, executado e liberado. Tudo isso consome muito
recurso.

Este argumento ajudou, e muito, as threads quando chegaram ao mercado. A
thread fica dentro do processo. As threads têm um custo de criação sim:
exigem um system call para serem criadas. E system calls sempre são
custosos. Mesmo assim, são muito menos custosas que processos. Porém,
trazem um problema: sincronismo. Como trabalham dentro do mesmo address
space, é imprescindível sincronizar as threads quando trabalham com
dados compartilhados. E isto é uma dor-de-cabeça incessante.

Além disso, se uma thread provoca uma instrução ilegal, todo o processo
vem abaixo. Mas, como resolver essas coisas? Multi-processo.

#### Passos de um workflow

Todo processo pode ser modelado como uma sequência de coisas que
precisam acontecer para que as informações de entrada sejam
transformadas em informações de saída. O workflow é suficientemente
genérico para cobrir a grande maioria dos casos de uso da computação
comercial.

Pode-se implementar um workflow baseado em múltiplos processos de três
formas distintas:

1.  <span id="4c80">um processo central e vários processos-filhos que
    são um espelho do processo central;</span>
2.  <span id="9ff1">um processo central e outros processos não
    relacionados, independentes, que relacionam-se e comunicam-se entre
    si através de alguma forma de comunicação inter-processo, como pipes
    ou filas de mensagens;</span>
3.  <span id="803a">uma combinação dos dois métodos anteriores.</span>

Nestas formas o que acontece é o seguinte: ao invés de um processo
disparar outro por requisição, os processos permanecem rodando,
consumindo dados de uma entrada e entregando os resultados numa saída,
de forma totalmente desacoplada.

Trata-se de uma sequência de transformadores de dados que lêem a sua
entrada de um lugar e salvam a saída em outro, sem sincronismo. A única
coisa que fazem é aguardar pela entrada.

Aqui está um diagrama que tenta demonstrar o princípio:

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*XVIAFgC1T5HTeorkuAOc6A.png" alt="Exemplo da Micro-arquitetura" class="graf-image" /><figcaption>Exemplo da Micro-arquitetura</figcaption>
</figure>Cada retângulo é um processo separado, sem acoplamento e
totalmente independente. Os canais de comunicação aqui podem ser
*message queues*, uma entidade do sistema operacional que trabalha
enviando informações de um processo a outro, de forma completamente
assíncrona e independente.

#### Vantagens desta micro-arquitetura

A principal vantagem é o completo desacoplamento entre cada processo. As
mensagens são encaminhadas via filas de mensagens que não fazem
distinção de quem lê nem quem escreve. Apesar de haver I/O nas escritas
e leituras das filas, o tempo é mínimo se comparado a I/O feito em
disco.

As filas permanecem existindo mesmo que todos os processos que
consomem/escrevem dados nelas finalizem. Ao reiniciarem, os processos
voltam a ler os dados das filas que ficaram armazenados temporariamente.

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*kOsuIiyZcifhRmv5l1Qt_g.png" alt="Exemplo de Micro-Arquitetura aplicada a web services" class="graf-image" /><figcaption>Exemplo de Micro-Arquitetura aplicada a web services</figcaption>
</figure>Este estilo de arquitetura é chamado de *pipeline* e permite o
processamento paralelo de informações sem, contudo, que seu código tenha
de suportar alguma forma de paralelismo ou concorrência.

Outra vantagem é o uso ostensivo que esta micro-arquitetura faz dos
processadores. Em máquinas multi-processadas pode-se tirar vantagem do
processamento realmente paralelo. Pode-se, ainda, mudar as prioridades
dos processos de forma independente, dando mais *time sharing* para os
passos mais custosos.

As filas de mensagens, também são uma vantagem. Elas existem no unix
desde tempos imemoriais e são absolutamente estáveis. O unix já lhe dá
isso sem a necessidade de software adicional. Linux incluído.

#### Desvantagens desta micro-arquitetura

Há limitações nas *message queues.* A quantidade de itens e o tamanho de
cada item é limitado. Assim, é preciso avaliar as limitações do sistema
no momento de projetar o seu software. Dependendo da demanda, a fila
pode estourar por não suportar a carga.

Em máquinas com um único processador esta arquitetura não traz grandes
vantagens. Afinal, cada processo acaba concorrendo um com o outro pelo
uso do processador. Assim, toda a vantagem que se teria em termos de
paralelismo vai por água abaixo.

Não é fácil programar em multi-processos. Há muito boiler plate que
precisa ser feito para cada processo: tratamento de sinais, logs,
controle de recursos, etc. Assim, acaba-se por implementar isso diversas
vezes dependendo da quantidade de elementos do seu workflow.

Outro ponto negativo é a concorrência que ocorre com os bancos de dados.
Normalmente, o banco de dados é apenas um pois estamos falando da mesma
máquina. Esta arquitetura permite que os dados sejam armazenados em
bancos independentes, porém este fato traz problemas para a manutenção
de dados interelacionados, o que pode tornar a administração de dados um
pesadelo. O maior problema, no meu entender, são as anomalias de
atualização que podem ocorrer pois a integridade relacional é mantida,
principalmente via acoplamento funcional do software como um todo.

Além da concorrência no database, a quantidade de sessões aumenta pois
será pelo menos uma para cada componente em execução dentro de seu
próprio processo.

Como serão vários processos em execução, é preciso fazer o correto
scheduling de cada um, criar monitoramentos e permitir que cada um seja
reiniciado no caso de falhas através de um console que simplifique a
vida do administrador de sistemas. Como aqui eu sugiro uma arquitetura
que está presa dentro da mesma máquina, o problema administrativo
permanece em um lugar só, ao invés de várias máquinas distribuídas.

#### Conclusão

Esta é uma forma bastante antiga de escrever software. No entanto, não é
uma bala de prata e precisa ser pensada de forma bastante ponderada. É
preciso avaliar se há a real necessidade de criar seu software assim.

Atualmente, como o desenvolvimento modular é popular, não é difícil sair
de uma arquitetura totalmente monolítica do seu processo para uma
arquitetura modular como a sugerida aqui.

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [May 14, 2017](https://medium.com/p/13eb1209a283).

<a href="https://medium.com/@ronaldolima/micro-arquitetura-para-micro-servi%C3%A7os-13eb1209a283" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
