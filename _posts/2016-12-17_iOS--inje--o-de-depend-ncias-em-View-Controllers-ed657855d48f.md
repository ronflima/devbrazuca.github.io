iOS: injeção de dependências em View Controllers
================================================

Injete a dependência e diminua o acoplamento

------------------------------------------------------------------------

### iOS: injeção de dependências em View Controllers

#### Injete a dependência e diminua o acoplamento

<figure>
<img src="https://cdn-images-1.medium.com/max/800/1*o1FQJt5Qvr9lXr8unEuo9Q.jpeg" class="graf-image" />
</figure>Aqui está o problema: um determinado view controller precisa de
dados que são selecionados por outro view controller. O view controller
que seleciona os dados navega para o novo view controller que apresenta
os dados selecionados. Este é, sem dúvida, o cenário mais comum de
qualquer aplicativo iOS, concorda? Por exemplo, um view controller
mostra uma lista de itens e o outro mostra os detalhes de um item
selecionado pelo usuário.

O problema é: como fazer os dados chegarem lá na frente? Não precisa ser
um cenário tão corriqueiro. Imagine que um dos view controllers precisa
de um contexto Core Data para demonstrar determinados dados. Como este
contexto pode chegar lá?

Não importa qual sejam os dados que precisem transitar entre os view
controllers. O problema resume-se a um denominador comum: como fazer
para injetar dados de um view controller em outro?

Em uma aplicação que utilize storyboards, a forma recomendada pela Apple
para criar a UI atualmente, você tem a possibilidade de injetar
dependências quando uma segue é disparada. Portanto, faz parte do
mecanismo que vou explicar usar o método *prepare(for segue:)* para que
um view controller injete dados no próximo view controller na estrutura
de navegação.

Se você não usa storyboards, não poderá usar o método *prepare(for
segue:)* pois as segues são classes específicas para uso em storyboards.
Neste caso, o princípio explicado aqui ainda vale, mas você deverá
injetar as dependências *antes* do próximo view controller ser exibido,
pois neste cenário você controla a instanciação e a inicialização do
view controller manualmente.

#### O problema da hierarquia

O próximo view controller na sua navegação pode não ser apenas um view
controller, mas uma composição. Por exemplo, um navigation controller
tem um root view controller. Um tab bar controller tem uma quantidade
arbitrária de child view controllers. Um container pode ter diversos
view controllers. Ou seja, o próximo view controller pode não estar
sozinho no mundo.

Além disso, o view controller no qual você quer injetar a dependência
pode ser o child view controller do próximo view controller. Por
exemplo, imagine um aplicativo que tem como root view controller da main
window um navigation controller. Agora imagine que você precise injetar
dependências no root view controller do navigation controller e, a
partir daí, passar as dependências adiante, para cada view controller
que tenha a necessidade de usá-las para algum tipo de operação.

A injeção de dependências é algo trivial. Porém, em um cenário como o
que estou descrevendo, a coisa ficou um pouquinho mais complexa. Mas só
um pouquinho. Em termos estruturais, toda, eu disse **toda,** aplicação
iOS pode ser descrita como um grafo orientado. Para navegar na estrutura
da sua aplicação, basta obter-se um nó e navegar pelos outros nós.

Como todos os nós compartilham da mesma característica, ou seja, são
view controllers, podemos generalizar o conceito para um grafo orientado
no qual cada nó é igual um ao outro. Percebeu a importância de estudar
algoritmos?

#### Recursividade

Bem, já sabemos que podemos descrever um app como um grafo. Temos sempre
um ponto de partida, ou seja, sempre podemos partir da janela principal
e obter o root view controller dela. A partir daí, podemos navegar
livremente pela estrutura da aplicação, até onde há view controllers
instanciados.

Não dá para propagar a injeção de dependências para a aplicação inteira
de uma só vez por que os view controllers são instanciados por demanda.
Ou seja, quando sua aplicação inicia-se, somente uma pequena parcela dos
view controllers estará instanciada e na memória. Assim, o nosso grafo
cresce de acordo com a navegação do usuário.

O algoritmo que demonstrarei aqui é recursivo. O fato é que a
profundidade de recursão sempre será pequena, mesmo que sua aplicação
seja um monstro. Apesar de todas as possibilidades de navegação, o grafo
em memória sempre acaba como uma lista, sendo uma árvore com
profundidade limitada no pior caso. Assim, a profundidade da recursão
sempre será pequena.

#### Protocolos, me salvem!

Mas, dentro do grafo que é a nossa aplicação, como identificar quais
view controllers aceitam as dependências que queremos injetar?
Protocolos!

Todo view controller que estiver em conformidade com um protocolo bem
determinado estará, automaticamente, eleito para receber a dependência
que queremos enfiar nele.

Portanto, o truque é usar protocolos para saber se o view controller
pode receber, ou não a injeção de dependências. Uma forma de implementar
isto é esta:

    protocol Injectable: class {
        var data: [[String]]! {get set}
    }

    func inject(into controller: UIViewController, data: [[String]]) {
        if let dest = destController as? Injectable {
            dest.data = data
        }
        for child in destController.childViewControllers {
            inject(into: child, data: data)
        }
    }

