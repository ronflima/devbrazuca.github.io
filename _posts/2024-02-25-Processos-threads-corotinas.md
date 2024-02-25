---
layout: post
title: Processos, Threads e Co-rotinas
subtitle: Como essa coisa toda funciona?
image: "https://images.pexels.com/photos/3091200/pexels-photo-3091200.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
author: ronaldo
categories: [Sistemas Operacionais, Programação, Desenvolvimento]
---

Com a popularização de linguagens de alto nível, cada vez menos programadores tem conhecimento sobre como funcionam os sistemas operacionais modernos. Ao ficar distantes do sistema operacional, vários conceitos tornam-se desconhecidos, ou até mesmo superficialmente conhecidos, o que leva os programadores a criarem código ineficiente ou com premissas incorretas.

Neste artigo, abordo três princípios importantes, sendo dois deles referindo-se diretamente a entidades do sistema operacional: Processos, Threads e Co-rotinas, nesta ordem. E há um motivo para esta ordem.

## Processos

Vamos começar pelo topo da montanha: os processos. Um processo é uma entidade do kernel do sistema operacional que representa, em última instância, um programa em execução. Este programa pode ser qualquer coisa: um programa iniciado pelo usuário, um serviço do sistema operacional, um _daemon_, um servidor, não importa. O processo usa recursos: memória, arquivos em disco, conexões de rede, entidades de comunicação inter-processos (filas, memória compartilhada, semáforos). O processo, também, é univocamente identificado dentro do sistema operacional, através de uma fila circular. Esta identificação é o PID (de _Process Identification_).

O sistema operacional é quem cria e gerencia o seu processo. Sempre que seu processo necessita de um recurso, ele realiza uma _chamada de sistema_, ou seja, conversa com o sistema operacional para abrir um arquivo, seja para criar ou ler, para conectar pela rede, para solicitar mais memória, para acessar a sua placa de vídeo, etc. A chamada de sistema é algo importantíssimo no ciclo de vida do seu programa pois ele interrompe, momentaneamente, a sua execução para aguardar o retorno do sistema operacional.

Como pode ser observado, há uma relação próxima entre o sistema operacional e o processo. Porém, o processo não está sozinho dentro do computador: ele executa paralelamente a outros processos. E aqui há algo muito interessante: o processamento pode ser totalmente paralelo ou concorrente, dependendo de como estão os recursos da máquina. E existe uma grande diferença entre o _paralelo_ e o _concorrente_.

### Paralelismo e Concorrência

O que é paralelo não é, necessariamente concorrente. E o que é concorrente não é, necessariamente, paralelo. Estes são dois conceitos simples, mas normalmente mal-interpretados e que valem uma revisão.

Nos computadores modernos, o paralelismo é alcançado pela existência de vários processadores ou, numa terminologia mais adequada, vários núcleos. Quanto mais núcleos o seu processador tem, ou quanto mais processadores sua máquina tem, maior a capacidade de executar instruções em paralelo, ou seja, ao mesmo tempo. No entanto, a quantidade de processos em um sistema operacional moderno normalmente é muito superior à quantidade de núcleos disponíveis e é aí que entra a concorrência.

A concorrência é uma forma de gerenciar recursos compartilhados. Em um cenário no qual a quantidade de processos é muito maior do que a quantidade de núcleos disponíveis o sistema operacional passa a gerenciar os processos dando-lhes um certo tempo de processamento. Assim, um determinado processo usas o processador por um tempo e é suspenso depois de decorrido este tempo, usuamente denominado como _quantum_ de tempo. Depois de suspenso, outro processo tem a oportunidade de usar o processador e isso é feito repetitidamente. Este fenômeno ocorre não somente com o processador, mas com todos os componentes de um computador que precisam ser usados por vários processos.

Trocando em miúdos, isto quer dizer que haverá, em determinado momento, apenas uma quantidade limitada de processos em execução, enquanto todos os outros aguardam por uma oportunidade de executar suas instruções. A título de exemplo, um processador com 12 núcleos é capaz de executar até 12 processos ao mesmo tempo, em teoria. Todos os outros processos permanecem aguardando para executar. E quem manda no espetáculo é o sistema operacional, pois é ele quem inicia ou suspende os processos.

