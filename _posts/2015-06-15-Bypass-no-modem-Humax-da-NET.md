---
layout: post
title: Bypass no modem Humax da NET
image: assets/images/2015-06-15-Bypass-no-modem-Humax-da-NET-01.jpeg
author: ronaldo
categories: [Tutoriais]
---

Eu trabalho em casa, no famoso esquema *home office*. Assim,
dependo da conexão da NET para que minha atividade possa ser levada à
cabo.

Para velocidades de conexão até 15Mbps, a NET utiliza-se de um modem
Motorola que não tem capacidade de roteamento ou comutação. Para
velocidades superiores, a NET oferece o modem Humax que além de modem
ainda é roteador, base wifi e firewall.

O problema do modem Humax é que as funções de roteamento, firewall e a
base wifi são bem ruins. Como eu usava o modem Motorola, já tinha minha
pequena infra de rede já bem determinada: um Apple Airport Extreme como
router principal e um Airport Express como extensor de rede, para
distribuir o sinal nos dois andares de casa.

Bem, quando a NET fez o upgrade da minha velocidade fez, também, o
upgrade do meu modem. E aí surgiram os problemas: o modem Humax
interpôs-se entre minha estrutura e a internet, tornando a conexão uma
bela josta, para não dizer outra coisa.

A ideia, portanto, era colocar o equipamento da NET em modo *bypass* e
ignorar as funções dele. Porém, o equipamento não oferece isso de forma
explícita e foi preciso estudar uma série de publicações pela internet
afora para atingir a configuração mínima necessária para que fosse
possível fazer o *bypass*.

Os artigos que encontrei ofereciam configurações extremas e eu consegui
o mesmo resultado sem, contudo, alterar demais os parâmetros do modem da
NET. Tenha em mente que as configurações que apresento aqui vão desligar
completamente as funções de roteamento, DHCP, firewall e wifi do modem
Humax. Estas funções serão assumidas por algum router que você deseja
usar.

Então, vamos deixar de conversa e vamos ao que fiz para colocar o
equipamento da NET em modo *bypass*.

1.  <span id="bb11">Faça login no seu modem como administrador. O
    usuário/senha padrões são admin/password. Por padrão, o endereço do
    seu modem pela rede interna é 192.168.100.1.</span>
2.  <span id="4256">Desabilite completamente a wifi, visitando o item
    Wireless. Desligue tanto a rede wifi principal quanto a de
    convidados.</span>
3.  <span id="07da">Agora o pulo do gato: você precisa saber o MAC
    ADDRESS da interface WAN do seu roteador. Anote isso pois você vai
    precisar disso.</span>
4.  <span id="3631">Ainda no painel de configurações do seu modem, vá em
    *Advanced/Options.* Ali há uma caixa de configuração na qual diz:
    *PassThrough Mac Addresses.* Adicione ali o MAC ADDRESS da porta WAN
    do seu router, clique em *Add Mac Address* e, por fim, em *Apply.*
    Esta configuração faz o *bypass* da internet diretamente para o seu
    router.</span>

Pronto! Feito isso basta reiniciar tudo e prontinho: você volta a usar o
seu roteador como antes e desabilita as funções desnecessárias no modem
da NET.

Como eu disse, testei estas configurações no intuito de encontrar a
menor configuração possível que permitisse a conexão direta da internet
com meu equipamento.

#### EDIT 1 — Nova interface modem Humax

A NET fez um upgrade nos modems Humax, melhorando a interface de
configuração. O upgrade, de certa forma, foi muito benéfico e facilitou
a configuração.

Se o seu modem sofreu o upgrade, não se aflija. É muito mais fácil do
que você imagina. Entre em *Advanced Network Settings* e depois em
*Básico* (ou *Basic* se o seu modem estiver em inglês). Ali aparecerá
uma aba *Definir* (ou Settings). Clique nesta aba e depois procure pela
opção *Modo Switch*.

![tela](/assets/images/2015-06-15-Bypass-no-modem-Humax-da-NET-02.png)

Na caixa de seleção desta opção, selecione *Bridge*. Salve e é
só isso. A partir daí o seu modem passa a funcionar no modo bypass sem a
necessidade de informar MAC Address e mais nada.

Lembre-se, porém, de desligar o rádio do seu modem. Em *Sem Fio (ou
Wireless)*, vá em *Rede Primária* e desative-a. Esta última atualização
do modem não permite que você desligue o rádio na opção *Rádio*. Porém,
isto é suficiente para desligar o wi-fi deste equipamento.