*Injectable* é o protocolo que queremos aplicar. Digamos que todo view
controller da nossa aplicação que precise de injeção de dependência
tenha de estar em conformidade com o protocolo *Injectable*. Como
usaremos somente classes para verificar a conformidade do protocolo,
então declaramos o protocolo como somente útil para classes (dica de
<a href="https://twitter.com/bgondim" class="markup--anchor markup--p-anchor">Bruno Bilescky</a>) — isto
permite que a verificação da conformidade, e efetiva injeção de
dependência seja realizada com um objeto imutável, aumentando a
confiabilidade do código. Queremos mudar o estado do objeto, e não o
objeto.

A função *inject* navega recursivamente pela lista de view controllers,
injetando a dependência sempre que achar um view controller que está em
conformidade com o nosso pequeno protocolo. Por que disso? O fato é que
na hierarquia de view controllers, podem existir aqueles que não nos
interessam. Assim, é importante navegar em cada nó, entrando
recursivamente em cada sub-nó e assim por diante.

Apesar desta rotina recursiva dar um frio na barriga, ela tem uma
profundidade pequena e faz a injeção na sua fase ativa.

#### Como generalizar?

O código apresentado até aqui tem como objetivo ilustrar o conceito. Não
é ruim usar uma função em uma linguagem orientada ao objeto. Trata-se de
um *helper* funcional, que não tem necessidade de guardar nenhum estado
em particular.

Porém, uma forma fácil é generalizar este helper para uma estrutura. Por
que uma estrutura? Bem, as estruturas são mais eficientes para ativar
métodos do que as classes pois, como não suportam herança, não há por
que haver uma pesquisa na tabela interna para saber qual método ativar
no caso de uma configuração polimórfica: não há polimorfismo nas
estruturas.

Aqui está uma forma de fazer isso, usando generics:

    struct Injector<ProtocolType, InjectableDataType> {
        typealias InjectorCallback = (ProtocolType, InjectableDataType) -> Void
        let injector: InjectorCallback

        init(callback: @escaping InjectorCallback) {
            injector = callback
        }
        
        func inject(into controller: UIViewController, data: InjectableDataType) {
            if let dest = controller as? ProtocolType {
                injector(dest, data)
            }
            for child in controller.childViewControllers {
                inject(into: child, data: data)
            }
        }
    }

Tá, a formatação do código está ruim. Não se preocupe. Tem um exemplo
completinho no GitHub. Aqui o truque é o seguinte: parametrizamos o
protocolo, para verificar a conformidade, e parametrizamos o tipo de
dado a injetar. O callback, infelizmente, é necessário. Sem
determinarmos os tipos, não há como injetar as dependências de forma tão
genérica. Assim, isolamos no callback o conhecimento do que injetar.
Aqui está um exemplo de uso:

    let injector = Injector<Injectable, [[String]]>(callback {(controller, data) in
        controller.data = data
    })
    if let rootController = window?.rootViewController {
        injector.inject(into: rootController, data: data)
    }

Aqui injetamos dados \[\[String\]\] em controllers que estão em
conformidade com o protocolo *Injectable*. Como usamos um generic para
criar nosso injetor de dependências, então é possível fazer isso com
virtualmente qualquer protocolo que você precise.

Uma generalização possível é alterar o nosso injector para injetar
dependências em uma série de protocolos diferentes usando o mesmo
código. Isto é potencialmente útil quando temos aplicações complexas com
diversos tipos de dependências. Fica como dever de casa ;).

#### Conclusão

Bem, amigos. Todo este artigo baseia-se no fato de que uma hierarquia de
view controllers é carregada automaticamente pelos storyboards. Tudo
funciona por que os view controllers são carregados **antes** de suas
views. Sabe aquele método mágico *viewDidLoad()* que todo view
controller tem? Pois é, aquilo é para quando a *view* é carregada. Não
tem nada a ver com o que discutimos aqui.

Quando um tab bar controller é instanciado por um storyboard, por
exemplo, é garantido que todos os controllers que fazem parte dele
comporão o vetor de child view controllers. Este fato é necessariamente
verdadeiro para navigation controllers e outras composições. É por este
motivo que o truque que expliquei neste artigo funciona.

Ah, você é São Tomé? Só acredita vendo? Tá bom.
<a href="https://github.com/nineteen-apps/SwiftDependencyInjection" class="markup--anchor markup--p-anchor">Tá aqui um projetinho</a>
que demonstra o princípio.

Bom divertimento!

Edit 1: Adicionada dica valiosa de
<a href="https://twitter.com/bgondim" class="markup--anchor markup--p-anchor">Bruno Bilescky</a>
que se refere à imutabilidade do objeto view controller.

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [December 17, 2016](https://medium.com/p/ed657855d48f).

<a href="https://medium.com/@ronaldolima/ios-inje%C3%A7%C3%A3o-de-depend%C3%AAncias-em-view-controllers-ed657855d48f" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
