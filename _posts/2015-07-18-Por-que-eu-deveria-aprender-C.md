---
layout: post
title: Por que eu deveria aprender C
image: https://cdn-images-1.medium.com/max/800/1*7JT1y5DcOC6U93G3tCGB4w.png
author: ronaldo
categories: [Programação]
---

C nasceu em 1972 pelas mãos do brilhante Dennis M. Ritchie,
falecido em 2011 alguns meses depois de Steve Jobs. É uma linguagem
compacta, baseada na Linguagem B, outra linguagem inventada por Dennis
M. Ritchie em parceria com Ken Thompson, o maior programador de todos os
tempos, na minha opinião.

Ou seja, C é uma linguagem velha. Nasceu em um ambiente que sequer tinha
monitores — os terminais do DEC PDP-11, o computador onde foi
desenvolvido, eram rolos de papel que eram impressos com as saídas que
hoje ficam numa tela. C usa um paradigma considerado hoje antiquado:
programação procedural. Então, quais motivos tenho para aprender C?

### Mitos

Antes que eu responda à pergunta, me permitam desvendar alguns mitos da
linguagem. O principal é que a linguagem é difícil. Não, C é a linguagem
mais simples que existe atualmente no mercado. Java, por exemplo, é
muito mais complexa pois lida com aspectos sofisticados, como
*namespaces* aninhados, organização por pacotes, inclusão inteligente e
por aí vai.

C não é uma linguagem de baixa produtividade como muita gente diz. Basta
ter em mãos um bom framework escrito em C, como a GLib por exemplo, e
pronto: você está bem servido. Frameworks gráficos como a Qt, GTK dão ao
C todo o poder gráfico necessário para criar aplicações *desktop* em
*windowing systems*.

É fácil aprender C. Como trata-se de uma linguagem antiga, há
compiladores de toda sorte para uma enormidade de sistemas. Assim,
construir um ambiente de desenvolvimento é extremamente simples,
principalmente por que C não exige o uso de um IDE. Basta um editor de
textos e um terminal com linha de comando e pronto: você já tem quase
todas as ferramentas que precisa para desenvolver em C.

Como há compiladores para virtualmente todas as plataformas, C é uma
linguagem considerada multi-plataforma. No entanto, há alguns detalhes
que impedem que um programa seja livremente portado de uma plataforma
para outra, detalhes estes que são facilmente contornados pelo uso de
uma técnica chamada de *compilação condicional.*

### Por que devo aprender C?

Como é uma linguagem muito simples, muita coisa é delegada ao
programador. C exige que o programador seja disciplinado e consistente.
A indisciplina é punida com erros em tempo de execução que podem ser
difíceis de diagnosticar, principalmente quando o sistema escrito em C é
muito grande.

Além disso, C não controla os recursos que seu programa usa. O
programador deve fazê-lo manualmente. Este é uma das principais
características que os programadores modernos apontam como sendo
enfadonha na linguagem. E eu concordo com eles.

Ao obrigar o programador a gerir manualmente os recursos necessários ao
programa, o programador torna-se mais defensivo ao desenvolver em
linguagens mais modernas, levando a minimização de erros de programação
e a um consequente aumento na qualidade do código final.

C é considerada uma linguagem de nível médio pois comporta-se como uma
linguagem de alto nível, mas permite que o programador use técnicas de
baixo nível em seus programas, o que a faz perfeita para interfacear
hardware.

Por ser uma linguagem simples, também não há gestão de *namespaces*,
sendo que tudo está no mesmo *namespace* global. Assim, conflitos de
nomes durante a compilação obrigam ao programador seguir uma rotina de
nomenclatura muito específicas que determina a unicidade dos nomes que
usa em seus programas, sejam de funções ou de variáveis.

Para ir direto ao assunto: programar em C lhe permitirá desenvolver
disciplina e consistência no que você escreve.

Se você trabalha com alguma linguagem de *scripting* como ruby ou PHP,
poderá estender a linguagem usando C. A grande maioria dos intérpretes
que existem no mercado permitem que você os estenda usando C, criando
novas funcionalidades que podem ser bem complexas de executar na
linguagem de scripting. Por exemplo, se você precisar interfacear um
hardware com java, possivelmente deverá usar a JNI para integrar um
código de driver em C com este hardware.

### Mas C não é a linguagem do meu dia-a-dia!

Passei muito tempo escrevendo software apenas em C, mas sempre estudei
diversas linguagens de programação, mesmo aquelas que não faziam parte
do meu dia-a-dia. Por que isso é interessante? Por uma questão simples:
toda linguagem de programação é criada tendo em mente uma classe de
problemas a resolver.

Por exemplo, TCL foi criada para ser uma linguagem simples de
processamento de listas de dados heterogêneos. Lua foi criada com a
intenção de ser embutida em sistemas, servindo como um *rule engine*.

A forma como cada linguagem resolve problemas dá ao programador novas
ideias de como resolver problemas nas linguagens que utiliza no
dia-a-dia. Por exemplo, o aprendizado que tive com os ponteiros para
funções em C me permitiu escrever algoritmos bem otimizados usando
*closures* em swift.

### As Linguagens Modernas

As linguagens modernas têm sua sintaxe derivadas do C. Mesmo as
linguagens orientadas ao objeto tiveram grandes influências do C. Veja,
por exemplo, o operador incremento, que é quase uma marca registrada do
C: existe em virtualmente toda linguagem moderna, incluindo-se java,
ruby, javascript, swift, TCL e tantas outras.

As palavras reservadas das linguagens modernas também são derivadas do
C, como as estruturas condicionais, *loops* e até mesmo a sintaxe de
funções ou métodos, no caso das linguagens puramente orientadas ao
objeto.

Apesar da semelhança sintática e semântica, é uma característica
inegável das linguagens modernas as APIs. Por exemplo, java tem uma API
enorme que suporta, de fábrica, uma série de funcionalidades prontas,
coisa que não existe em C. A biblioteca Standard C é poderosa, porém
bastante limitada se comparada às APIs modernas, principalmente no que
diz respeito ao suporte a coisas relativamente novas como o Unicode ou
estruturas de dados como as coleções (arrays, dicionários, hashes, etc).

### O que é escrito em C hoje em dia?

Muitos segmentos ainda usam C como base para seus sistemas. Incluem-se
aqui as grandes seguradoras, bancos e empresas de telefonia móvel
celular. Estes sistemas necessitam de performance que dificilmente é
alcançada por outra linguagem de programação. E prefere-se C pois há
compiladores baratos para todas as plataformas no mercado.

É comum ter servidores escritos em C. Veja, por exemplo, o NGINX,
servidor web muito famoso nos dias de hoje. Escrito em C. O Apache?
Escrito em C. Kernel do Linux? C. MySQL? hm… C.

A ideia de usar C é por que os compiladores C são muito estáveis e a
biblioteca STDC está há muito estabelecida.
