" Habilitar a detecção do tipo de arquivo. O Vim será capaz de tentar detectar automaticamente o tipo de arquivo.
filetype on

" Habilitar plug-ins e carregar o plug-in correspondente ao tipo de arquivo detectado. 
filetype plugin on

" Carregar um arquivo de indentação correspondente ao tipo de arquivo detectado.
filetype indent on
syntax on " Ativar o realce de sintaxe.



" --- Settings gerais ---
set number          " Adiciona numeração de cada linha;
set ruler           " Mostra a posição do cursor
" set cursorline    " Destaca a linha do cursor horizontalmente;
" set cursorcolumn  " Destaca a linha do cursor verticalmente;
set shiftwidth=4    " Define o recuo como 4 espaços;
set tabstop=4       " Define tamanho do tab com 4 espaços;
set expandtab       " Utiliza espaço ao invés de tab;
set nobackup        " Não salva arquivos de backup;
set scrolloff=10    " Não permite que o cursor vá abaixo ou acima de um numero N de linhas;
set wrap            " Permite quabrar linhas;
set incsearch       " Destaca os caracteres correspondentes durante uma busca;
set ignorecase      " Ignora letras maiúsculas durante a busca. 
set smartcase       " Sobrescreve a opção ignorecase se estiver buscando por letras maiúsculas;
set showcmd         " Mostra o comando a ser executado;
set showmode        " Mostra o modo em que você está;
set showmatch       " Mostra as palavras correspondentes durante uma pesquisa.
set hlsearch        " Utiliza destaque durante uma pesquisa
set history=1000    " Define os comandos a serem salvos no histórico, sendo 20 o número padrão;
set nocompatible    " Desabilitar a compatibilidade com vi;
set relativenumber
set signcolumn=auto
set colorcolumn=0
set smartindent
set clipboard+="unnamedplus"
set wildmenu        " Habilita o menu de preenchimento automático ao pressionar TAB.

