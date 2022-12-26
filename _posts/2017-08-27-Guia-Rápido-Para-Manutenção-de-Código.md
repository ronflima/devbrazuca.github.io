---
layout: post
title: Guia rápido para manutenção de código
subtitle: Como suportar aquele código que não foi você quem escreveu
image: "https://cdn-images-1.medium.com/max/800/1*6QxLkGwACWZuAKeghakBpw.jpeg"
author: ronaldo
categories: [Desenvolvimento, Dicas]
---

Todo mundo que trabalha com desenvolvimento cedo ou tarde vai manter código que
não escreveu. E nem sempre este código está bom, foi bem escrito ou tem algum
tipo de documentação. Muitas vezes o código é feio, tem partes intrincadas e
partes que dizem que não é para você mexer de jeito nenhum por que funciona.

Bom, aqui vai um pouco da minha experiência mantendo código de terceiros. Muitas
das coisas que eu digo *não faça* eu já fiz, me dei mal e hoje faz parte das
minhas regras pessoais.

#### O código não é uma bosta

O primeiro ponto é: o código não é uma bosta. Pode estar feio, cheio de
problemas estruturais, estar cheio de gambiarras. Porém, você não conhece o
contexto no qual o código foi feito. Muito código feio é escrito de madrugada,
com o programador sob pressão, cansado e tentando defender seu emprego. As
gambiarras acontecem quando há problemas em produção que precisam ser resolvidos
para ontem e acabam ficando no código.

Sim, o código pode ter uma baixa qualidade, mas isto é devido ao histórico pelo
qual aquele projeto passou. Programadores de diversos níveis e graus de
experiência puseram a mão no código, em situações muito adversas.

Assim, a primeira coisa a fazer é segurar a boquinha e evitar falar mal do
código. Você precisa, no entanto, avisar ao gerente do seu projeto sobre a
qualidade daquilo que está assumindo e bem como os riscos que envolvem a
manutenção de código de baixa qualidade. Porém, isto é muito diferente de dizer
que o código é uma bosta. Respeite o código que está recebendo pois você está
chegando agora e não conhece o histórico do projeto.

Sou obrigado a abrir um parêntese e a confessar meus crimes: há momentos em que
eu não aguento e acabo soltando um *que merda de código*. Atualmente guardo este
tipo de comentário para mim. Antigamente cansei de me indispor
desnecessariamente falando mal do código alheio, mesmo tendo razão. Não, não se
indisponha. Experiência própria. Você gera inimigos desnecessariamente e torna o
ambiente de trabalho uma masmorra de tortura.

#### Leia e entenda onde cada coisa está

Ao invés de sair correndo para fazer o *fix* para resolver logo o problema,
procure saber, primeiro, onde está o problema. Entenda o código, sua estrutura,
suas premissas e invariantes. **Leia** o código, saiba o que cada parte faz.

> **Leia** o código antes de escrever a primeira linha do seu fix.

Em projetos muito grandes, é importante você achar o local onde é feita a saída
de determinada informação e fazer uma análise reversa, subindo a árvore de
chamada para entender como chegou-se até ali.

Por que fazer isso? Isto evita que você altere o ponto errado do código. Certa
vez dei manutenção em um código que gerava um relatório incorreto. Havia um
ajuste na saída do relatório por conta de outro defeito reportado para o mesmo
campo. O ajuste foi feito no local errado: a informação transitava incorreta
durante grande parte do sistema para ser corrigida na saída. O ajuste deveria
ter sido feito em outro lugar, onde a informação foi criada e não na saída do
relatório.

#### Seja assertivo e objetivo

Resolva o problema que você precisa resolver. Se acaso você encontrar outro
problema que não seja relacionado com o problema que você está consertando,
reporte-o ao invés de consertá-lo.

Se você conserta dois problemas ao invés de um, ninguém saberá que havia outro
problema e o gestor de configuração irá integrar à base de código dois *fixes*
ao invés de um. Isto quer dizer que você fez *bypass* no seu processo de
desenvolvimento.

Sair consertando uma penca de problemas ao invés do problema proposto causa mais
dano do que resolve. No afã de resolver os problemas, você complica os testes,
esconde a existência de outros problemas e, o que é pior, pode adicionar mais
instabilidade ao software inadvertidamente.