A concorrência, assim implementada pelo sistema operacional, afeta diretamente processos e threads, pois estas são entidades do kernel. O processo não sabe quando será interrompido. A interrupção é feita com base na prioridade do processo, prioridade esta que influencia o _quantum_ de tempo que é oferecido ao processo para sua execução.

Isto posto, paralelismo é quando as coisas acontecem ao mesmo tempo e concorrência é quando somente uma coisa é executada enquanto as outras coisas aguardam sua oportunidade para executar.

### IPC: A comunicação inter-processos

Aqui está algo importante a discutir pois a intercomunicação inter-processos, ou IPC (do inglês _Inter-process Communication_), tem um papel muito importante em um sistema operacional, principalmente no que diz respeito à comunicação do próprio sistema com o processo.

Normalmente, os mecanismos disponíveis para a IPC são:

- sinalização
- memória compartilhada
- sockets
- pipes
- filas de mensagens
- semáforos

Não vou dissertar sobre todos. Um bom livro, que disserta em profundidade sobre o assunto é o excelente [Unix Network Programming](https://www.amazon.com.br/UNIX-Network-Programming-Interprocess-Communications/dp/0132974290/ref=sr_1_9?__mk_pt_BR=%25C3%2585M%25C3%2585%25C5%25BD%25C3%2595%25C3%2591&amp;crid=28UPCG8HKBD3T&amp;dib=eyJ2IjoiMSJ9.Dd2fpLgj4gSBEZwsONKpdqpo8k774LmgeAz9mSVXhKEgsRG6iUp3KQJGGXCWgDGGYa5PJC3Ql47FPBtIaheedHtRmNyynLWHDAUytI9c-ae9Q-9gWEWyd8ynqy-s74vQbUpq0Y8UNzsGt6WGrF3DuuPXiKBmJzo8Vbhs3N2rNnzPCYxa0_g6Cg5u29l6Z3Gwr2yXp3FEU1Tdtwr6aip2ZRBSofLG3ZObWI3Kd982V8k.xIHeIEr3Td16x1aj-mn9X-P9IIvsvq1JSSlv-h0Xa9c&amp;dib_tag=se&amp;keywords=Unix+programming+Richard+Stevens&amp;qid=1708873757&amp;sprefix=unix+programming+richard+steven%252Caps%252C238&amp;sr=8-9&_encoding=UTF8&tag=devbrazuca-20&linkCode=ur2&linkId=93724259c1af7de33fda14923ba239b4&camp=1789&creative=9325) do fantástico Richard Stevens. Apesar de ser um livro focado em IPC para Unix, os princípios descritos são válidos para Linux e Windows. Linux, por ser um sistema operacional POSIX, faz uso das mesmas chamadas de sistema. No Windows, as chamadas de sistemas são diferentes e os mecanismos ligeiramente distintos, mas os conceitos são os mesmos.

O mecanismo de interesse para a nossa discussão é a sinalização. Além de causar a interrupção do seu processo, normalmente para executar outro processo na fila de execução, o sistema operacional também pode se comunicar com o seu processo através de sinais. Por exemplo, quando o sistema operacional está para desligar, ele sinaliza todos os processos em execução para que finalizem o mais rápido possível. Normalmente, o sinal é SIGTERM. Caso os processos não finalizem em tempo hábil, o sistema envia o sinal SIGKILL no intuito de que o processo seja finalizado imediatamente. Caso o processo cause um acesso ilegal à memória, o sistema operacional envia um sinal SIGSEGV.

Alguns sinais podem ser capturados e tratados, outros não. SIGKILL é um sinal que não pode ser capturado, nem tratado, e que provoca o término imediato do processo, não lhe dando chance de sincronizar processos filhos, salvar arquivos abertos, liberar recursos, etc.

### O Processo Filho

Os processos obedecem uma hierarquia dentro do sistema operacional. O processo primordial, normalmente denominado como _init_ ou _systemd_, é o pai de todos os processos do sistema operacional. Sempre que você executa algo no seu sistema operacional, esse "algo" torna-se um processo filho do shell que você está usando. No Windows, este shell é o _Windows Explorer_, que é o shell do usuário. Importante afirmar que sempre é possível substituir o shell padrão por outro, mesmo no Windows.

Como afirmei antes, todo processo tem uma identificação unívoca no sistema, o PID. E também tem uma identificação interessante, o PPID, de _Parent Process IDentification_, ou identificação de processo pai. Esta estrutura é uma árvore na qual todo processo tem o seu PID e o número do PID do processo superior, isto é, o PPID. E sempre que um processo executa um processo filho, ele tem em mãos o PID do processo filho. Por exemplo:

```C
int child_pid = fork();

if (child_pid == 0) {
    /* Este é o processo filho */
} else {
    /* Este é o processo pai */
}
```

Neste exemplo, escrito em C, é usada a chamada de sistema `fork` que cria um processo filho. O processo filho nada mais é que uma cópia identica do processo pai e que herda tudo do processo pai: descritores de arquivos, descritores de memória compartilhada, sockets, etc. No entanto, ele não compartilha a memória do processo pai e é executado em um ambiente separado. Para comunicar-se com o processo pai é necessário usar algum dos mecanismos de IPC para este fim.

Sempre que um processo filho chega ao fim, ele envia ao processo pai o sinal SIGCLD, juntamente com um valor inteiro que identifica qual é o status de finalização de execução. Por convenção, o valor zero indica sucesso e valores diferentes de zero, normalmente negativos, indicam algum tipo de erro. O processo pai pode escolher capturar e tratar este sinal ou simplesmente ignorar.

É uma boa prática capturar e tratar este sinal para indicar ao kernel que o processo filho foi sincronizado com o processo pai. O efeito colateral de não tratar o sinal pode causar o surgimento de processos zumbis, ou seja, processos que não usam nenhum recurso mas prendem, para si, um PID. O PID é uma fila circular e se essa fila for exaurida, o sistema operacional simplesmente não consegue criar mais processos.

Normalmente quando o processo pai finaliza antes do filho, o processo filho é adotado pelo processo de inicialização do sistema que, por sua vez, sincroniza o status de finalização no intuito de evitar o surgimento de zumbis. Inclusive, esta é uma técnica útil para criar _daemons_, pois quando o processo pai finaliza antes do filho, o processo filho passa a independer do TTY ao qual foi originalmente associado e, com isso, o fechamento do terminal não afetará sua execução. Aqui está um truque simples e útil para criar daemons na linha de comando no Linux e Unix:

```bash
{ seuprograma & } &
```

Isso executará `seuprograma` em segundo plano dentro de um processo em segundo plano. O processo que chama o seu programa criará um processo filho e este processo filho, por sua vez, criará outro processo filho que executará seu programa. Quando o processo filho inicial retorna, ele não sincroniza com o processo filho que, por sua vez, é adotado pelo sistema de inicialização do sistema operacional.

## As Threads

Como eu disse, as threads são entidades do kernel do sistema operacional. E, como toda entidade do kernel, necessitam de uma chamada de sistema para que sejam criadas e gerenciadas. Cada sistema operacional tem o seu conjunto de chamadas de sistema para este fim. No intuito de criar uma camada padronizada, surgiram as POSIX Threads, que nada mais são que uma abstração por cima das chamadas de sistema para a criação e gerenciamento de threads. No Windows, há um conjunto de chamadas próprias e bibliotecas próprias para este fim. As "Windows Threads" são muito similares às POSIX Threads, mas são iniciadas e gerenciadas por funções próprias do SDK. Há, no entanto, bibliotecas POSIX para Windows que seguem as interfaces das POSIX Threads.

As threads não existem sem um processo. Elas são, na verdade, parte do processo. Conceitualmente, um processo inicia-se com uma única thread, a thread principal ou, como descrito na literatura, a _main thread_. Tudo dentro de uma thread é serial, ou seja, é executado em sequência. Ao criar uma nova thread, esta nova thread passa a ter acesso a tudo do processo, compartilhando com outras threads todos os recursos que o processo usa. Isso é bom e ruim ao mesmo tempo. É bom porque não exige o uso de IPC para comunicação entre threads. É ruim porque faz com que você precise ter cuidado para que as estruturas de dados usadas pelo processo não sejam intempestivamente quebradas por acesso paralelo, o principal efeito colateral que cria bugs bem difíceis de encontrar e depurar.

As threads podem ser interrompidas pelo sistema operacional a qualquer momento, seja porque ela perdeu o seu time sharing, seja porque o processo inteiro perdeu o time sharing, ou seja por que tornou-se, programaticamente, inativa por aguardar em algum _mutex_.

O _mutex_ funciona como um semáforo. Porém, ele é uma entidade que garante o travamento atômico, permitindo que apenas uma thread consiga travá-lo em determinado momento. É um mecanismo que permite sincronizar as threads quando o acesso a um recurso compartilhado é necessário.

O seu processo pode ter quantas threads quiser. Claro, há uma limitação imposta pelo seu sistema operacional que precisa ser respeitada. Normalmente a documentação do seu sistema operacional traz estes limites, que também podem ser impostos pelo administrador do sistema através de limitações do shell de usuário, no intuito de limitar recursos compartilhados utilizados.

## As Co-rotinas

As Co-rotinas executam _dentro de uma thread_. Normalmente é uma forma de dividir o processamento em espaço de usuário, sem a intervenção do kernel. A co-rotina divide, portanto, o tempo de processamento de uma thread, alternando a execução entre cada co-rotina dentro da thread através de um processo chamado _mudança de contexto_. Esta mudança de contexto salva a pilha da co-rotina atual, restaura a pilha da co-rotina que estava aguardando na fila de execução, e resume a execução desta co-rotina que estava aguardando.

A principal vantagem da co-rotina, também chamada de _lightweight thread_ ou _thread em user space_, é que não há a necessidade de sincronizar co-rotinas pois é garantido que apenas uma co-rotina execute por vez, havendo concorrência mas não paralelismo. No caso das threads, ocorre paralelimos _e_ concorrência.

Como já pode ser visto, a co-rotina exige programação colaborativa para que todas possam ter a oportunidade de executar. A co-rotina, também, exige a existência de um agendador, ou _scheduler_, que gerencia como as co-rotinas irão executar. Via de regra, os _schedulers_ são executados em uma thread em separado.

No caso das co-rotinas, você pode criar quantas couberem na memória do seu computador. Afinal, elas são entidades do seu processo e não do sistema operacional. A mudança de contexto nas co-rotinas, se comparadas com as mudanças de contexto de threads, são muito mais rápidas pois elas são gerenciadas pelo seu processo. Normalmente as mudanças de contexto das entidades de kernel são mais lentas pois exigem trabalho do kernel ao gerenciar os processos e, consequentemente, as threads dentro dos processos.

## Para onde ir daqui

A explicação sobre o funcionamento dos processo é mais demorada porque trata-se de um ponto primordial na arquitetura dos sistemas operacionais modernos. Sem entender como funciona um processo não há como compreender as threads e, muito menos, as co-rotinas. Há outras formas de threading, como as _Windows Fibers_, que são quase co-rotinas. Para finalizar, deixo uma pequena lista de leitura com alguns livros interessantes para ajudar na compreensão destes princípios:

- [Unix Network Programming - Richard Stevens](https://www.amazon.com.br/UNIX-Network-Programming-Interprocess-Communications/dp/0132974290/ref=sr_1_9?__mk_pt_BR=%25C3%2585M%25C3%2585%25C5%25BD%25C3%2595%25C3%2591&amp;crid=28UPCG8HKBD3T&amp;dib=eyJ2IjoiMSJ9.Dd2fpLgj4gSBEZwsONKpdqpo8k774LmgeAz9mSVXhKEgsRG6iUp3KQJGGXCWgDGGYa5PJC3Ql47FPBtIaheedHtRmNyynLWHDAUytI9c-ae9Q-9gWEWyd8ynqy-s74vQbUpq0Y8UNzsGt6WGrF3DuuPXiKBmJzo8Vbhs3N2rNnzPCYxa0_g6Cg5u29l6Z3Gwr2yXp3FEU1Tdtwr6aip2ZRBSofLG3ZObWI3Kd982V8k.xIHeIEr3Td16x1aj-mn9X-P9IIvsvq1JSSlv-h0Xa9c&amp;dib_tag=se&amp;keywords=Unix+programming+Richard+Stevens&amp;qid=1708873757&amp;sprefix=unix+programming+richard+steven%252Caps%252C238&amp;sr=8-9&_encoding=UTF8&tag=devbrazuca-20&linkCode=ur2&linkId=93724259c1af7de33fda14923ba239b4&camp=1789&creative=9325)
- [Sistemas Operacionais Modernos - Andrew Tanembaum](https://www.amazon.com.br/UNIX-Network-Programming-Interprocess-Communications/dp/0132974290/ref=sr_1_9?__mk_pt_BR=%25C3%2585M%25C3%2585%25C5%25BD%25C3%2595%25C3%2591&amp;crid=28UPCG8HKBD3T&amp;dib=eyJ2IjoiMSJ9.Dd2fpLgj4gSBEZwsONKpdqpo8k774LmgeAz9mSVXhKEgsRG6iUp3KQJGGXCWgDGGYa5PJC3Ql47FPBtIaheedHtRmNyynLWHDAUytI9c-ae9Q-9gWEWyd8ynqy-s74vQbUpq0Y8UNzsGt6WGrF3DuuPXiKBmJzo8Vbhs3N2rNnzPCYxa0_g6Cg5u29l6Z3Gwr2yXp3FEU1Tdtwr6aip2ZRBSofLG3ZObWI3Kd982V8k.xIHeIEr3Td16x1aj-mn9X-P9IIvsvq1JSSlv-h0Xa9c&amp;dib_tag=se&amp;keywords=Unix+programming+Richard+Stevens&amp;qid=1708873757&amp;sprefix=unix+programming+richard+steven%252Caps%252C238&amp;sr=8-9&_encoding=UTF8&tag=devbrazuca-20&linkCode=ur2&linkId=93724259c1af7de33fda14923ba239b4&camp=1789&creative=9325)
- [Programming With POSIX Threads - David Butenhof](https://www.amazon.com.br/Programming-Threads-Addison-Wesley-Professional-Computing-ebook/dp/B006QTHCJ6/ref=sr_1_1?__mk_pt_BR=%25C3%2585M%25C3%2585%25C5%25BD%25C3%2595%25C3%2591&amp;crid=1P7SW87PLFW97&amp;dib=eyJ2IjoiMSJ9.UTh1jo46GrHfaaNbypJkAVS1v4yot1XYGrJJDCsgbTStqbtHw51Zll9An4JNgu5EoAI1Rd59zYilXPt5-LQnfa_18WkGTM3VPzcbbQp8iKpu-iDjO0goMu3LDdjlX5ve304ZSQ3vJdFDdpsySB9tF9oITV77p-WksEn5hFm4CHETSUm_YKRttUHTWxxkWDmvOL_C55Z4gT9ohLaMRaYfoER6QPhCr0NnG1yH6m7uUhjaMw2w_pU7bbuc7G_FFmC2yzIPZnlk-0AJKPGzNNZTa3s0cxl22L2J30Rj69GmeoM.2rt5ODtxrA7TRlvMorGlc7fCMBxVLxtIdur2nB7sy_g&amp;dib_tag=se&amp;keywords=Threads+posix&amp;qid=1708876880&amp;sprefix=threads+posix%252Caps%252C227&amp;sr=8-1&_encoding=UTF8&tag=devbrazuca-20&linkCode=ur2&linkId=8c95d0c33cffb8119f665e5e4b7de19f&camp=1789&creative=9325)
