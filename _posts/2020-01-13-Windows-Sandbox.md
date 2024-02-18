---
layout: post
title: Windows Sandbox
subtitle: "Um cenário de uso..."
image: "https://cdn-images-1.medium.com/max/800/1*UfKcOP8gggYARcymQ5lOGg.jpeg"
author: ronaldo
categories: [Dicas, Windows]
---

Quando soube do Windows Sandbox vi algumas possibilidades mas nenhum uso prático
que pudesse me fazer usá-lo. Como todo cliente de banco brasileiro, sempre me vi
obrigado a instalar aqueles softwares indesejáveis de segurança que atrapalham
completamente a vida da gente. Essas porcarias travam a máquina, consomem um
mundo de CPU e fazem o PC ficar incrivelmente lento, sendo úteis apenas quando
você acessa o site do banco. E foi aí que tive a ideia de usar o Sandbox para
este cenário: evitar da porcaria do Warsaw, o software de segurança normalmente
usados pelos bancos, no meu computador.

A ideia é instalar o Warsaw dentro do Sandbox, usar o banco e fechar o sandbox,
sem deixar essa porcaria de Warsaw instalado. Mas há algumas pegadinhas.

## O que é o Sandbox?

A ideia do Windows Sandbox é executar uma versão do Windows dentro de um
ambiente isolado. O que quer que seja que aconteça dentro do Sandbox, fica
dentro do Sandbox. Assim, se você contrair um vírus dentro do Sandbox, ele fica
preso ali dentro.

A principal característica do sandbox é ser necessário reinstalar tudo sempre
que você o inicia:qualquer coisa que você coloca dentro dele é perdida tão logo
ele seja desligado. Ele apaga tudo. Não há nenhuma persistência. E é aqui que
mora a mágica do negócio: ele sempre inicia do zero, como se fosse uma
instalação novinha do Windows.

## Como instalar?

Você precisa ter o Windows 10 Professional ou Enterprise para usar o Windows
Sandbox. Para instalar, entre no Painel de Controle, vá em Programas e Recursos
e, por fim, em Ativar ou Desativar Recursos do Windows:

![Instalação da Área Restrita do Windows](https://cdn-images-1.medium.com/max/600/1*TS7eszRHNQjjj3QIGB79pQ.png")

Em português, ele é a Área Restrita do Windows. Verifique se as extensões de
virtualização estão ativas na BIOS da sua máquina.

Depois que selecionar, clique em OK e espere o processo finalizar. Sua máquina
será reiniciada.

Depois de instalado, o ícone no menu iniciar é Windows Sandbox. Ao executá-lo,
ele pede elevação de autoridade e depois executa sem maiores problemas.

Ele é suficientemente rápido para criar a dúvida de que é uma VM totalmente
separada do sistema em execução. Porém, como fazer para instalar o diabo do
Warsaw nesse negócio para usar os bancos?

Você pode usar dois métodos: o método que causa dor e o método indolor. No
método que causa dor, você simplesmente tenta entrar e faz todo o processo na
unha. No método indolor, você usa um arquivo *wsb* de configuração.

## Configurando

O arquivo com extensão *wsb* é basicamente um XML. Aqui está o que eu
uso:

```xml
<!-- -*-xml-*- -->
<Configuration>
  <MappedFolders>
    <MappedFolder>
      <HostFolder>D:\wsb</HostFolder>
      <ReadOnly>true</ReadOnly>
    </MappedFolder>
    <MappedFolder>
      <HostFolder>D:\tmp\downloads</HostFolder>
      <ReadOnly>false</ReadOnly>
    </MappedFolder>
  </MappedFolders>
  <LogonCommand>
    <Command>c:\users\WDAGUtilityAccount\Desktop\wsb\warsaw-bb.exe</Command>
  </LogonCommand>
</Configuration>
```

- MappedFolders: Permite que você crie o mapeamento de pastas do seu computador
    dentro do Sandbox.
- LogonCommand: É o comando que você vai executar quando acabar de ligar a VM.
- `C:\users\WDAGUtilityAccount`: É a conta interna do Sandbox. Os folders mapeados aparecem no
    Desktop.

O truque aqui é simples: baixei o instalador do Warsaw numa pasta qualquer do
meu PC, fiz o mapeamento para esta pasta e coloquei-o como comando de logon no
Sandbox. Dá para ir além automatizando todo o processo com PowerShell.

Dá para você instalar, também, um outro navegador. Mas é preciso automatizar o
processo todo por que é um saco o aperta-aperta de botão só para preparar o
Sandbox para uso.

Se você quiser saber mais sobre o XML, [clique
aqui](https://techcommunity.microsoft.com/t5/windows-kernel-internals/windows-sandbox-config-files/ba-p/354902).
O formato do arquivo é suficientemente simples.

## Conclusão

Se você chegou até aqui o seu Sandbox está funcionando e agora você não
precisa mais da bosta do Warsaw enchendo o seu saco durante o dia. Se
você costuma baixar coisas do banco, como arquivos OFX para alimentar
softwares de controle financeiro, basta mapear uma pasta com direito de
escrita.

Você pode, na verdade, criar quantos arquivos de configuração quiser,
cada um para uma finalidade.

Espero que as dicas sejam úteis!
