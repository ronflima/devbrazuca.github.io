---
layout: post
title: "Restaurando um PC Dell"
subtitle: "Support Assist nem sempre resolve"
image: "https://images.pexels.com/photos/811587/pexels-photo-811587.jpeg"
author: ronaldo
categories: [Tutoriais]
---

A Dell provê uma solução out-of-the-box para solucionar problemas de instalação do Windows: o Support Assist. Na grande maioria dos
casos, ele resolve muito bem a questão. Mas há aqueles momentos nos quais a coisa pega. E comigo foi assim: a recuperação do sistema
operacional estava me entregando um Windows instável, com o Windows Update quebrado.

O efeito foi basicamente este: O Windows update não baixava as atualizações e quando era necessário desligar ou reiniciar a máquina,
ele entrava em modo de atualização por horas.

Antes de prosseguir, alguns detalhes:

- Eu costumo zerar minha máquina, ou seja, formatá-la limpando completamente o HD. Todos os meus dados estão na
  nuvem. Não perco nada e deixo a máquina sempre como se estivesse nova.
- Isso daqui serve para o Windows 11 x86 64bits. 
- Eu gosto da instalação offline, pois odeio aquele negócio de ligar uma conta Microsoft on-line ao Windows. No entanto, dá para
  ligar a conta Microsoft posteriormente.

Depois de várias tentativas frustradas de reinstalação, consegui uma instalação estável do Windows 11 e compilei uma pequena lista
de procedimentos que podem ajudar. Vamos à ela:

Ao realizar a restauração do seu sistema, certifique-se que sua máquina está desconectada da internet quando ela for reiniciada. Não
permita que o Windows conecte-se e mantenha-o completamente off-line. Não deixe que o sistema operacional instale atualizações.
   
Ao terminar de reiniciar, ao chegar à tela de boas-vindas, use SHIFT-F10. Abrirá um prompt de comando. Digite:

```shell
oobe\bypassnro
```

Sua máquina vai reiniciar. Este comando faz com que o Windows desabilite o _Out-of-the-box Experience_. Assim, ele não vai te
obrigar a ligar uma conta on-line da Microsoft. Apesar de não estar amplamente documentado, este comando não é um _hack_ e deve ser
usado quando você não tem acesso à internet para realizar uma instalação do Windows. Convenhamos: se fosse um _hack_ não estaria
disponível na instalação do sistema operacional, não é mesmo?

Novamente, evite que o Windows conecte-se. Utilize a opção "Fazer instalação Offline" e siga em frente. 

Antes que a aplicação de restauração inicie a busca por atualizações do Windows, pause completamente o Windows Update. Entre no site
da Dell, faça download de todos os drivers que sua máquina precisa e instale-os um a um. Isso demora um pouco, mas vale a pena. 

Lembre-se de reiniciar o PC a cada instalação de driver. Outra dica é criar um ponto de restauração após cada
instalação. Normalmente o Windows já faz isso automaticamente, mas vale a pena conferir se ele está realmente fazendo isso. Caso a
instalação de algum driver falhe, basta voltar o ponto de restauração e já era.

Depois que os drivers estiverem todos instalados, vá nas configurações e permita que o Windows instale as atualizações. 

Após o término das atualizações, o que pode demorar algumas horas de trabalho, comece a reinstalar o software que você usa no
dia-a-dia. Isso garante que a sua instalação do Windows estará estável.

## Cerejinha do Bolo

Bom, reinstalar software é uma tarefa enfadonha. E por isso eu criei um script PowerShell simples, feio mas muito eficaz:

```powershell
#
# (C) 2025 - Ronaldo Faria Lima - All rights reserved
# Installer for my common apps in Windows
#

$appList = @(
    @{id='Google.Chrome'; title='Google Chrome'},
    @{id='Docker.DockerDesktop'; title='Docker Desktop'},
    @{id='GnuPG.Gpg4win'; title='GNU PG'},
    @{id='Google.GoogleDrive'; title='Google Drive'},
    @{id='Git.Git'; title='Git'},
    @{id='Valve.Steam'; title='Steam'},
    @{id='Microsoft.PowerShell'; title='Powershell'},
    @{id='EpicGames.EpicGamesLauncher'; title='Epic Games Launcher'},
    @{id='Wacom.WacomTabletDriver'; title='Wacom One Tablet Driver'},
    @{id='9P1TBXR6QDCX'; title='HyperX Keyboard Drivers'},
    @{id='GIMP.GIMP'; title='GIMP'},
    @{id='BlenderFoundation.Blender'; title='Blender'},
    @{id='9NKSQGP7F2NH'; title='WhatsApp'},
    @{id='OpenWhisperSystems.Signal'; title='Signal'},
    @{id='XPFFZHVGQWWLHB'; title='One Note'},
    @{id='Musescore.Musescore'; title='MuseScore'},
    @{id='Adobe.Acrobat.Reader.64-bit'; title='Acrobat Reader'},
    @{id='Microsoft.Teams'; title='Microsoft Teams'}
)

foreach($app in $appList) {
    Write-Host "Installing $($app.title)"
    winget install --id $app.id
}
```

Essa coisinha instala tudo o que eu efetivamente uso numa sentada. Ele utiliza o gerenciador de linha de comando `WinGet` que já vem
incluso no seu Windows. Porém, note que este pequeno script instala o que EU uso. Para saber os IDs dos programas que você precisa,
dê uma lidinha no manual do `WinGet`, em particular o comando `search`.

Espero que as dicas ajudem caso você tropece no mesmo problema que eu tropecei.
