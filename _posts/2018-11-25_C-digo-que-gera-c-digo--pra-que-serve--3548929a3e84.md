Código que gera código: pra que serve?
======================================

O cinto de utilidades do developer

------------------------------------------------------------------------

### Código que gera código: pra que serve?

#### O cinto de utilidades do developer

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*69dARb-dbzH870iNhjLzbg.jpeg" class="graf-image" />
</figure>A ideia de escrever código que gera código não é,
absolutamente, uma novidade. Analisadores léxicos como o *lex* e *flex*,
e analisadores sintáticos como o *yacc* e o *bison* são exemplos
clássicos de código que gera código. Mas, além de compiladores, há
alguma utilidade nisso?

#### Por que gerar código?

A geração de código tem como base a ideia de economizar tempo do
desenvolvedor quando há muito código *boiler plate* que precisa ser
escrito. Por exemplo, as ferramentas de compilação da GNU podem gerar
código quando fazem teste de capacidades do seu sistema, durante o
estágio de configuração do seu código-fonte. Ou você pode criar código
repetitivo com base em arquivos de configuração, ou ainda gerar o
esqueleto de uma aplicação que utiliza um determinado framework ao invés
de escrever código em cima de código que tem o mesmo formato.

Frameworks modernos usam um princípio chamado de *scaffolding*, ou seja,
geram a base de código sobre a qual você construirá sua aplicação.
Normalmente é código *boiler plate* para iniciar e configurar o
framework, deixando os pontos de extensão prontos para você escrever.
Com isto, você economiza tempo precioso no seu desenvolvimento.

#### O cinto de utilidades do developer

Cedo ou tarde todo developer começa a criar suas próprias ferramentas,
além das que já usa no dia-a-dia. Trata-se de algo natural, na verdade.
Porém, é preciso ter em mente que as ferramentas podem ter um papel mais
importante do que simplesmente servir como um mero auxílio, podendo
fazer parte do código *main stream* da sua empresa.

Por exemplo, você poderia fazer uma ferramenta para codificar todas as
strings do seu software de forma a ofuscar seu conteúdo. Isto é
particularmente útil em software instalável que utiliza-se de algum par
usuário/senha ou chave de acesso para ativar end-points na internet.
Afinal, toda string termina da *string table* do seu executável, algo
que pode ser facilmente lido por ferramentas simples de desenvolvimento
(como a *strings* da linha de comando dos sistemas \*nix).

Assim, é importante dar a devida importância às ferramentas, controlando
as versões das mesmas. Sim! Crie repositórios para salvá-las e
evoluí-las. Afinal, software que gera software também é software!

#### Programação orientada a definição

Isto é muito comum no mundo java: você cria intermináveis arquivos de
configuração que são usados para dar comportamento aos frameworks. Você
pode fazer a mesma coisa: criar um arquivo CSV ou XML num determinado
formato e usá-lo para alimentar sua ferramenta que criará o código para
você. O código gerado pode ser um CRUD para entidades de dados, o
scaffold para um recurso dentro de um serviço RESTful, e por aí vai.

Fica muito mais simples criar um arquivo de configuração do que escrever
dezenas de linhas de código sempre que for criar algo novo no seu
software. Faça a ferramenta fazer parte da build do seu software e
*voilá*! Você ganhou tempo precioso no seu projeto.

#### Seja simples, mas evolua

Muitas das ferramentas que escrevi para criar código começaram como
shell scripts simples e acabaram evoluindo para algo mais complexo. Em
alguns casos, se tornaram executáveis mais parrudos por conta da
performance que tornou-se necessária durante o build da aplicação final.

Assim o processo de build também iniciou-se simples e evoluiu para algo
mais complexo: ao invés de build steps que chamavam apenas alguns shell
scripts, era necessário construir as ferramentas primeiro para depois
construir o código da empresa.

Porém, é importante ter em mente que isto precisa ser uma necessidade.
Escrever um gerador de código só por que você achou bonito não é uma boa
ideia. Ele precisa ser justificado: vai economizar tempo no seu processo
de produção de software. E naturalmente evoluirá para algo mais complexo
do que simples scripts executados durante a construção do seu software.

Porém, comece simples. O mais simples que puder. De preferência evitando
dependências complexas, algo que pode dar bastante dor-de-cabeça para um
developer *new-comer* que acabou de juntar-se à equipe. E documente bem
o que está fazendo. Ou você será incapaz de tirar férias.

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [November 25, 2018](https://medium.com/p/3548929a3e84).

<a href="https://medium.com/@ronaldolima/c%C3%B3digo-que-gera-c%C3%B3digo-pra-que-serve-3548929a3e84" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
