Vai reescrever o código mesmo?
==============================

Você não sabe o tamanho da merda que está fazendo.

------------------------------------------------------------------------

### Vai reescrever o código mesmo?

#### Você não sabe o tamanho da merda que está fazendo.

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*uhb_Di-QUNm4KxaY5_7bDQ.jpeg" class="graf-image" />
</figure>Código antigo é feio. Mas é feio por um motivo: passou por
muita manutenção, umas boas, outras ruins. E veio agregando conhecimento
ao longo do tempo. Código antigo é inegavelmente estável. Tudo quanto é
defeito que tinha que dar já deu. A tendência é que, com o tempo, achar
novos defeitos torne-se cada vez mais difícil.

> É arrogância achar que você consegue reescrever todo o código em
> pouco tempo.

Normalmente o código fica feio à medida em que envelhece. E torna-se
cada vez mais difícil de manter, mas não por que você escolheu mal sua
arquitetura ou estrutura, mas por que as premissas nas quais o código
foi originalmente baseado mudaram bastante ao longo do tempo. Assim, é
importante reestruturar o seu código, o que é diferente de reescrever.

Por mais que você seja bom, ou que tenha mantido o código por tempo
demais, é arrogância achar que você consegue reescrever todo o código em
pouco tempo ou com custo baixo. O fato é que você não tem todo o
conhecimento necessário para escrever todo o código novamente. A
História está repleta de casos nos quais a reescrita terminou em
desastre, sendo o mais notório o caso da *Wordstar*.

#### Risco

Reescrever todo o seu código é extremamente arriscado. E caro. Você
corre o risco de entregar um novo produto que tem features diferentes do
produto original, ou um *feature set* menor e incompatível. Além disso,
o seu código *novo* poderá conter novos bugs, ser instável em
determinadas condições.

Empresas pequenas que se arriscam a reescrever seus produtos do zero
invariavelmente terminam fechando as portas devido ao alto investimento
que está embutido na reescrita de código.

#### Reestruturar x Reescrever

Como eu disse, o código antigo foi criado com base em outras premissas,
se comparado com o código atual. Reescrever exige um alto investimento
em tempo, dinheiro e recursos diversos. Reestruturar, por outro lado,
exige bem menos esforço apesar de exigir algum tipo de investimento.
Porém, reestruturar é um custo que faz parte do ciclo de vida do seu
software. Com o passar do tempo, torna-se imperativo reestruturar o seu
código no intuito de simplificar a manutenção, tanto corretiva quanto
evolutiva.

Mas… O que reestruturar? Aqui vai uma listinha rápida:

-   <span id="4665">funções ou métodos muito extensos podem ser
    quebrados em elementos menores. Muitas vezes, podem acrescentar
    novas classes específicas no caso de linguagens orientadas ao
    objeto, criando uma composição na qual algumas funcionalidades ficam
    especificamente centradas em determinadas classes, simplificando a
    manutenção;</span>
-   <span id="89a0">diminuição de acoplamento. Tente revisar as
    interfaces entre as partes do seu código no intuito de minimizar o
    acoplamento entre elas. O acoplamento temporal é particularmente
    difícil de ser retirado e muitas vezes, impossível por haver
    dependências no workflow da sua aplicação. Porém, quanto menos
    acoplado estiver seu código menor será a probabilidade de aconteceu
    o *mexeu aqui, quebrou num lugar nada a ver;*</span>
-   <span id="8111">reorganização do grafo de classes, no caso de
    linguagens orientadas ao objeto. Muitas vezes algo difícil de fazer
    e que precisa ser executado de maneira vagarosa, limitada e
    consciente pois mexe diretamente na estrutura funcional e no modelo
    da sua aplicação;</span>
-   <span id="29f6">revisão do sincronismo, caso sua aplicação funcione
    de maneira paralela. Normalmente há excesso de sincronismo nas
    aplicações, o que leva a perda considerável de performance. Porém,
    código paralelo tende a ser de revisão complexa por tratar de
    eventos aleatórios no decorrer do tempo: nunca se sabe quando
    determinado trecho estará em execução, mesmo dentro de seções
    críticas;</span>
-   <span id="3431">limpeza de coisas inúteis, como variáveis declaradas
    e não usadas, funções que não são chamadas e elementos que existam
    no código sem necessidade. Menos código é menos coisa para ler e
    menos coisa para dar pau.</span>

Não se prenda a esta listinha. Saiba que há muito mais o que fazer além
destes itens. Listei aqui o que eu considero o mais grave e imediato. Na
verdade, a lista é interminável.

#### Como reestruturar?

Não preciso dizer que *big bang* é uma péssima ideia. Se você não sabe o
que é o tal *big bang*, aqui vai: é fazer tudo de uma vez. Ao invés de
querer arrumar sua base de código toda de uma vez, faça-o de forma
incremental. Isso diminui o risco, minimiza os custos e faz o seu
software permanecer estável enquanto o trabalho é desenvolvido.

Se sua equipe trabalha em ciclos, afinal o desenvolvimento ágil está na
moda, basta adicionar em cada ciclo alguma estória de reestruturação.
Isso ajuda a manter seu software crescendo e melhorando a cada dia, até
o fim do ciclo de vida.

#### Hora de otimizar

Reestruturação de software praticamente rima com otimização. Normalmente
o software legado ou mais antigo tem problemas de otimização. Por que
não otimizar enquanto se reestrutura? Minimizar *loops*, melhorar
algoritmos, tudo isso é parte da reestruturação do seu software.
Certamente você terá mudanças no modelo de dados como parte das
otimizações.

E aqui está um tema importante: não há nada no seu software que não
possa ser melhorado.

#### Não existe código imexível

Ah, certamente você já ouviu aquela: não mexa aí por que está
funcionando. Este é um mito que provoca um inchaço no seu software à
medida em que o código envelhece. Como ninguém mexe naquela parte do
código, a evolução é feita por fora, através de interfaces complicadas e
que tendem a um nível de complexidade alto, pois ninguém mexe no código
*imexível*.

Se você for realizar alguma reestruturação, saiba que toda e qualquer
parte do código é passível de passar por este processo. As partes mais
complexas, óbvio, exigem maior cuidado, principalmente se houver grande
acoplamento de outras partes do código em relação ao que está sendo
reestruturado.

#### Atualização de Frameworks/Infraestrutura

Tá aí uma questão importante, principalmente para linguagens dinâmicas
que usam frameworks para tudo. Atualizar a versão da linguagem
juntamente com a do framework pode ser algo bastante doloroso,
principalmente no que diz respeito a interfaces que se tornaram
obsoletas.

É preciso fazer isto com calma. Uma mudança radical de versão pode ser
desastrosa, ainda mais se o seu sistema for muito grande. Nestes casos,
é interessante atualizar o seu sistema devagar, uma versão de cada vez,
até atingir a versão desejada. Dependendo do tempo que seu sistema ficou
sem atualização de infraestrutura/framework, pular diretamente para as
últimas versões podem lhe dar uma bela dor-de-cabeça.

#### Comentários!

Como última dica, melhore os comentários do código também. Os
comentários podem ficar, rapidamente, desatualizados, levando o leitor
do código a uma leitura incorreta e a uma interpretação incorreta do que
está no código. Assim, atualize os comentários também. Afinal, eles
fazem parte da estrutura do seu código.

Happy coding!

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [July 23, 2018](https://medium.com/p/9f51e0faffb5).

<a href="https://medium.com/@ronaldolima/vai-reescrever-o-c%C3%B3digo-mesmo-9f51e0faffb5" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
