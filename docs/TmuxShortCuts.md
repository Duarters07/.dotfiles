# Tmux shortcuts

To see all the shortcuts keys in tmux simply use the `bind-key ?` in my case that would be `CTRL - a ?`.

## Sessions

- `:new<CR>`: Nova Sessão
- `tmux kill-session -t <session_name>`: Para eleminar uma sessão (**neste caso não usar bin-key**);
- `s`: Listar as sessões;
- `$`: Renomear uma sessão

## Windows

- `c`: Cria uma nova window;
- `w`: Para listar todas as windows;
- `n`: Ir para a próxima window;
- `p`: Ir para a window anterior;
- `f`: Para procurar windows;
- `,`: Nomear uma window;
- `&`: Kill a uma window.

## Panes (splits)

- `|`: Split Vertical;
- `-`: Split horizontal;
- `o`: Mudar de painel;
- `q`: Mostrar os números de painéis;
- `x`: Kill a painél;

## Resize de Paineis

- `j`: Resize Painél para cima (ou usar `UpArrow`);
- `k`: Resize painél para baixo (ou usar `DownArrow`);
- `l`: Resize painél para a direita (ou usar `RightArrow`);
- `h`: Resize painél para a esquerda (ou usar `LeftArrow`);
