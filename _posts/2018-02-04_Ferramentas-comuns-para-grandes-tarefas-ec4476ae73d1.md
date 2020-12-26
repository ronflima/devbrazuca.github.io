Ferramentas comuns para grandes tarefas
=======================================

O seu mac já tem isso tudo instalado. Por que não usar?

------------------------------------------------------------------------

### Ferramentas comuns para grandes tarefas

#### O seu mac já tem isso tudo instalado. Por que não usar?

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*bgTaj3YUkgvqxp2cktuYJA.jpeg" class="graf-image" />
</figure>Tenho visto muita gente automatizando tarefas no mac usando
linguagens como Ruby ou Python. Nada de errado. Afinal, ambas as
linguagens já vem instaladas no seu Mac. Porém, há outras ferramentas
simples quem também vem instaladas no seu mac e que exigem bem menos
esforço e fazem grande parte da automação para você. Vamos a elas!

### GNU Make

O seu mac já vem com o GNU Make instalado. Apesar de muita gente
criticar os Makefiles, estes são muito simples de aprender e muito
poderosos, podendo automatizar tarefas de uma forma geral.

A principal vantagem do GNU Make é sua estabilidade: trata-se de um dos
programas mais antigos do suite de compilação da GNU. É muito bem
documentado e é fácil implementar regras relativamente complexas.

Outra vantagem é que você não precisa instalar absolutamente nada
externo para usar um makefile. Já está tudo aí. Basta criar um makefile
com o seu editor de textos predileto e já era.

#### Cenários de Uso

Eu tenho usado makefiles para automação de builds, que é o cenário
comum. Mas também tenho usado para fazer deployment de código em
produção, gestão de configuração, configuração de servidores e mais um
monte de coisas relacionadas ao meu dia-a-dia como desenvolvedor.

Por exemplo, uso bastante o docker para deployment em produção. Tenho um
makefile que faz toda a mágica: cria as imagens, atualiza o registry,
cria o swarm, cria volumes, inicia serviços e por aí vai.

### Automator

O automator é, talvez, a ferramenta mais desconhecida do macOS. O
automator cria uma série de coisas diferentes no seu sistema, desde
workflows a ações de pasta. Aqui vai uma rápida visão do que o Automator
é capaz de fazer.

#### Workflows

Um workflow é uma rotina que é executada quando o arquivo do automator é
clicado duas vezes. O workflow funciona como um programa e pode fazer
milhares de coisas. Tudo depende do que há instalado no seu sistema.
Programas instalados no macOS podem expor extensões que podem ser usadas
pelo Automator para automação das tarefas diárias.

Assim, você pode automatizar o seu Mail, lista de lembretes,
calendários, etc. Você pode criar workflows para manipular arquivos,
fazer backups, etc.

Os **aplicativos** são workflows que não precisam do automator para
executar. Muitas vezes é legal criar um aplicativo para determinadas
tarefas.

#### Alarme de Calendário

As ações de calendário são workflows cuja função é executar
automaticamente de acordo com um determinado agendamento. Por exemplo,
eu tenho um workflow que faz o backup da minha biblioteca de fotos todos
os dias, na mesma hora. Quem comanda o espetáculo é o iCal e esta é uma
das integrações mais legais do Automator.

Assim, você pode executar rotinas automaticamente, sem intervenção
humana, sempre que o agendamento for atingido. Você cria a rotina no
Automator, mas gerencia o agendamento no iCal.

#### Serviço

O serviço é, talvez, uma das coisas mais legais do macOS. O serviço é um
workflow disparado de dentro do menu da aplicação, item Serviços. Você
pode configurar seu serviço para funcionar com qualquer aplicativo do
seu macOS ou para aplicações e entradas de dados específicas.

Por exemplo, eu tenho um serviço que funciona com o Mail que cria
lembretes com base nos emails selecionados. A ideia é transformar emails
em tarefas.

Você pode criar serviços para o Finder, por exemplo. Eu tenho um que
renomeia arquivos em sequência. Ao ser executado com um conjunto de
arquivos selecionados, ele pergunta por um prefixo e renomeia os
arquivos colocando um sequencial numérico como sufixo.

#### Ação de Pasta

Você pode associar um workflow à uma pasta. O workflow será executado
dependendo do tipo de ação que ocorrer na pasta. Por exemplo, você pode
criar um workflow que compacte os arquivos que são copiados ou movidos
para uma pasta, mantendo todos os arquivos da pasta compactados.

#### Plugin de Impressão

O plugin de impressão permite que você execute algo sempre que um
documento for para a fila de impressão. Assim, você pode criar workflows
que, inclusive, façam o tratamento dos dados antes deles serem
impressos. Por exemplo, você pode aplicar um filtro de enhancement para
melhorar a impressão ou para gastar menos tinta preta.

O workflow é disparado durante a impressão, mas você pode fazer o que
desejar além de só filtrar conteúdo.

#### Plugin de Captura

Ao capturar dados, seja de uma câmera ou de um scanner, você pode fazer
algum tratamento ou realizar alguma tarefa com um plugin de captura.
Funciona de forma parecida com o plugin de impressão.

#### Comando de Ditado

O macOS suporta comandos por voz já há alguns anos. Ao contrário da
Siri, os comandos de voz precisam ser previamente cadastrados para
funcionarem. Você pode criar comandos novos usando o Automator. Os
workflows serão executados automaticamente tão logo você dê o comando.
Legal, né?

### AppleScript

AppleScript é a linguagem de automação do macOS. A linguagem foi
projetada para ser usada por quem não é programador. Trata-se de uma
linguagem simples mas que gera código bastante extenso. O interessante
da linguagem é que ela parece uma conversa com o computador.

O que é legal é que você pode automatizar praticamente qualquer coisa no
seu macOS usando AppleScript, mesmo programas que não expõem objetos
para a linguagem. Você pode programar *keystrokes* que automatizam o seu
programa de forma a parecer que é uma pessoa quem está operando o mesmo.

A principal vantagem do AppleScript é que ele já vem instalado no seu
mac. Dá para programar praticamente qualquer coisa com isso. Por
exemplo, eu escrevi um encoder para a Beblüe para esconder algumas
strings dentro do código do aplicativo iOS deles. O app tinha um decoder
que obtinha os dados de volta, mantendo a string table livre de
tentativas de cracking.

Eu automatizo de tudo um pouco com o AppleScript. Por exemplo, tenho um
script que gera os ícones de aplicativo para o iOS já no formato
esperado pelo Xcode. Basta soltar o arquivo em cima do script e ele faz
a mágica.

#### Droplets

Os *droplets* são pequenos scripts feitos em AppleScript que funcionam
quando você arrasta e solta um arquivo em cima dele. Ele é acionado e
faz algo com o arquivo.

Tenho um droplet que faz upload de arquivos para o serviço
<a href="http://hiperload.com" class="markup--anchor markup--p-anchor">Hiperload</a>,
do meu amigo Hugo Demiglio. Muito mais prático do que abrir o site,
selecionar o arquivo e arrastá-lo para o browser.

### Quero Exemplos!

Não seja por isso. Eu mantenho meus scripts e workflows
<a href="https://github.com/ronflima/MacOSScriptsToolset" class="markup--anchor markup--p-anchor">neste repositório</a>
do GitHub. Sinta-se livre para baixar e usar da forma que quiser. São
scripts que venho fazendo ao longo dos anos trabalhando com o macOS.

Divirta-se!

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [February 4, 2018](https://medium.com/p/ec4476ae73d1).

<a href="https://medium.com/@ronaldolima/ferramentas-comuns-para-grandes-tarefas-ec4476ae73d1" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
