let mapleader=" "
syntax enable
syntax on
set number
set norelativenumber
set cursorline
set wrap
set showcmd
set wildmenu
set encoding=utf-8
set t_Co=256

set showmatch
set hlsearch
exec "nohlsearch" 
set incsearch
set ignorecase
set smartcase

map s :<nop>
map R :w<CR> :source $MYVIMRC<CR>
map S :w<CR>
map Q :q<CR>
noremap J 5j
noremap K 5k
imap jk <Esc>
nmap <space> :
autocmd BufWritePost $MYVIMRC source $MYVIMRC

map sr :set splitright<CR>:vsplit<CR>
map sl :set nosplitright<CR>:vsplit<CR>
map su :set splitbelow<CR>:split<CR>
map sd :set nosplitbelow<CR>:split<CR>

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
call plug#end()

map <silent> <C-e> :NERDTreeToggle<CR>
