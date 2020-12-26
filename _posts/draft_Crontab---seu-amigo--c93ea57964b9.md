Crontab é seu amigo!
====================

Da série: conheça o seu sistema operacional

------------------------------------------------------------------------

### Crontab é seu amigo!

#### Da série: conheça o seu sistema operacional

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*6jjqLSq4fbnHgqK7ScOVFA.jpeg" alt="Photo by Jordan Benton from Pexels" class="graf-image" /><figcaption>Photo by <a href="https://www.pexels.com/@bentonphotocinema?utm_content=attributionCopyText&amp;utm_medium=referral&amp;utm_source=pexels" class="markup--anchor markup--figure-anchor">Jordan Benton</a> from <a href="https://www.pexels.com/photo/shallow-focus-photography-of-hourglass-1095602/?utm_content=attributionCopyText&amp;utm_medium=referral&amp;utm_source=pexels" class="markup--anchor markup--figure-anchor">Pexels</a></figcaption>
</figure>A reinvenção da roda, atualmente, tornou-se lugar comum. Não
canso de ver coisas vendidas como novas que são, na realidade, uma
implementação diferente de algo que já existe. E tento entender por que
as pessoas insistem em usar algo que se diz novo, que provavelmente é
instável em detrimento de ferramentas que existem há anos, estáveis e
que funcionam da mesma forma. Assim, na série Conheça o seu Sistema
Operacional aqui vai uma ferramenta fantástica: cron e crontab!

#### Lá dos anos 70

O agente cron e a sua tabela de configuração, a crontab, surgiram na
universidade de Purdue, no VAX. Ou seja, a ideia de um agente que
tivesse a capacidade de executar uma tarefa agendada não é,
absolutamente nova. Com a evolução da tecnologia, o agente foi portado
para o Unix, depois para o Linux e mesmo o Windows tem uma implementação
similar, o *Task Scheduler*, que basicamente realiza a mesma coisa.

O macOS tem o iCal, que permite que fluxos de trabalho feitos no
Automator sejam executados à moda do cron. Ou seja, todo sistema
operacional vem com alguma implementação disso, visto que trata-se de um
problema basicamente comum e que todo mundo acaba, cedo ou tarde,
precisando. 

#### Por que crontab?

Bom, este artigo foca-se na crontab. E por que? Por que hoje em dia é
quase uma obrigação usar servidores Linux para hospedar sistemas. Mesmo
sistemas que usam algum tipo de container acabam, por fim, usando o
Linux como sistema operacional base. Há implementações que usam o
Windows Server Core, mas é raro ver algo assim — normalmente quem
trabalha com o stack de desenvolvimento da Microsoft acaba preferindo
usar o Windows Server por razões nem sempre tão óbvias: o Windows é o
melhor sistema operacional para sistemas multi-threaded.

A crontab tem uma série de vantagens. A primeira: é nativa no Linux. Se
a sua distro não veio com a instalação do agente cron, basta usar seu
gerenciador de pacotes para fazê-lo. Há, inclusive, alguns agentes como
o Anacron, que oferece uma série de vantagens. 

Por ser um sistema flexível, o agente cron permite que qualquer comando
seja executado, não importa linguagem, plataforma, nada. Basta que seja
possível executar o comando via shell e pronto. 

[View original.](https://medium.com/p/c93ea57964b9)

Exported from [Medium](https://medium.com) on December 25, 2020.
