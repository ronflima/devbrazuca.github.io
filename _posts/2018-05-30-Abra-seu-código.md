---
layout: post
title: Abra seu código
subtitle: Mas não todo ele.
image: "https://cdn-images-1.medium.com/max/800/1*m40iZNbR8KmpYqvTqAUJtQ.jpeg"
author: ronaldo
categories: [Programação]
---

Já há algum tempo que escrevi um
[artigo](2015-12-04-Por-que-registrar-código-fonte-não-faz-sentido) justificando
por que registrar código não faz mais sentido nos dias de hoje. Afinal o
conhecimento, e não o código, é o ativo mais importante de qualquer empresa de
tecnologia hoje em dia.

Sou um pouco suspeito para falar de abertura de código, principalmente por que
apoio o movimento de código aberto desde quando tive notícias de sua existência,
há vários anos atrás. Porém, trabalhando como CTO de uma startup, estou cada vez
mais convicto de que a abertura do código não só é benéfica, mas vem se tornando
uma necessidade para que empreendimentos permaneçam competitivos em um mercado
tão apertado como o de hoje em dia.

No nosso tempo houve duas revoluções: a primeira, causada pela internet que fez
com que as barreiras do mundo caíssem; a segunda, causada justamente pelo código
aberto, que permitiu que pequenas iniciativas concorressem em pé de igualdade,
em termos tecnológicos, com grandes corporações. Mas, por que abrir o código e
como fazer isso?

# As duas partes do seu código

Todo código, geralmente, é formado por duas partes bem distintas: o código de
domínio geral, que oferece o suporte para o software; o código de domínio
específico, que fornece a funcionalidade principal do software em questão.

O código de domínio geral implementa funcionalidades que praticamente todo
sistema tem: login, recuperação de senha, interface REST com determinado
serviço, e por aí vai. Ou seja, trata-se de um tipo de código que você ia ter de
implementar mesmo e que funciona como suporte à funcionalidade principal da sua
aplicação. Não é algo que tenha atribuído a si um *know-how* específico nem,
tampouco, uma pesquisa e desenvolvimento específicos para isso.

Quer um exemplo rápido? Uma rotina para calcular o *hash* MD5. O algoritmo está
descrito pela [RFC 1321](https://www.ietf.org/rfc/rfc1321.txt), um documento
público. Para criar uma implementação, basta ler a RFC e escrever na sua
linguagem. Porém, é um algoritmo tão manjado que já há diversas implementações,
para diversas linguagens, disponível como código livre e aberto. Se o seu
software precisa emitir notas fiscais, ele precisa usar o MD5, só que o know-how
do seu software não está nem na emissão da nota fiscal eletrônica (é um
documento público) nem no cálculo do hash MD5.

Já o código de domínio específico implementa funcionalidades muito específicas
que dificilmente poderão ser utilizadas em outro contexto que não do seu próprio
sistema.

# O que tornar público?

Não faz sentido tornar código de domínio específico público. E a minha
justificativa é simples: como é que você reusa algo que foi criado para ser
muito específico? O grau de reutilização e generalização é tão baixo que adaptar
isto para usar em outro contexto é tão caro que não vale a pena.

Por outro lado, o software de domínio geral, bem, é outra estória. É um
candidato a ser publicado para quem quiser ajudar na manutenção e quiser usar em
seus próprios sistemas. A justificativa é simples: é suficiente geral para que
possa ser adaptado a diversos contextos com pequeno esforço de integração.

# Por que tornar público?

Custo e qualidade, simples assim. A manutenção fica muito mais barata, a
qualidade fica muito melhor e, no fim, você terá um componente estável e muito
bem testado para usar no seu sistema.

Em contrapartida, pelo fato do código estar aberto, quem estiver ajudando
voluntariamente no projeto também tem o benefício de utilizá-lo em seus projetos
próprios, que o cria um vínculo de *ownership* com a base de código, além de
criar uma comunidade que vai efetivamente usar o código feito aberto.

Ou seja, é um jogo de *ganha-ganha*: você ganha ao ter um software mais estável
e de melhor qualidade, e a comunidade que usa o software ganha por que pode
usá-lo sem restrições em seus próprios projetos, além de disseminar conhecimento
sobre técnicas de desenvolvimento e linguagens de programação.

# Todo mundo ganha

Algo que sempre gostei no modelo do software livre é que todo mundo sai
ganhando. E aqui é importante fazer a distinção entre *free beer* e *free
speech*: código livre não é, necessariamente, gratuito. Sim, você pode ganhar
dinheiro com software livre. Muita gente faz isso para viver.

Por exemplo, o Ubuntu é um sistema operacional livre. A Canonical, fabricante da
distro, ganha dinheiro com cursos, consultoria e venda de licenças de versões
estáveis de produção com suporte 24x7. Não é errado cobrar pelo seu trabalho.
Afinal, você tem contas a pagar.

Porém, além da compensação monetária, quem se envolve com o projeto de forma
voluntária também ganha: evidência na comunidade, conhecimento, ferramentas que
poderá usar em seus próprios projetos e a possibilidade de concorrer de igual
para igual com gigantes do mercado.

O software livre é hoje quase uma obrigação. Por exemplo, a Apple mantém [vários
projetos](https://opensource.apple.com) de código aberto. Estes projetos são
ferramentas que dão suporte a vários serviços dos sistemas operacionais da
empresa, incluindo-se o iOS. A própria Microsoft vem abrindo à comunidade seu
código proprietário, no intuito de criar soluções cada vez mais poderosas para
seus ambientes.

Vale dizer, também, que os principais frameworks para trabalhar com inteligência
artificial são de código aberto. Ou seja, trata-se de um modelo sustentável onde
todos os que participam ganham algo de alguma forma.
