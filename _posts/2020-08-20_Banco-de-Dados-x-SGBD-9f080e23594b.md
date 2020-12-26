Banco de Dados x SGBD
=====================

O seu banco de dados não necessariamente está em um SGDB

------------------------------------------------------------------------

### Banco de Dados x SGBD

#### O seu banco de dados não necessariamente está em um SGDB

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*9ZWteeKrhgz8kIlY04zoiQ.jpeg" class="graf-image" />
</figure>Alguns desenvolvedores confundem bancos de dados com sistemas
gerenciadores de bancos de dados. Na verdade, tornou-se um jargão comum
*banco de dados* como uma referência ao SGBD. Mas há algumas diferenças
importantes que podem mudar a forma como você cria o seu projeto.

#### SGBD

O *Sistema Gerenciador de Banco de Dados* é um software especialista. A
sua função é uma só: gerenciar a persistência de um modelo de dados,
qualquer que seja. O SGBD segue, normalmente, alguma forma de
modelamento para persistência de informações. O modelo mais popular é o
modelo relacional e a forma mais comum de manipulação de dados é através
de uma linguagem declarativa chamada SQL (do inglês *Structured Query
Language*)*.* O SQL é uma linguagem declarativa por que não determina a
ordem na qual as instruções são executadas. Fica por conta do SGBD
determinar a melhor ordem.

O SGBDs relacionais não são os únicos no mercado. Antes de surgirem,
haviam os sistemas baseados em hierarquias de dados, com destaque aos
sistemas IMS e SABRE. Atualmente, existem diversos SGBDs
não-relacionais, como o Cassandra (big table) e o MongoDB (baseado em
documentos). Porém, é importante ter em mente que cada SGBD utiliza uma
forma diferente de modelagem de dados e é importante avaliar se o SGBD
atende seu modelo de forma simples.

Por exemplo, se o seu modelo de dados segue a estrutura de um documento,
você terá dificuldades em trabalhar com SGBDs relacionais ao passo que
será fácil implementar em um sistema baseado em documentos, como o
MongoDB.

#### Banco de Dados sem SGBD

Sim, isso existe! Muito antes dos SGBDs os dados eram salvos em
arquivos. Cada sistema tinha uma forma de persistir seus dados. O COBOL,
por exemplo, define como os registros são determinados e os salva em
arquivos. Claro, a própria linguagem evoluiu com o tempo para suportar
os SGBDs.

Na década de 1980, o Ashton-Tate Dbase salvava os dados em arquivos
indexados. Depois veio o Paradox e no Unix havia o DBM (que ainda existe
como GDBM e uma implementação derivada chamada Berkeley DB). Ou seja,
sempre foi possível ter um *banco de dados* fora de um SGBD.

Há, também, o SQLite, um engine SQL que trabalha diretamente com
arquivos, porém criando consultas usando SQL. O SQLite é quase um SGDB.
Só não o é por que trata-se de uma biblioteca e não um sistema completo.

Mas não paramos por aqui! Dados podem ser persistidos em arquivos CSV,
arquivos estilo chave-valor (INI é um exemplo) e XML, YAML e lá vai
formato. Cada um com suas vantagens e desvantagens. Mas, o que usar no
seu projeto?

#### Avalie a sua informação

Quando você está começando um projeto novo, normalmente há aquele
momento no qual você vai determinar quais tecnologias utilizará para
cada um dos componentes do sistema. Porém, antes de começar a definir
como você vai salvar e recuperar os dados, é melhor avaliar o que são os
seus dados, como eles estão estruturados e o que você precisará fazer
com eles.

Por exemplo, digamos que seus dados são descritos de maneira
relacionada, ou seja, o modelo que melhor os descreve é um grafo de
relacionamentos. Digamos, ainda, que os relacionamentos descrevem regras
rígidas de negócio que precisam ser, necessariamente, seguidas.

Usar uma abordagem baseada em arquivos pode ser interessante, contanto
que você não tenha que garantir operações atômicas e que estas
informações sejam compartilhadas por outros subsistemas. Também, para
uma estrutura como a do exemplo, arquivos de dados pode ser uma péssima
ideia dada a necessidade de garantir-se a integridade dos
relacionamentos das entidades que será criadas para o modelo de dados.

Determinar se você usa SQL ou NOSQL também é algo que depende
intrinsecamente dos dados. No caso do exemplo, é possível usar um SGDB
NOSQL, porém com o custo de manter toda a integridade relacional no
código, custo este que inexiste num banco de dados relacional.

Assim, qual tecnologia utilizar para persistir os seus dados é altamente
dependente de como os seus dados são modelados e estruturados. Também é
dependente de como você pretende transformar estes dados. É temerário
escolher uma tecnologia apenas para tentar resolver todos os problemas
de modelamento que você tenha, visto que alguns modelos serão
naturalmente hierárquicos, o que leva a uma implementação bem mais
complexa em um banco SQL, principalmente se existirem
auto-relacionamentos dentro da hierarquia.

Assim, analise seus dados e os seus modelos antes de decidir qual a
forma que você utilizará para persistir e recuperar dados nos seus
sistemas. Dependendo das suas necessidades, o bom e velho arquivo em
disco pode resolver o seu problema com eficiência. Tudo depende do seu
modelo e de como o seu sistema operará os dados.

Como eu disse, cada tecnologia tem sua vantagem e desvantagem. Usá-las
como uma bala de prata, daquelas que resolvem todos os seus problemas,
não só é utópico como também pode levar a um sistema pesado, ineficiente
e que consome recursos além do previsto.

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [August 20, 2020](https://medium.com/p/9f080e23594b).

<a href="https://medium.com/@ronaldolima/banco-de-dados-x-sgbd-9f080e23594b" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
