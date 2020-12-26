Multiplataforma?
================

Não é assim tão simples quanto parece…

------------------------------------------------------------------------

### Multiplataforma?

#### Não é assim tão simples quanto parece…

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*tbmZMu_fjFTI2JCmN46xXQ.jpeg" alt="Créditos: Torsten Dettlaff from Pexels" class="graf-image" /><figcaption>Créditos: <a href="https://www.pexels.com/@tdcat?utm_content=attributionCopyText&amp;utm_medium=referral&amp;utm_source=pexels" class="markup--anchor markup--figure-anchor">Torsten Dettlaff</a> from <a href="https://www.pexels.com/photo/bright-colorful-colourful-many-347735/?utm_content=attributionCopyText&amp;utm_medium=referral&amp;utm_source=pexels" class="markup--anchor markup--figure-anchor">Pexels</a></figcaption>
</figure>Um amigo estava procurando uma solução para automação que fosse
multi-plataforma. Na concepção dele, ele gostaria de escrever uma
ferramenta que funcionasse da mesma forma em todas as plataformas que
operam na empresa onde ele trabalha. E inspirado nisto, resolvi escrever
um pequeno artigo para falar um pouco sobre o conceito de
multi-plataforma e por que isso pode ser algo complexo para ser tratado
em termos de sistemas.

#### Camada de Compatibilidade

Para entender por que a coisa é complexa, vamos começar com um exemplo:
NodeJS. Você pode rodar seus scripts javascript no Windows, Linux ou
macOS. Porém, a coisa não é tão de graça assim. Para que seu código seja
basicamente o mesmo, sendo necessário, às vezes, alguns ajustes
exclusivos para uma ou outra plataforma, alguém precisa ser adaptado
para a plataforma onde o seu código está executando. 

Neste caso, o *runtime* inteiro é criado especificamente para a
plataforma na qual seu código vai executar. Claro, é possível que apenas
parte do *runtime* seja específico para a plataforma, principalmente se
houver uma camada de compatibilidade que funcione como interface entre o
*runtime* e o sistema operacional, em particular com os *system calls*. 

O que quero dizer é que o *runtime* para Windows não funciona no Linux e
assim por diante. Claro, são sistemas operacionais completamente
diferentes! As chamadas de sistema são completamente diferentes. No
Linux, você cria um processo novo com *exec* e no Windows com
*CreateProcess*. Tudo é diferente. Essa camada de compatibilidade é quem
gerencia as diferenças, criando uma interface que é independente de
plataforma. 

No entanto, acreditar que essa camada de compatibilidade exime o
programador de conhecer a plataforma é um engano comum. Existem algumas
características interessantes que precisam ser levadas em conta. 

  

[View original.](https://medium.com/p/bdb9c21f2e9b)

Exported from [Medium](https://medium.com) on December 25, 2020.
