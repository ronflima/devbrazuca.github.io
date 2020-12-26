O banco de dados distribuído
============================

Seu database hoje está em todo lugar.

------------------------------------------------------------------------

### O banco de dados distribuído

#### Seu database hoje está em todo lugar.

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*glUyflKnooLJsJRALtHOjA.jpeg" class="graf-image" />
</figure>Pense no seguinte cenário: você tem uma aplicação que tem como
interface uma página web, um aplicativo para celular, um aplicativo para
tablet e um aplicativo para computadores desktop. Fácil de imaginar,
não? Vários serviços, hoje em dia, trabalham desta forma e todos têm o
mesmo problema: onde ficam os dados?

Os dados tornam-se naturalmente distribuídos. Pense comigo: o cara no
celular cria conteúdo, conteúdo este que converte-se em um modelo de
dados que, por sua vez, é enviado a um web service que, por sua vez,
persiste isto num arquivo, num SGBD, não importa. Onde está o conteúdo?

Neste cenário, temos a mesma informação salva no dispositivo móvel
celular e num banco de dados sabe-se lá Deus hospedado onde. A questão
aqui é que a informação está distribuída. O mais interessante: o upload
da informação para o web service nada mais é que uma mera rotina de
sincronização. Ou seja, estados criados no dispositivo do usuário
tornam-se estados exportados para um banco de dados que os armazena fora
do contexto do dispositivo.

Se formos um pouco além, imaginemos que estes mesmos dados foram
compartilhados com alguns amigos. Cada amigo recebe uma cópia dos dados
também numa espécie de sincronização. O nó central, na verdade, age como
um coordenador de sincronização, distribuindo a informação para diversos
pontos onde ela pode ser finalmente consumida.

O interessante neste pensamento é que hoje os bancos de dados operam de
uma forma bem diferente de quando foram concebidos. Hoje são
persistências temporárias de informações que precisam ser sincronizadas
entre diversos pontos. Temporárias? Sim, temporárias. A informação hoje
em dia tem prazo de validade. Informação antiga vira histórico e sempre
é substituída por uma informação nova, um fato novo.

Pense num sistema de folha de pagamentos, por exemplo. A folha que está
em aberto contém informações novas. As folhas que já foram processadas
e, efetivamente, pagas, são informações obsoletas. Para o efeito de
pagamento dos empregados de uma empresa, a folha de um mês anterior só
serve para fins de contabilização. É informação obsoleta pois não tem
mais interferência em pagamentos futuros. Já foi paga.

A questão é que hoje vivemos uma época em que a informação é
inerentemente distribuída. Veja, por exemplo, seu Whatsapp. As mensagens
que você publica em um grupo são replicadas para cada pessoa que
participa deste grupo. O servidor do Whatsapp apenas é um coordenador.
Ele coordena para quem as mensagens devem ser enviadas. O seu telefone,
inclusive, mantém uma cópia local das mesmas mensagens, criando um banco
de dados inerentemente distribuído.

Quando a Sun lançou o RPC, lá pelos idos de 1985, a ideia era de que a
rede é o computador. Esta afirmativa não poderia ser mais verdadeira.
Hoje vários sistemas são, na verdade, uma coordenação de dados
distribuídos em vários sistemas distintos. Quer um exemplo? O Medium usa
o login do Google ou do Facebook para autenticar os usuários, ou seja,
os dados do usuário estão distribuídos. Se você está lendo este texto,
ele está armazenado, temporariamente, nos caches do seu navegador. O
serviço web apenas entregou o texto para você, sincronizando seus dados
com o coordenador central.

É interessante pensar desta forma pois isso ajuda a projetar sistemas
mais eficientes em uma época na qual os dados são naturalmente
distribuídos. Os dados distribuídos passam a ser localizados pelo seu
URL ao invés de sua chave estrangeira. Ou seja, você deixará de usar
referências a dados internos do seu banco de dados para referências para
dados externos criando-se, assim, um sistema interligado tendo a
internet como meio de transporte de dados.

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [November 1, 2016](https://medium.com/p/252680041b50).

<a href="https://medium.com/@ronaldolima/o-banco-de-dados-distribu%C3%ADdo-252680041b50" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
