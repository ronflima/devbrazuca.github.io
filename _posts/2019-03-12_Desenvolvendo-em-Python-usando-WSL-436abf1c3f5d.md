Desenvolvendo em Python usando WSL
==================================

Como ajustar seu ambiente Windows 10

------------------------------------------------------------------------

### Desenvolvendo em Python usando WSL

#### Como ajustar seu ambiente Windows 10

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*ZYZfAKsFVhWlRJjMuC-dvg.png" class="graf-image" />
</figure>Desde que migrei do macOS para o Windows 10 tenho procurado
formas de desenvolver as soluções da empresa no ambiente mais próximo do
ambiente de produção. É óbvio que o ambiente de produção, que está hoje
no Debian Stretch, é bem diferente do Windows. Mas há uma camada de
compatibilidade que a Microsoft vem desenvolvendo que está quase lá.

Antes de começar, um pequeno aviso: este artigo parte da premissa de que
o plugin para Python do VSCode está
<a href="https://github.com/Microsoft/vscode-python/issues/67" class="markup--anchor markup--p-anchor">sem suporte adequado</a>
para o WSL como shell.

#### Antes de começar

O Windows Subsystem for Linux é uma camada de compatibilidade que
permite que executáveis ELF rodem dentro do Windows sem a necessidade de
virtualização. Em teoria, deveria ser mais eficiente executar uma
aplicação linux dentro do WSL do que numa VM.

O WSL, no entanto, só está disponível para as versões de 64 bits do
Windows. Se o seu Windows é uma versão 32 bits, o upgrade é mandatório.

#### Passo 1: Instale o WSL e a sua Distro predileta

Para instalar o WSL é um processo rápido. Entre no Painel de Controle,
Programas e Recursos e selecione Ativar ou Desativar Recursos do
Windows. Para achar isto é preciso ir no Painel de Controle, o antigo,
que ainda existe no Windows 10 e que dá aquele ar de que o sistema
operacional está inacabado. Você deverá ver algo assim:

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*hR_M6mrkPuWtJFMp3xyMtw.png" class="graf-image" />
</figure>Ao clicar em Ativar… você verá algo assim:

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*Jgw7o_YRI4FcMScnxhkU1w.png" class="graf-image" />
</figure>Basta selecionar *Subsistema do Widows para Linux* e aguardar.
Certamente você terá de reiniciar seu computador.

Feito isto, você precisa entrar na Microsoft Store e procurar por Linux.
Você verá algo assim:

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*iqP3Nh4ATwaaEi1-gfqCLQ.png" class="graf-image" />
</figure>Escolha uma das distros e faça a instalação. Como eu gosto
muito do Debian, escolhi aquela distro. Mas isto não quer dizer que é a
distro que você deva escolher. Escolha a que é do seu gosto.
Infelizmente só há estas distros disponíveis no momento em que escrevo
este pequeno artigo.

Uma vez que você tenha instalado a distro, execute-a clicando no Menu
Iniciar. Pronto, o linux está rodando no seu Windows. Para que as coisas
fiquem perfeitas, ainda é preciso um passo.

Dentro do linux, edite o arquivo `/etc/wsl.conf` e coloque estas linhas
nele:

    [automount]
    enabled = true
    options = "metadata,umask=22,fmask=11"
    mountFsTab = true

    [network]
    generateHosts = true
    generateResolvConf = true

Salve, feche o linux e abra-o novamente. Estas configurações são para
que o sistema de arquivos do Windows, que é montado em `/mnt/c` ou
`/mnt/d` dependendo dos drives que você tenha, respeitem os atributos do
comando `chmod` .

Se quiser mais detalhes,
<a href="https://docs.microsoft.com/en-us/windows/wsl/wsl-config" class="markup--anchor markup--p-anchor">clique aqui</a>.

#### Passo 2: instale o GIT

Este é o passo mais simples de todos! Para instalar o GIT use o
gerenciador de pacotes da sua distro. No Debian, é tão simples quanto:

`sudo apt install git`

É de bom grado, no entanto, atualizar o registro do seu gerenciador de
pacotes antes de proceder à instalação.

#### Passo 3: instale o VSCode DENTRO do linux

