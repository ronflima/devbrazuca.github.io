Um programador conservador
==========================

Coisas que se aprendem levando na cabeça.

------------------------------------------------------------------------

### Um programador conservador

#### Coisas que se aprendem levando na cabeça.

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*cWoMi6Q51uAHkdsdz_exdA.jpeg" class="graf-image" />
</figure>Muitas vezes os programadores mais novos não entendem por que
nós, programadores mais velhos, temos restrições com relação a usar
novas bibliotecas e novas técnicas para projetos de produção. Este
conservadorismo não está relacionado a falta de estudos ou coisa
parecida. Na verdade, é aqui que a experiência faz a diferença.

Novos métodos e novas tecnologias são legais. Eu estou sempre tentando
me atualizar, apesar de ainda andar a passos lentos em vários aspectos,
por que não gosto de conhecer algo superficialmente. Novas formas de
fazer as coisas são legais, mas existe um viés: o mundo é lindo no
caminho feliz, mas e se as coisas derem errado?

Novas técnicas ainda não são suficientemente maduras para serem taxadas
como boas, produtivas e eficazes. Novas bibliotecas e novos componentes
ainda não foram suficientemente testados e usados em ambientes de
produção para que sua eficácia seja comprovada. Testes automatizados
nunca conseguem reproduzir problemas que só aparecem em produção e não
dá para você prever todos os problemas que podem acontecer.

É preciso saber quando usar novas técnicas, componentes e formas
diferentes de fazer as coisas. Você não vai usar uma biblioteca nova de
rotinas em um projeto crítico. A probabilidade de você chutar um defeito
complexo nesta biblioteca é muito alta, o que pode aumentar
consideravelmente o risco do seu projeto.

Existe um meio-termo aqui: também evitar usar novas técnicas por que as
antigas funcionam não é conservadorismo: é teimosia. Sempre aparecem
coisas novas que merecem ser observadas, aprendidas e usadas. Mas nem
sempre o que é novo é bom.

Há uma certa visão deturpada na área de computação que leva as pessoas a
acreditarem que o novo é melhor. Nem sempre. Em vários casos o novo é
apenas uma releitura do antigo. Sabe os web services?! Na década de 1990
eram client/server. Mudou-se apenas a forma como o cliente comunica-se
com o servidor. Sabe o web socket? É só uma abstração para usar o
protocolo HTTP como transporte para conexões permanentes — algo que se
fazia com BSD sockets há anos atrás. Estas tecnologias são releituras de
tecnologias mais antigas.

Na minha visão, é preciso usar coisas novas em projetos *piloto*, ou
seja, projetos de baixo risco que podem acomodar problemas gerados pela
possível instabilidade ainda existente em técnicas, bibliotecas e
componentes de software novos. Esta é a melhor forma de entender os
limites das tecnologias, sem comprometer o projeto. Não há coisa pior
que descobrir, depois de entrar em produção, que determinada tecnologia
tem alguma dependência ou limitação tal que vai tirar suas noites de
sono.

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [February 12, 2017](https://medium.com/p/c18ce7cb6361).

<a href="https://medium.com/@ronaldolima/um-programador-conservador-c18ce7cb6361" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
