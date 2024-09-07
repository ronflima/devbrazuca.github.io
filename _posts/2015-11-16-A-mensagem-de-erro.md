---
layout: post
title: A mensagem de erro
image: https://cdn-images-1.medium.com/max/800/1*PgPq_cM7S1N-YoUugFJcOQ.png
author: ronaldo
categories: [Programação]
---

Você escreveu aquele software maneiro e quando o usuário foi
usar, aconteceu uma coisa errada: erro ao salvar o arquivo de dados!
Provavelmente sua empresa vai pedir para você codificar esse erro com
números hexadecimais, código de erro, código de localização, código de
status e sei lá mais que caralho de asa.

Para que essa complicação é útil? Para nada. Para os olhos do usuário
basta uma mensagem simples: o que você tentou fazer **deu pau**. Todo
usuário entende o que é dar pau. É quando o programa não consegue levar
a cabo aquilo que deveria fazer. Deu pau, simplesmente isso.

Para que sobrecarregar o usuário com informação? O programador só
precisa saber onde a coisa estourou, qual trecho de código cuspiu o
diabo da mensagem de erro. Seja simples: fale que deu pau e pronto.
Salve em algum canto um log com as informações detalhadas e, se
possível, faça com que o seu software envie o log por email,
automaticamente.

Para o usuário qualquer codificação que você colocar na tela de erro não
faz nenhum sentido. Pior: ele pode falar coisas completamente diferentes
ao telefone quando estiver solicitando suporte técnico. O fato é que ele
irá interpretar a mensagem de erro dentro do nível de conhecimento dele.
E isso é ruim pois ele pode lhe dar pistas erradas, informar
incorretamente a sequência de coisas que estava fazendo e por aí vai.

O melhor é: faça um log decente de atividades. Deu pau? Fale que deu pau
para o usuário e salve o log para envio. Quer saber o que o usuário
estava fazendo? Leia o cacete do log!

Ao invés de ficar inventando moda escrevendo o seu subsistema de log ou
usando alguma biblioteca mirabolante, use o que o sistema operacional
tem. Todo sistema operacional tem um sub-sistema de logging que é
fantasticamente bem concebido. Esses sistemas garantem a escrita de
informações mesmo que seu programa tenha patinado feio na memória. Em
uma sessão de um *log me in* você consegue rapidamente extrair o log da
máquina do usuário, em caso de sistemas desktop, ou do servidor onde
está seu sistema através de um ssh.

Simplifique a sua vida e a vida do seu usuário. Dê mensagens diretas
para ele e crie logs com os detalhes que você precisa para fazer uma
análise decente. Deixar para o usuário indicar para você o que apareceu
na tela do computador dele é pedir para ter uma dor-de-cabeça infindável
e um vai-e-vem de emails, telefonemas e encheção de saco.

Acredite: até mesmo o Windows tem um sistema de logging decente. O linux
e o unix tem o *syslog*, um daemon que garante a escrita das informações
em um diretório específico, normalmente */var/log*. Esses sistemas são
tão completos que você pode dizer o que é o tipo de log (depuração,
produção, advertência, etc), pode configurar níveis de log e por aí vai.
Esses sistemas fazem rotação de log, limpeza e arquivamento.

Bom, se você usa sistema de log baseado em biblioteca que você mesmo
escreveu ou não usa, compre aspirina. Você vai precisar.