Exatamente! Instale o VSCode dentro do linux que você acabou de instalar
e configurar. O processo é
<a href="https://code.visualstudio.com/docs/setup/linux" class="markup--anchor markup--p-anchor">descrito aqui</a>
e não vou ficar repetindo. Afinal, quem fez o software tem muito mais
competência para te explicar como instalar o VSCode no linux do que eu.

Porém, a coisa ainda não acabou. Existe um problema: o WSL não suporta
apps gráficos. 😱

Mas existe uma forma de resolver isso sem gambiarra.

#### Passo 4: instale um servidor XWindows

Toda aplicação gráfica para linux usa um servidor XWindows. Ao longo do
tempo as distros mudaram do X11 para o XOrg e por aí vai. O grande
barato do XWindows é que ele é naturalmente distribuído, ou seja, a
aplicação renderiza a janela onde o servidor roda.

Isto quer dizer que o servidor XWindows **não precisa estar** na mesma
máquina da aplicação. Esta é uma característica do XWindows: você pode
ter uma máquina na qual a aplicação executa e outra na qual ela
renderiza.

Procurei por servidores XWindows para Windows e achei o VcXsrv. Até aqui
tenho achado o software muito estável. A principal razão para a escolha
foi o fato do software ter commits recentes no repositório. Sim, o
software é de código aberto.Você baixa a
<a href="https://sourceforge.net/projects/vcxsrv/files/latest/download" class="markup--anchor markup--p-anchor">última versão daqui</a>.

Uma vez instalado, configure-o para usar janelas separadas e execute-o.
É possível salvar o arquivo de configuração para não ter de configurá-lo
todas as vezes. Porém, só isso não é suficiente. É preciso, ainda,
configurar seu linux para entender onde está o servidor X. E isso é
muito fácil. Acrescente esta linha ao seu `.bashrc`:

`export DISPLAY=:0`

Pronto. Agora é carregar o VSCode direto da linha de comando e vê-lo
renderizando no Windows como se fosse uma aplicação do Windows. Mas,
lembre-se: ele está rodando DENTRO do linux.

#### Edit 1: Compartilhe fontes do Windows com o WSL

Como é possível executar apps XWindows no WSL, é interessante instalar
novas fontes, principalmente se você decidir usar o Gimp ou quiser mudar
as *faces* do seu Emacs para usar a fonte Consolas. Uma saída é copiar
as fontes do Windows para dentro do WSL, mas isso duplica as coisas.
Porém, existe uma solução melhor: compartilhar as fontes do Windows,
deixando-as acessíveis pelos programas dentro do WSL.

Como fazer isso? Crie o arquivo `local.conf` dentro de `/etc/conf` com o
seguinte conteúdo:

    <?xml version="1.0"?>
    <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
    <fontconfig>
        <dir>/mnt/c/Windows/Fonts</dir>
    </fontconfig>

Coloque na tag `<dir>` o local de instalação das fontes no seu Windows.
O caminho que está no exemplo é o do meu PC e, via de regra, é onde o
Windows coloca as fontes mesmo.

Feito isto, reinicie o seu PC e *voilá!* Fontes do Windows dentro do
WSL!

#### Antes de ir

Eu esbarrei com um problema chato no VSCode: sempre que mandava navegar
para uma pasta, ele caía. O problema estava na configuração do time zone
do linux instalado. Foi necessário reconfigurar o time zone
adequadamente. No Debian/Ubuntu isto é feito assim:

`dpkg-reconfigure tzdata`

É de bom grado, também, você configurar o locale do seu linux. Por
padrão, ele vem com locale C. No Debian a forma mais simples é:

`dpkg-reconfigure locales`

Pronto, você está pronto para ir. Agora é instalar o `pyenv`, o seu
intérprete python, virtualenv ou qualquer que seja o gerenciador de
ambientes python que você usa. É uma boa ideia instalar, também, o bom e
velho GCC, a LibC, GLibC e o utilitário MAKE. Muita coisa precisa ser
compilada e esta é a melhor maneira de evitar sofrer.

Happy Coding!

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [March 12, 2019](https://medium.com/p/436abf1c3f5d).

<a href="https://medium.com/@ronaldolima/desenvolvendo-em-python-usando-wsl-436abf1c3f5d" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
