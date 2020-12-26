O conto do teste de software
============================

A responsabilidade é do desenvolvedor!

------------------------------------------------------------------------

### O conto do teste de software

#### A responsabilidade é do desenvolvedor!

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*zvJpnhdbkKSjqYdFKmSDCg.jpeg" class="graf-image" />
</figure>Hoje muito se fala em TDD, BDD e sei lá mais que sopa de
letrinhas. Deposita-se fé cega nas metodologias e o simples fica de
lado. E antes que você venha me crucificar, quero deixar algo bem claro:
eu não sou, e nunca fui, contra o teste de software. As minhas críticas
e insights são basicamente contra modismos que causam mais estrago do
que dão resultado que preste. Então vamos ao que interessa.

Teste de software sempre foi um tema chato para tratar com qualquer
developer. Não deveria ser pois, afinal, é uma tarefa que faz parte da
profissão. Quem não testa software é como o engenheiro que projeta o
avião e não testa se ele voa de verdade. E antes de seguirmos adiante no
assunto, é preciso estabelecer de quem é a responsabilidade do teste.

#### Quem é o dono do macaco

Em uma empresa onde trabalhei havia um jargão comum: *este macaco é
seu!*. A tradução do termo é simples: a responsabilidade de fazer esse
negócio aí é sua. Se vira! Assim, quem é o dono do macaco quando falamos
de teste de software?

O dono é você, o indivíduo que definitivamente escreveu o código. Por
que? Porque você sabe onde o sapato aperta. Você sabe onde está mais
frágil. E é sua responsabilidade garantir que os pontos frágeis aguentem
as intempéries. Em um cenário otimista, a sua empresa tem um time
especializado em testes e você entrega o seu trabalho para este time
testar. Se sua empresa é uma startup, a sua responsabilidade é dobrada
por que startup nenhuma que se preze tem dinheiro para ter o time de
testes.

Mas, independentemente da presença do time de testes ou não, é sua
responsabilidade garantir que o seu código não volte dos testes, ou que
volte com pouca frequência.

#### Baixa qualidade

O que acontece quando seu trabalho começa a voltar com frequência da
equipe de testes porque os cenários não funcionam? Acontece que a
qualidade do seu trabalho é, no mínimo, ruim. Não importa se você usa
teste automatizado ou não, o seu trabalho está uma bosta.

E por que baixa qualidade não é uma boa ideia? A motivação vai além da
excelência técnica. A verdade é que quanto mais o seu trabalho volta,
maior o tempo gasto com retrabalho. Tempo é um recurso escasso e pode
ser vital para a lucratividade de um projeto.

Ninguém em sã consciência neste planeta desenvolve software que vai dar
prejuízo. Ou o negócio dá retorno ou não presta. Ninguém pagará o seu
salário se você consome recursos do projeto de maneira negligente,
criando código que vive indo e voltando da equipe de testes. Isto
significa que você é o próximo a ser obrigado a atualizar seu Linked-in.

#### Beleza técnica é conto da Carochinha

Agora é que o negócio pega. Foda-se se o seu código é feio. É isso
mesmo! Foda-se! Foda-se se você não usa o mais fodão design pattern ou o
framework pica das galáxias. O que importa, de verdade é se essa merda
que você escreveu funciona e atende aos requisitos, além de ter baixo
custo de manutenção.

Eu canso de repetir: desenvolver software comercial não é concurso de
código bonito. Quer aparecer para suas negas? Vai escrever código em
hackathon e criar story no Instagram. No dia-a-dia das empresas o que
importa, de verdade, é entregar o projeto dentro do prazo e funcionando.
E funcionando quer dizer: aguentando usuário fazendo o que não deve,
lidando com falta de espaço em disco, falta de memória e qualquer outra
intempérie que possa acontecer e que é inerente ao ambiente de produção.

No fim das contas o seu código precisa ser *bullet proof*, e isso é bem
diferente de ser código bonito ou cheio de técnica chique. Precisa
funcionar e aguentar o mundo real: excesso de processamento, falta de
tempo de CPU porque o servidor sobrecarregou, falta de descritor de
arquivo porque o processo abriu arquivo demais e por aí vai.

#### Como se garantir?

