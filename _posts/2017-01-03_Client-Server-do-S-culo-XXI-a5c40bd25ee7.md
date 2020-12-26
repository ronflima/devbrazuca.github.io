Client/Server do Século XXI
===========================

Por que tecnologias antigas são importantes.

------------------------------------------------------------------------

### Client/Server do Século XXI

#### Por que tecnologias antigas são importantes.

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*a5NXsaRSvT7W2TIDDiogIw.jpeg" class="graf-image" />
</figure>A tecnologia cliente/servidor apareceu na década de 1960, como
um objeto de estudo. Depois, no fim dos anos 1970, um paper escrito pela
Xerox-PARC cunhou o termo, que tornou-se popular no início dos anos
1990. A tecnologia cliente/servidor popularizou-se nos ambientes das
redes locais de computadores, na década de 1990. A ideia era separar
responsabilidades, deixando no cliente parte da funcionalidade que era
implementada por um ponto central, o servidor.

De lá para cá a tecnologia saiu do ambiente local e ganhou a WAN, mais
precisamente a Internet. Mudou-se a forma do cliente conectar-se ao
servidor. Ao invés de conexões persistentes, passou-se a usar um modelo
request/response que é implementado pelo protocolo HTTP. Porém, uma
coisa continuou a mesma: um cliente dependendo de um servidor.

Os apps atuais são um grande exemplo de como a tecnologia
cliente/servidor continua a mesma: alguns apps são *thin clients*, ou
seja, clientes com um mínimo de funcionalidades e totalmente dependentes
do servidor; outros são *fat clients*, ou clientes que tem bastante
funcionalidade e podem operar *off-line,* porém sincronizando dados com
o servidor quando este volta a estar acessível.

Esta arquitetura sempre sofreu de um problema, que hoje tem um nome
bonito: escalabilidade. Diversas tecnologias tentaram resolver este
problema: RPC, RMI, CORBA, COM+ e por aí vai. A ideia era distribuir o
processamento por um punhado de máquinas de forma que um conjunto de
máquinas pudesse dar o resultado de uma requisição originada por um
cliente, de forma a suportar um volume elevado de requisições.

Porém, todas essas tecnologias sempre esbarraram na mesma limitação: a
centralização do banco de dados, que ainda hoje é um problema difícil de
resolver. Alguns *engines* implementam uma tecnologia chamada de
*sharding*, que permite que os dados fiquem distribuídos por vários nós.
Todos os nós atuam como uma única máquina, criando um result set que é
formado de dados provenientes de diversas origens.

As tecnologias que envolvem o ambiente cliente/servidor, mesmo hoje, não
são simples. São bastante complexas e criam uma interdependência de
serviços e funcionalidades que dificilmente uma única pessoa consegue
ter o domínio de todas.

O fato é que os sistemas hoje em dia não podem mais ser pensados como
uma coisa única. A demanda do mercado exige que os sistemas sejam
altamente heterogêneos, envolvendo diversas tecnologias e linguagens
distintas de programação. A ideia de usar uma única linguagem para
implementar todo um sistema complexo chega a ser utópica.

Os sistemas atuais, incluindo-se aqui os apps para celulares, tablets e
mesmo para desktops, exigem, naturalmente, distribuição de
processamento, armazenamento e alto grau de segurança e confiabilidade.
Com as informações disponíveis em uma grande variedade de mídias, algo
essencial para a continuidade no trabalho, é natural que tenhamos vários
clientes distintos operando no mesmo servidor, mesmo que através de
interfaces distintas, dependendo do caso.

Assim, chegamos ao âmago da questão: nem sempre uma tecnologia tida como
*antiga* é realmente antiga. Muitas vezes ela foi repaginada, adaptada
mas, conceitualmente, continua sendo exatamente a mesma coisa de como
era antigamente. Por exemplo, na década de 1990 os gerenciadores de
transação começaram a ficar populares, principalmente quando o CORBA
teve seu ápice. O gerenciador de transação é uma tecnologia inventada no
*mainframe*.

Outra tecnologia antiga, mas ainda em uso, são as filas de mensagens.
Softwares como Rabbit MQ ou o MQ Series são baseados em tecnologias
muito antigas. O fato é que não se deve ignorar as tecnologias antigas
pois estas são a base de várias tecnologias ainda em uso.

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [January 3, 2017](https://medium.com/p/a5c40bd25ee7).

<a href="https://medium.com/@ronaldolima/client-server-do-s%C3%A9culo-xxi-a5c40bd25ee7" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
