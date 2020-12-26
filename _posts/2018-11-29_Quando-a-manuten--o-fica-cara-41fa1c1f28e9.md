Quando a manutenção fica cara
=============================

Uma estória de horror daquelas de deixar a gente sem dormir…

------------------------------------------------------------------------

### Quando a manutenção fica cara

#### Uma estória de horror daquelas de deixar a gente sem dormir…

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*qcvCiFjAnQl37dFwiUadaw.jpeg" alt="Uma boa fundação faz a manutenção da obra ser mais barata" class="graf-image" /><figcaption>Uma boa fundação faz a manutenção da obra ser mais barata</figcaption>
</figure>Me lembrei de um caso que vale a pena compartilhar. Há alguns
anos, quando eu tinha uma empresa de desenvolvimento de apps para iOS,
fui procurado para resolver um problema em um app que estava com uma boa
base de usuários mas não parava de ter esta base diminuída pela
quantidade de problemas. Bugs em cima de bugs, travamentos, problemas
diversos. O projeto, no entanto, era bastante pontual em termos de
funcionalidades alteradas, mas havia uma questão: a fundação estava
ruim.

#### A Fundação que Afunda

Todo software é construído por sobre dois tipos de requisitos: os
requisitos funcionais, que são aqueles que o cliente precisa e
solicitou; os requisitos não-funcionais, normalmente questões técnicas
que surgem durante o desenvolvimento do software. Por exemplo, usar o
banco de dados SQLite é um requisito não-funcional por que é uma decisão
do desenvolvedor e não tem nenhum impacto, do ponto-de-vista de negócio,
nos requisitos funcionais. Obviamente que o banco de dados tem impactos
em segurança, performance, etc, mas estes impactos são técnicos e
raramente um impacto técnico é uma expressão do negócio que precisa ser
automatizado.

Todo requisito funcional é implementado usando uma série de serviços de
suporte, seja para ler dados de um serviço RESTful, seja para ler e
escrever dados em arquivos. Estes serviços de suporte, que implementam
requisitos não-funcionais normalmente, são a fundação do seu software.
Sem isso, não há como construir o código que implementará os requisitos
funcionais. E é aqui que o chão afunda.

Sem uma boa arquitetura e organização, a base pode tornar-se frágil, com
alto índice de acoplamento e com dependências temporais e funcionais
tais que ao alterar um ponto do código, outro ponto que não deveria ser
relacionado, começa a sofrer de bugs escandalosos e misteriosos. Ou
seja, a fundação foi mal-feita. E quando isto acontece, qualquer
manutenção no software, principalmente manutenções evolutivas, tornam-se
uma tremenda dor-de-cabeça.

#### Alto custo de manutenção

Quando a base é ruim o resultado é apenas um: um altíssimo custo de
manutenção. O problema clássico, e normalmente o mais abundante, é
justamente o alto nível de acoplamento. Por que o acoplamento é ruim?

O acoplamento cria dependências intrínsecas entre cada componente do seu
software. Um componente passa a depender de outro de tal forma que se um
componente muda seu comportamento, efeitos negativos são sentidos em
outras partes normalmente não relacionadas, funcionalmente falando.

Qualquer manutenção, portanto, torna-se um cobertor curto: se cobre os
pés a cabeça fica de fora, se cobre a cabeça, os pés ficam de fora. Isto
torna a tarefa de manutenção enfadonha, longa e, o que é o pior, cara.

#### Reengenharia ao resgate!

A melhor solução, para estes casos, é a reengenharia. Refactoring,
revisão e reorganização dos modelos de dados são algumas das medidas
para mitigar e, posteriormente, resolver este problema. Por que
posteriormente?

Por que não dá para fazer tudo de uma vez. É anti-econômico e certamente
você não terá tempo suficiente para fazer isso sem causar uma hecatombe
na sua empresa.

Você ficará tentado a reescrever o código, mas
<a href="https://ronaldolima.eti.br/vai-reescrever-o-código-mesmo-9f51e0faffb5" class="markup--anchor markup--p-anchor">afirmo que é uma péssima ideia</a>.
Eu já fiz isso e perdi diversas noites de sono com um resultado final
que apenas justificou o meu ego inflado. Infelizmente, o melhor
aprendizado vem da dor. E esta doeu muito.

O melhor é planejar as mudanças de forma paulatina e incremental,
procurando, a cada iteração do seu projeto, resolver um conjunto
controlado de problemas. Você verá que trata-se de uma tarefa hercúlea.
Afinal, toda a base do software foi criada de maneira inadequada e mudar
isso é um trabalho cirúrgico, demorado e complicado. E a melhor forma,
na minha opinião, é diluir o custo do desenvolvimento ao longo do ciclo
de vida do seu software, melhorando-o a cada iteração.

#### O barato que saiu caro

Normalmente a fundação frágil de um software é fruto de mal planejamento
no início do desenvolvimento. E este planejamento mal feito normalmente
é fruto da economia na base da porcaria: usar um developer sem
experiência e sem o devido treinamento para construir a base do
software. A falta de conhecimento em modelamentos e arquitetura,
normalmente, são as grandes culpadas pelas péssimas infra-estruturas de
software.

Além disso, a *invenção de moda* é outra grande culpada: querer seguir
pensamentos *mainstream* sem o devido cuidado, como usar metodologias
reativas ou co-rotinas quando pouco se conhece das implicações técnicas
destas linhas de pensamento. O resultado é uma infra-estrutura
vulnerável, altamente intolerante a falhas. Falhou? Capotou. E dai que
ficou *commit* pendente, dados no buffer que não foram pro disco?

A economia feita na equipe de desenvolvimento normalmente é o que leva a
isto. Profissionais baratinhos, com pouca ou nenhuma experiência, com
pouco conhecimento são os principais culpados pela baixa qualidade do
software que sua empresa escreve.

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [November 29, 2018](https://medium.com/p/41fa1c1f28e9).

<a href="https://medium.com/@ronaldolima/quando-a-manuten%C3%A7%C3%A3o-fica-cara-41fa1c1f28e9" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