Teste automatizado é apenas uma das inúmeras ferramentas que você pode
usar. Porém, há uma técnica que uso há anos e que tem sempre me dado
bons resultados: desenvolvimento incremental. Sim, você já ouviu isso.
As metodologias falam sobre isso. Mas pouca gente usa isso de verdade. A
grande maioria ainda faz Big Bang: desenvolve tudo primeiro para depois
testar.

Com o desenvolvimento incremental a dica é simples: faz um pouco, testa
um pouco. Ao terminar todo o desenvolvimento, você já terá testado todo
o seu código. Dessa forma cada nova camada de software que você adiciona
é construída por sobre outra que já foi testada.

Existem outras técnicas que são extremamente úteis quando combinadas com
o desenvolvimento incremental. Uma delas, que também uso bastante, é a
argumentação de algoritmos. O princípio é relativamente simples:

> A invariante de entrada, ao ser transformada pelo trecho de código em
> exame, leva à invariante de saída.

*Invariante* é algo que você assume como verdadeiro em determinado
trecho do seu código. Você testa esta invariante através de uma
*assertiva*. A assertiva falhará se a invariante for falsa, ou seja,
inválida. Depois de executado o trecho que você quer validar, a
invariante será, claramente, transformada e dará origem à invariante de
saída. A invariante de saída é o resultado do processamento daquele
trecho de código. Da mesma forma, é preciso testá-la com uma assertiva.

Se você comete um engano e faz com que uma informação chegue incorreta
ao trecho de código em questão, as assertivas falham e você detecta
imediatamente o problema, sem maiores dores de cabeça. Assim, sua
responsabilidade é garantir com que todas as invariantes do seu código
sejam sempre verdadeiras.

No fim das contas, se você escreve código com disciplina e cuidado,
realiza os testes adequadamente e, o principal, deixa para escrever o
código por último, certamente a sua codificação tem poucos erros e é de
boa qualidade.

#### Pense antes de escrever a primeira linha de código

Um vício muito comum em desenvolvedores, principalmente os menos
experientes, é sair escrevendo código assim que recebe a especificação
ou lista de requerimentos. Por que isso é um tiro no pé e vai levar ao
desenvolvimento de um código meia boca?

A primeira coisa que um desenvolvedor precisa fazer é entender qual é o
problema que ele precisa resolver. Se, durante o processo, você disser
coisas como “isso deve ser assim”, “eu acho que”, ou qualquer coisa que
seja um indicativo de incerteza, pare imediatamente. Crie uma lista de
perguntas e vá atrás dos stakeholders do projeto de forma a ter certeza
sobre as coisas. Você precisa dizer “isto **É** assim”.

Nós trabalhamos com **fatos** e não com suposições. Se o seu
requerimento é construído por sobre suposições, devolva-o ao seu scrum
master, gerente de projeto ou seja lá quem é responsável pelo boteco e
corra atrás de fatos. Software é preto no branco, zero e um. Coisas como
TALVEZ simplesmente não existem. Ou é ou não é.

Bom, entendidos os fatos agora é hora de projetar o que você vai fazer.
Você precisa modelar os dados, testar este modelo, checar se ele atende
à necessidade de processamento de informação solicitada. Testado e
validado o modelo, agora é hora de entender o fluxo de processamento do
mesmo: o que entra, o que sai? Como os dados são transformados em
informações? Quais as dependências?

Só depois disso tudo é que você precisa, efetivamente, escrever o
código. Veja, o código é a última coisa que você vai fazer. O
interessante de trabalhar assim é que a codificação torna-se,
absolutamente, trivial, mesmo para problemas muito complicados. Por que?
Porque você equacionou e efetivamente resolveu o problema antes de
escrever a primeira linha de código. Assim, o código torna-se a
expressão da sua solução. Ao invés de torrar dias escrevendo código,
você usará dias entendendo, equacionando e resolvendo o problema e
alguns minutos escrevendo o código que resolve isso.

Qual o benefício dessa abordagem? O código é mais simples, mais objetivo
e claramente mais eficiente por que você não ficou dando voltas durante
o desenvolvimento do raciocínio da solução do problema. Pense primeiro,
escreva depois. Deus lhe deu esse cabeção para isso!

Happy Coding!

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [December 6, 2019](https://medium.com/p/274d3c42ecd3).

<a href="https://medium.com/@ronaldolima/o-conto-do-teste-de-software-274d3c42ecd3" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
