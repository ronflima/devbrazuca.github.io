Singleton: a dor-de-cabeça escondida
====================================

A ideia é boa. Mas usá-la sem critério vai te dar uma bela ressaca.

------------------------------------------------------------------------

### Singleton: a dor-de-cabeça escondida

#### A ideia é boa. Mas usá-la sem critério vai te dar uma bela ressaca.

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*2txmnJUPJv3MTbsRvBrLnw.jpeg" class="graf-image" />
</figure>Não estou falando de bebida. Afinal, este é um blog de
programador, não é mesmo? Mas assim como a bebida, se você abusar do
*singleton*, vai ter uma bela dor-de-cabeça. Antes de seguir adiante com
minha argumentação, me permita dar um passo atrás e falar sobre o
*design pattern* em si.

A ideia por trás do singleton é garantir que apenas uma única instância
de uma determinada classe exista durante todo o ciclo de execução de um
software arbitrário. Assim, esta única instância gerencia estados que
necessariamente precisam ser mantidos em um único lugar. Foi com esta
premissa que este padrão foi criado.

O lance com os *design patterns* é que eles são soluções para domínios
específicos de problemas. Muita gente se esquece deste pequeno detalhe e
sai usando design patterns em tudo quanto é contexto, criando mais
problemas do que resolvendo-os. Um design pattern não pode ser usado em
qualquer lugar. Por exemplo, o *adapter* é um design pattern cuja função
é compatibilizar duas interfaces distintas em uma que seja padronizada.
Sair usando isso como meio termo de comunicação entre objetos de forma
negligente aumenta a complexidade do seu projeto ao invés de
simplificá-lo. Tem gente que usa adapter a rodo.

Pelo fato de ser bem simples de implementar, o singleton ganhou grande
popularidade entre os programadores, sendo que alguns o usam sem
entender o que é que ele resolve, criando na prática variáveis globais
descontroladas que podem ser acessadas por qualquer ponto do seu
programa e, o que é pior, por qualquer thread.

Pelo fato de ser global, o singleton pode se tornar um problema de
sincronismo em código concorrente, principalmente se implementar
operações dependentes de contexto. Por exemplo, criar um singleton para
acesso a uma API REST é um erro comum. O acesso à API é dependente de
contexto e necessariamente precisa ser realizado de maneira assíncrona
no intuito de manter a responsividade da interface com o usuário da sua
aplicação. Se o acesso é através de um singleton, é imprescindível a
sincronização entre threads no intuito de evitar-se problemas com seções
críticas. O resultado é que seu código vai viver parando em um único
ponto de sincronismo, ou seja, sempre haverá mais threads em *wait* do
que efetivamente em execução.

Quando o singleton foi criado a programação multi-threaded ainda era
novidade. E ninguém tinha como problema o acesso concorrente a uma única
entidade. Assim, torna-se necessário maior cuidado ao usar este *design
pattern* em particular.

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [April 13, 2016](https://medium.com/p/32cc01ddf452).

<a href="https://medium.com/@ronaldolima/singleton-a-dor-de-cabe%C3%A7a-escondida-32cc01ddf452" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
