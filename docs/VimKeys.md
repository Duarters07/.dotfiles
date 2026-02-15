# vimtutor keybinds

## Comandos para eleminar

- **dw**: Para eleminar uma palavra (elemina até o início da próxima);
- **de**: Elemina até o fim da palavra atual;
- **d$**: Para eleminar até ao fim de uma linha;
- **dd**: Apaga a linha por completo (podemos usar 2dd para apagar duas linhas seguidas);

> NOTA: Para repetir um movimento podemos combinar com um número: d2w -> Elimina duas palavras seguidas

## Movimentar

- **0**: Movimenta para o início da linha;
- **$**: Movimenta para o fim da linha;
- **u**: (lowercase) faz undo da última alteração
- **U**: (Uppercase) Faz undo de todas as alterações da linha em questão;
- **CTRL -r**: Faz undo dos undos;

## O comando REPLACE

- **r**: dar replace the caracateres selecionados pelo cursor;
- **ce**: Para alterar até o final de uma palavra (funciona como o operadore delete, podemos usar **ce**, **cw** e ainda **c$**);
- **R**: Para dar replace de mais do que um caracter. Precionar <ESC> para sair do replace mode;

## Comandos de Localização/Procura

- **CTRL -g** - Mostra a localização do cursor no documento
- **G** - Para mover o cursor para o fim do documento;
- **gg** - Mover o cursor para o início do documento;
- **/** - Uma frase seguido de **/** serve para procurar a mesma frase no documento;
- **/ [frase] n** - A procura de uma frase seguida de n serve para pesquisar a mesma frase outra vez;
- **/ [frase] N** - O mesmo que anterior mas na direção oposta;
- **CTRL -o** - Para ir de onde viemos;
- **CTRL -i** - Oposto do **CTRL -o**, ou seja, voltamos para a frente;
- **%** - Procura um matching a ),] ou } enquanto o cursor está em (,),[,],{ ou };

## Comandos de Substituição

- **:s/old/new**: Substitui para 'new' o primeiro 'old' na linha selecionada;
- **:s/old/new/g**: Substitui para 'new' todos os 'old' na linha selecionada;
- **:#,#s/old/new/g**: Substitui para 'new' todos os 'old' entre as linhas # e #;
- **:%s/old/new/g**: Substitui para 'new' todas as ocurrências de 'old' no ficheiro;
- **:%s/old/new/gc**: faz uma confirmação para cada substituição para 'new' de todos os 'old' de todo o documento;

## Executar comandos externos

- **:! [comando]**: **:!** seguido de comando para executar esse comando 

## O comando OPEN

- **o**: Adiciona uma linha nova **abaixo** da linha atual do cursor e coloca-nos em INSERT mode;
- **O**: Adiciona uma linha nova **acima** da linha atual do cursor e coloca-nos em INSERT mode;

## O comando APPEND

- **a**: Para inserir texto **depois** do cursor;
- **A**: Para inserir texto depois do fim da linha atual;

> Tanto **a**, **i** e **A** entram no INSERT mode, a diferença é onde o cursor é colocado.

## Copiar e colar texto

- **v**: Para entrar no VISUAL mode.
- **y**: Para copiar texto;
- **yy**: Para copiar a linha completa;
- **p**: Para colar texto;
