---
layout: post
title: "Causos: Programando no escuro"
subtitle: Isso aconteceu de verdade!
image: https://images.pexels.com/photos/1040499/pexels-photo-1040499.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260
author: ronaldo
categories: [Causos. Programação]
---

Depois de trocar algumas mensagens com um amigo pelo Facebook, resolvi
contar alguns "causos" que aconteceram ao longo da minha carreira
profissional. Vou contar o milagre, mas não vou dizer quem são os
santos. Não é minha intenção expor ninguém ao ridículo, mas contar
casos engraçados que acontecem no dia-a-dia de quem trabalha com
tecnologia da informação.

Para localizar o caso no tempo, isso aconteceu em meados
de 1999. Nessa época eu trabalhava em uma integradora de sistemas que
prestava serviços para um grande cliente na área de telefonia móvel
celular. A empresa cliente havia acabado de mudar-se para um prédio
novinho em folha. E este prédio precisava de manutenção no
alimentador, o que exigiu um dia inteiro sem energia elétrica.

Obviamente que a manutenção aconteceu num fim de semana, mais
precisamente em um sábado. E tudo aconteceu neste sábado
fatídico. Partes do sistema que estávamos desenvolvendo estava já em
fase de implantação. E uma parte chave, que gerava cartas de cobrança,
estava para entrar em produção. 

Por efeito de uma série de imprevistos, a homologação atrasou a ponto
de ser necessário colocar em produção o mais rápido possível por conta
dos prazos de envio das cartas e da arrecadação. O que ninguém
esperava era que o software estivesse com um bug sério que impedia a
criação correta das cartas de cobrança.

O programador que tinha escrito o software não estava
disponível. Havia sido contratado através de uma consultoria sediada
em outra cidade e neste fim de semana ele havia voltado pelo flyback a
que tinha direito. Não havia outra pessoa para resolver o problema.

Acabei envolvido no assunto porque me ligaram e atendi. Sempre atendi
ligações da empresa. Naquela época, era oportunidade de ganhar algumas
horas extras, o que ajudava bastante na faculdade. E lá fui eu para
entender o problema.

O software criava um [job
JCL](https://pt.wikipedia.org/wiki/Job_Control_Language) que era,
então, encaminhado para um birô de impressão que, por sua vez, imprima
as tais cartas de cobrança. O job era, basicamente, um arquivo texto,
que continha as cartas de cobrança ordenadas. Porém, a ordenação tinha
uma pegadinha: a impressora colocava duas cartas de cobrança na mesma
folha impressa. Depois de terminada a impressão, a pilha de folha era
guilhotinada ao meio e a pilha da esquerda era colocada por sobre a
pilha da direita. A pilha final tinha que, necessariamente, ficar na
ordem correta, senão as cartas eram enviadas para as pessoas erradas. 

Quando comecei a trabalhar na resolução do problema era tarde, logo
após o almoço. Me recordo que era um dia muito bonito. A energia do
prédio já estava cortada e a concessionária de energia fazia a
manutenção necessária. Tudo estava funcionando com no-breaks. Fui me
inteirando do código, que não era nada pequeno. E vamos lá!

O tempo foi passando e nada de achar uma solução para o tal
algoritmo. Testa, manda para avaliação, erro. Muda algoritmo, testa,
avalia, continuava errado. Foi escurecendo. E nada da concessionária
terminar a manutenção. Lá pelas 7 da noite, já trabalhando no escuro,
a pressão começou a aumentar. O cliente estava impaciente. Precisava
mandar logo o tal arquivo para o birô de impressão.

O gerente do projeto, no intuito de mitigar a situação deu uma
solução, no mínimo, inusitada: digitar as 15 mil cartas de cobrança no
Word para enviar para os clientes inadimplentes. Já não acreditavam
mais que eu conseguisse resolver o problema. Imagina digitar 15 mil
cartas de cobrança! Eram, pelo menos, 5 tipos diferentes. Daria para
fazer uma automação no Word, mas isso exigiria ter de virar a noite,
passar o domingo lá e provavelmente seguir até a segunda-feira fazendo
isso.

Não tive dúvida: pedi paciência, e desci o braço no código. Já estava
naquela fase que o povo pergunta a cada cinco minutos se estava
terminando e já me apertavam para fazer o negócio no Word.

Eu sempre me considerei um cara de sorte no que diz respeito aos
computadores. No último minuto, abriu um buraco no céu e desceu uma
luz de inspiração que me deu uma ideia louca. Eu já estava convencido
de que o meu fim de semana já estava perdido. Não custava seguir a
intuição.

Naquela época os monitores ainda eram CRT. Apesar de não conseguir ver
a parede do outro lado da sala por conta da escuridão, o teclado
estava iluminado pelo monitor. Como a minha visão nunca foi meu
atributo mais forte, já sentia dificuldade em ver as teclas e
praticamente já digitava por instinto. Naquela época eu ainda olhava
para o teclado para digitar. Era mais catilógrafo do que datilógrafo. 

Fiz as alterações já resignado em escrever as tais 15 mil cartas no
Word. Teste, muda cenário, teste novamente. Funcionou com a base de
testes! Mudaram cenários, tentaram quebrar de todo jeito. A intuição
realmente salvou o meu dia, e o que restava do meu fim de semana.

## Moral da História

Acredite na sua intuição. Ela pode te salvar. Por isso que digo que
programar computadores é muito mais do que uma tarefa puramente
técnica. Existe esse lado quase artístico que leva nós, programadores,
a tirar um coelho da cartola nos momentos mais insólitos.

Desde este episódio que passei a escutar mais a minha intuição quando
estou escrevendo código. Já criei alguns algoritmos ao longo da minha
carreira profissional que resolvem problemas complexos com pouquíssimo
código, tudo criado de forma intuitiva. Com o passar dos anos, isso
evolui, mas a parcela intuitiva faz toda a diferença.
