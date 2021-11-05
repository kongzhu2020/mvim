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
"nmap <space> :"
autocmd BufWritePost $MYVIMRC source $MYVIMRC

map sr :set splitright<CR>:vsplit<CR>
map sl :set nosplitright<CR>:vsplit<CR>
map su :set splitbelow<CR>:split<CR>
map sd :set nosplitbelow<CR>:split<CR>

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'maralla/completor.vim'
call plug#end()

" ##### Plug: NERDTree "
map <silent> <C-e> :NERDTreeToggle<CR>

" ##### Plug: completor "
" Use TAB to complete when typing words, else inserts TABs as usual.  Uses
" dictionary, source files, and completor to find matching words to complete.

" Note: usual completion is on <C-n> but more trouble to press all the time.
" Never type the same word twice and maybe learn a new spellings!
" Use the Linux dictionary when spelling is in doubt.
function! Tab_Or_Complete() abort
  " If completor is already open the `tab` cycles through suggested completions.
  if pumvisible()
    return "\<C-N>"
  " If completor is not open and we are in the middle of typing a word then
  " `tab` opens completor menu.
  elseif col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^[[:keyword:][:ident:]]'
    return "\<C-R>=completor#do('complete')\<CR>"
  else
    " If we aren't typing a word and we press `tab` simply do the normal `tab`
    " action.
    return "\<Tab>"
  endif
endfunction

" Use `tab` key to select completions.  Default is arrow keys.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use tab to trigger auto completion.  Default suggests completions as you type.
let g:completor_auto_trigger = 1
inoremap <expr> <Tab> Tab_Or_Complete()