Ao reportar os outros problemas você ajuda a mensurar a qualidade do software,
indica que há problemas que precisam ser tratados e auxilia o gerente do seu
projeto a tomar as medidas necessárias para arrumar tempo para os outros
*fixes*. É importante que você tenha em mente que *tempo* é um recurso escasso e
que precisa ser muito bem justificado para ser usado.

#### Não existe código intocável

Alguns sistemas têm a mística de componentes que ninguém mexe. O fato é que
estes componentes podem ter defeitos ou podem ter sido escritos para uma
realidade que não é mais a realidade do sistema. Ninguém quer mexer no código
pois normalmente o código está no caminho crítico do sistema, ou seja, acoplaram
demais o sistema em torno daquele componente de tal forma que o sistema inteiro
pode parar se algo sair errado ali.

Componentes críticos precisam, sim, ser mantidos. No entanto, é preciso bastante
planejamento, cuidado e comprometimento para alterar este tipo de componente. O
que muda com relação aos componentes corriqueiros é o grau de responsabilidade
que uma manutenção destas exige.

Porém, ao tornar o componente intocável você começa a criar todo um castelo de
puxadinhos feitos para corrigir problemas do componente. Muitas vezes uma
manutenção bem planejada neste componente pode poupar vários desenvolvimentos
bem como pode elevar a eficiência do seu sistema por haver menos necessidade de
criação de código de *compatibilidade.*

#### Deixe a arrogância em casa

Por mais experiente que você seja, tenho uma má notícia: seu código é uma bosta.
Sempre tenha isso em mente: meu código é uma bosta. Faça disso um mantra. Não
confie no código que você escreve. O motivo é simples: você não é um deus da
perfeição. Um belo dia você pode brigar com a mulher, ser roubado, ou perder um
ente querido e ainda assim ter de programar. Você realmente acha que seu código
vai prestar de alguma coisa?

> Sempre comece a avaliar um problema partindo do código que você escreveu.
> Desconfie do seu código primeiro antes de dar o diagnóstico.

Somos todos criaturas emotivas. A emoção é algo bom, mas que pode avacalhar com
a nossa rotina profissional. Em um dia de mau humor seu código pode ficar
irremediavelmente ruim.

Assim, sempre que for avaliar um problema, sempre comece no código que você
criou. Não foi por que você quem escreveu o código que ele está perfeito. A
vantagem de começar de onde você escreveu é por que você conhece aquele trecho
de código que ali está. Garanta que aquilo que você fez realmente funciona. E
não tenha medo de admitir que você injetou um defeito no código. Ninguém coloca
defeito intencionalmente no código. Ninguém vai te crucificar por isto.

O fato é que se o seu gerente de projeto te crucificar, é melhor procurar outro
emprego. Isto é sintoma de que a empresa onde você está não faz a mais remota
ideia do que seja desenvolvimento de software.

#### Faça um pouco, teste um pouco

Esta é uma lição que aprendi com o mestre Nilo Mismetti, um dos programadores
mais experientes que eu já conheci. Ao invés de sair escrevendo sua solução toda
para depois testar, escreve um pouco dela, testa um pouco dela. E vá fazendo
isto gradualmente, até terminar.

Assim, ao terminar, o seu código terá sido todo testado e você poderá fazer o
deploy com a certeza que aquilo lá funciona, pelo menos nos cenários comuns e
esperados pelo software. Óbvio: haverão cenários inesperados nos quais seu
código será quebrado. Porém, ao fazer o desenvolvimento um passinho de cada vez
você verá o quando o seu código torna-se tolerante às falhas com o passar do
tempo.

A abordagem *big bang*, aquela na qual você escreve a solução inteira para
depois testar, não presta. Não importa qual metodologia você utilize, nunca faça
*big bang*. Escrever todo o código de uma vez parte da premissa, incorreta, de
que você tem toda a informação e o conhecimento do qual necessita para resolver
os problemas propostos. Parafraseando o grande mestre Dr. Cláudio Leonardo
Lucchesi:

> Você só sabe como desenvolver algo depois que termina.

Portanto, não ache que você tem todas as informações na largada. Você não tem.
Seja humilde e faça devagar. Isso vai te salvar fins de semana e feriados.

#### Resolver o problema é diferente de se livrar do problema

Cada vez mais programadores acreditam que é mais legal fazer código novo do que
consertar código legado. E, com isso, se livram do problema ao invés de
consertá-lo, principalmente se foram alocados temporariamente para bug fixing
enquanto estão em projetos de desenvolvimento.

