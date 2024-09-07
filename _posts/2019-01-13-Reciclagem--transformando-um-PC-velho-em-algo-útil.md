---
layout: post
title: "Reciclagem: transformando um PC velho em algo útil"
subtitle: Os computadores, como tudo neste mundo, ficam velhos. Porém, é melhor dar um destino mais digno do que a lata de lixo se ainda estiverem…
image: "https://cdn-images-1.medium.com/max/800/1*_DSi6rv65zOLSOanQ9JoSg.jpeg"
author: ronaldo
categories: [Tutoriais]
---

Os computadores, como tudo neste mundo, ficam velhos. Porém, é melhor dar um
destino mais digno do que a lata de lixo se ainda estiverem em boas condições e
ainda usarem uma tecnologia que permita alguns upgrades ou substituições com
baixo custo. E aqui vão algumas dicas com alguns casos de sucesso.

# Qual o limite?

Existe um limite que precisa ser respeitado. O limite é o risco que a adição de
um PC velho representa na sua infra-estrutura de TI. Normalmente, uma máquina
mais antiga deverá ser usada para implementar algum serviço secundário cujo
*downtime* não seja relevante para sua infraestrutura.

Outro aspecto importante é a segurança: o PC velho não pode ser um fator de
risco de segurança para o seu TI.

Do ponto-de-vista de hardware, é importante ter em mente o que é que deixa de
funcionar com mais frequência: coolers e discos rígidos. Em alguns casos,
fontes. Tanto as fontes quanto os coolers são de manutenção barata e podem ser
substituídos de maneira simples, a não ser que sua máquina use algo muito
proprietário, o que é bastante raro. Os discos rígidos tendem a ter seu valor
aumentado caso seja necessário o uso de hardware antigo. Atualmente, discos SATA
são baratos e é possível usar discos SATA III em hardware que usa SATA I.

# Quais cenários de uso?

Se o disco rígido for novo e com poucas horas de uso, você pode usar seu PC
velho como central de arquivamento e backup. Basta compartilhar o disco dele via
SAMBA. Neste caso, atende-se tanto redes com macs quanto redes com PCs.

Se o disco não for confiável, você pode usar a máquina como SMTP, ou como proxy
e cache de internet, o que vai aumentar bastante a sua experiência de navegação,
minimizando os acessos reais à internet.

# Casos de Sucesso

O primeiro caso de sucesso já tem alguns anos. Foi em 2003 na Schlumberger Sema,
em uma divisão que foi adquirida pela Atos Origin. Havia a necessidade de um
wiki para o time de desenvolvimento. A ideia era ter uma forma de compartilhar e
gerenciar o conhecimento dentro das equipes.

Não haviam recursos disponíveis e não consegui justificar a aquisição de um
equipamento novo para hospedar o wiki de uso interno. Porém, a empresa estava
dando baixa no patrimônio de várias máquinas, cada uma com um problema
diferente: fonte queimada, sem memória, disco queimado, placa mãe queimada…

Como toda empresa grande, as máquinas são padronizadas. Assim, todas as máquinas
que iam entrar em baixa do patrimônio eram do mesmo modelo e tinham a mesma
especificação. O trabalho, neste caso, foi o de verificar o que funcionava e
montar uma máquina com as *spare parts* de outras. Literalmente um
*Frankenstein*, nome que o projeto ganhou posteriormente.

Montada a máquina, subi um slackware linux, um servidor apache com PHP, MySQL e
PHPNuke (era o que tinha de pronto na época). Pronto. Estava feito o portal de
desenvolvimento.

Outro caso de sucesso aconteceu na Saibre, minha segunda empresa. Eu comprei, em
2010, um PC da Dell para desenvolvimento linux. Em 2013, já era uma máquina em
desuso, pois a Saibre só usava macs. Porém, usei esta máquina para hospedar um
repositório Subversion que funcionava como uma *way station* para o repositório
central, na nuvem.

Assim, a equipe de desenvolvimento local usava a máquina local que,
posteriormente, sincronizava seu repositório com a nuvem. Além disso, funcionava
um proxy para acesso à internet, pois a internet do escritório era bem ruim.

Atualmente, esta mesma máquina é usada para fazer backup e arquivamento, visto
que ela tem um disco SATA III novo em folha. Vale dizer que a interface dela é
SATA, porém o standard suporta *backward compatibility*, e permite que um disco
SATA III seja acionado sem maiores problemas. Logicamente que a performance é
degradada, mas como o SATA III agora é *mainstream*, o seu custo de aquisição é
menor do que um disco SATA.

# Conclusão

Aquela máquina velha que existe na sua empresa pode ser útil ainda, provendo
algum serviço que facilite o seu dia-a-dia, com custo muito baixo. É possível
criar, inclusive, *clusters* de PCs antigos para trabalhos que exigem alto
processamento, o que é um uso bem mais sofisticado.

No entanto, coisas simples, como backups, compartilhamento de arquivos, proxies,
caches e outras funções menores da estrutura de TI podem ser facilmente
colocadas em produção usando o seu PC antigo.
