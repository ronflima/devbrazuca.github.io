Para os números aleatórios pode-se utilizar um truque bem comum no linux e também no mac OS X:
==============================================================================================

Este gerador é bem confiável. Dá para usar de forma geral.

------------------------------------------------------------------------

Para os números aleatórios pode-se utilizar um truque bem comum no linux
e também no mac OS X:

    int i;
    uint64_t value = 0;
    FILE *fp = fopen("/dev/random", "r");
    if (!fp) {
        perror("randgetter");
        exit(-1);
    }
    for (i=0; i<sizeof(value); i++) {
        value <<= 8;
        value |= fgetc(fp);
    }
    fclose(fp);

Este gerador é bem confiável. Dá para usar de forma geral.

By
<a href="https://medium.com/@ronaldolima" class="p-author h-card">Ronaldo Faria Lima</a>
on [May 12, 2017](https://medium.com/p/d1323fa7dc7d).

<a href="https://medium.com/@ronaldolima/para-os-n%C3%BAmeros-aleat%C3%B3rios-pode-se-utilizar-um-truque-bem-comum-no-linux-e-tamb%C3%A9m-no-mac-os-x-d1323fa7dc7d" class="p-canonical">Canonical link</a>

Exported from [Medium](https://medium.com) on December 25, 2020.