Amigos, bug fixing é uma das tarefas pelas quais nós, programadores, somos
pagos. Existe uma coisa muito positiva no bug fixing que as pessoas ignoram: é a
grande oportunidade de estudar o negócio que o sistema automatiza. O grande
diferencial do programador não é apenas conhecer técnicas e linguagens de
programação, mas aprender sobre a matéria e a área na qual os sistemas nos quais
trabalha atua.

Ao ser alocado para resolver um problema, resolva-o. Tenha a disciplina de
entender o que está acontecendo, ser consistente na sua manutenção e atualizar
corretamente o controlador de versões.

#### Refactoring não é reescrever código

Muita gente entende errado qual a ideia do refactoring. Refatorar um código não
é reescrevê-lo. Na verdade, a refatoração deve levar a um código que receba as
mesmas entradas, use a mesma lógica e responda com a mesma saída do código
original. Nem mais, nem menos. O que muda é a facilidade de ler e manter o
código, tornando-o mais legível.

Muita gente acha que precisa sair refatorando código na primeira oportunidade. A
resposta é não: muitas vezes, apesar do código estar feio, refatorar o código é
anti-econômico devido a um problema simples: tempo. Não adianta brigar com o
gerente do projeto: se não há tempo, não refatore.

Não estou criticando a refatoração de código. Na verdade, refatoro meus códigos
com relativa frequência pois o código precisa evoluir juntamente com o problema
que resolve. No entanto, a refatoração precisa ser economicamente viável. Muitas
vezes o seu gerente não vai te deixar refatorar o código. E não é por que ele é
um babaca arrogante, mas por que não há tempo hábil para isso.

> Reescrita de código só causa uma coisa: dor-de-cabeça

Se você propuser, ainda assim, refatorar o código, assuma a responsabilidade de
usar o pouco tempo que tem, arriscar adicionar bugs no seu software e testar
isso direito. Eu já fui testemunha de programadores que assumiram refatorar
código, ficaram sem tempo e terminaram com os braços cruzados dizendo que não
conseguiam entregar no tempo estipulado por eles mesmos. Ou seja, avaliaram mal
o tempo disponível e o tamanho da encrenca.

Se o seu refactoring ultrapassa o limite de um ou outro método dentro de uma
classe ou de uma ou outra função, você deixou de refatorar e está é reescrevendo
o código. Não faça isso! Reescrita de código só causa uma coisa: dor-de-cabeça.

O que eu quero dizer aqui é o seguinte: refatorar é sempre desejável,
principalmente em sistemas legados, mas é preciso que seja algo que traga
vantagens palpáveis. Refatorar só por que você acha que o código é uma bosta não
é motivo suficiente para isto. Lembre-se: o que você faz é uma atividade
econômica e não um projeto de ciências da escola.

Da mesma forma que o refactoring, a reescrita de código precisa ser muito bem
justificada. Normalmente o código precisa ser reescrito quando as premissas
originais não são mais verdadeiras. Aí sim a reescrita se justifica. Porém, se
as premissas iniciais do projeto se mantém, a reescrita gera retrabalho, consumo
de tempo e recursos que precisam ser muito bem justificados. Como eu disse, nós,
programadores, executamos uma atividade econômica.

#### Criminoso falando do crime

Para finalizar, uma auto-crítica. Como disse lá no início, tudo o que escrevi
aqui eu já fiz. Eu costumo dizer que *experiência é o conjunto de merda que
fizemos no passado*. E é verdade. Porém, é preciso aprender com os erros para se
dar a liberdade de cometer novos erros e não repetir erros anteriores.

Apesar disso, não sou o dono da verdade. Na minha experiência, essas coisas
todas que eu disse para você não fazer foram muito dolorosas. Note: **minha
experiência**. Cada um de nós tem um conjunto próprio de experiências. A minha
serve só para mim. Pode não servir para você. No entanto, é bom ouvir as pessoas
mais experientes — eu sempre procuro trocar figurinhas com programadores mais
experientes do que eu.

Independentemente do seu nível ou grau de maturidade na área, você sempre estará
na cadeira do aluno pois sempre há algo novo a aprender. Esta á uma das grandes
vantagens, a meu ver, na área de tecnologia. Sempre há novidade.
