---
layout: post
title: Uma palavrinha sobre tratamento de erros
subtitle: Algo altamente negligenciado nos projetos
image: "https://images.pexels.com/photos/417070/pexels-photo-417070.jpeg"
author: ronaldo
categories: [Desenvolvimento, Programação]
---

Outro dia alguém publicou algo no Linkedin sobre tratamento de erros, falando especificamente sobre exceções. E isso me inspirou a escrever um pouco sobre tratamento de erros, algo que sempre vejo sendo negligenciado. E antes de seguir adiante, vamos a alguns conceitos importantes.

## Invariantes

Uma invariante é uma condição que você assume sendo verdadeira para o bom funcionamento do seu software. Este termo é usado no excelente livro de David Butenhof, [Programming With POSIX threads](https://www.amazon.com.br/gp/search?ie=UTF8&tag=devbrazuca-20&linkCode=ur2&linkId=9e41d1b5a069300b9911a21a0ff3023c&camp=1789&creative=9325&index=books&keywords=Programming%20with%20POSIX%20threads), quando o mesmo explica sobre seções críticas. Em termos geral, o conceito é basicamente o mesmo.

Um erro normalmente ocorre quando uma invariante torna-se falsa. Por exemplo, quando a memória do sistema exaure-se, torna-se falsa a premissa de que há memória para o seu sistema operar. E isso provoca um erro.

Como pode ser visto, trata-se de um conceito muito simples e que explica de forma bem clara o que é um erro dentro de um sistema computacional.

## Tipos de erros

Você pode qualificar os erros que podem acontecer no seu sistema, variando de erros causados por falhas sistêmicas, limitações de ambiente ou, até mesmo, não observância de regras de negócio. Ao qualificar os erros que podem acontecer no seu sistema você consegue ter uma visão clara do que fazer com eles: o sistema tenta recuperar-se? O sistema aborta a execução completamente? Aviso o usuário e pede-se para tentar a operação novamente?

Tudo depende do contexto no qual a sua invariante tornou-se falsa e a gravidade que este evento pode causar no seu sistema. Por exemplo, a falta de memória impede completamente o seu sistema de operar corretamente. Assim, não há como continuar. Isso demonstra que a qualificação dos erros precisa levar em conta o efeito que isso pode causar no processamento do seu sistema.

Normalmente, os erros são qualificados assim:

- advertência: causa algum tipo de degeneração no processamento dos dados, sem causar estragos ao resultado final.
- erro operacional: a operação não pode continuar pois invariantes importantes tornaram-se falsas e, com isso, não há como prosseguir para a determinação do resultado do processamento.
- erro fatal: a operação não pode continuar e precisa ser suspensa imediatamente pois algo muito grave aconteceu de forma que nada mais pode ser realizado.

Esta pequena lista não tem a intenção de ser uma tábua da verdade e muito menos uma regra de ouro para seguir. Trata-se, apenas, de um exemplo de como qualificar erros, com base em práticas de mercado.

## Como tratar os erros

Toda linguagem de programação moderna apresenta uma ou outra forma de tratar erros: seja com o lançamento de exceções, seja com o retorno de flags de processamento, não importa. O importante aqui é que é preciso criar uma convenção no seu projeto para que os erros sejam corretamente tratados, registrados e auditados. Normalmente, seguir a prática da comunidade que cresce no entorno da sua linguagem ou plataforma de desenvolvimento é sempre uma boa ideia. Porém, você precisa tornar isso uma convenção a ser seguida pelo seu time de desenvolvimento. Se o tratamento de erros for negligenciado, você terá os seguintes efeitos negativos:

- cada pedaço do seu software informará erros de uma maneira diferente, criando inconsistências de comportamento;
- ao tratar erros de forma diferente, a manutenção torna-se mais complexa;
- a adição de membros novos à equipe de desenvolvimento torna-se um pesadelo, pois cada pedaço software trata erros de uma maneira diferente;
- a auditoria dos erros aumenta consideravelmente em complexidade. A configuração e operação de sistemas de monitoramento torna-se uma tarefa árdua.

Tratar erros não é apenas colocar um try/catch ou testar por retorno de funções. Trata-se de algo bem mais abrangente, que pode indicar, inclusive, falhas na escrita do software, ou seja, a presença de bugs. Por este motivo, o tratamento dos erros precisa ser algo padronizado e realizado de forma racional no seu sistema. Caso contrário, auditar erros pode se tornar um pesadelo.

É importante, também, evitar que o registro de erros contenha informações privadas ou sensíveis. Não é incomum ataques que originam-se à partir da leitura de logs por estes conterem informações sensíveis. Vários vazamentos de dados ocorreram pela exposição dos logs de operação ou de erro de software justamente porque continham este tipo de informação.

O seu tratamento de erros deve prever, inclusive, rastreabilidade: onde, no código, isso aconteceu. Uma forma fácil, e também interessante de evitar nomes de arquivos e números de linhas é codificando as mensagens de erro de forma que uma busca rápida consiga identificar onde o seu código quebrou.

## Uma palavra sobre as exceções

Algumas linguagens de programação modernas optaram pelo tratamento de erros através do uso de um mecanismo chamado "lançamento de exceções". É importante, no entanto, entender como isso funciona e quais as consequências desse modelo, algo que muitos programadores desconhecem a ponto de condenar este mecanismo.

As exceções são erros. Simples assim. Fica a critério do programador determinar se são erros fatais ou se são recuperáveis.

O lançamento de uma exceção causa uma pesquisa, no frame atual, por uma cláusula try/catch, ou similar, que satisfaça o tratamento da exceção. Caso a pesquisa seja bem-sucedida, o tratamento da exceção é levado em conta. Em caso negativo, a pilha é retrocedida ao frame superior e a busca continua. Este processo ocorre até que não existam mais frames para retroceder, ou seja, o frame superior é atingido. Caso o frame superior seja atingido, sem que a pesquisa seja satisfeita, o tratamento de erros padrão da linguagem é executado. Usualmente o tratamento de erros padrão é ecoar na tela a pilha que existia quando a exceção foi inicialmente lançada e abortar o processamento. Alguns runtimes ainda ecoam o estado de todas as threads, em runtimes que suportam multi-threading.

As consequências deste mecanismo são interessantes. Sem um tratamento adequado de exceções, o programa pode ser abortado completamente. Este comportamento pode indicar um bug no tratamento de erros quando o problema, em si, é considerado recuperável. Como efeito colateral da retrocessão da pilha, pode haver vazamento de recursos. Não é incomum vazamento de memória ou descritores de arquivos continuarem válidos após a ocorrência de uma exceção.

O efeito colateral que pode ser causado pelo retrocesso da pilha durante o tratamento de exceções não é uma justificativa plausível para não usar o mecanismo para tratamento de erros. Em verdade, a ideia por detrás é permitir a implementação de um fluxo de erros desacoplado do fluxo principal de processamento, algo que não é evidente na sintaxe das linguages que usam exceções para o tratamento de erros.

Algumas linguagens, como C++, exigem bastante atenção no tratamento de erros feito por exceções justamente pela possibilidade de vazamento de recursos. Por este motivo, é importante realizar o tratamento de erros de maneira racional e consciente.

## Conclusão

Tratar erros é, em última palavra, uma questão de design do fluxo alternativo de exceção do seu código. Para deixar clara a terminologia, fluxo de exceção é o que é feito quando um erro ocorre e nada tem a ver com lançamento de exceções: é o que o seu programa faz quando uma invariante é torna-se falsa.

Isto posto, é importante entender como sua linguagem de programação trata fluxos de exceção e, mais importante, desenhar de maneira adequada e, de preferência, padronizada, como realizar o tratamento dos erros encontrados durante o processamento, criando fluxos de exceção consistentes e auditáveis.
