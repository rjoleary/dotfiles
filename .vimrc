" Ryan's vimrc settings.
" WARNING: This is posted on Github, so avoid adding private settings.
"
" To quickly edit this file from the shell, use the vimrc alias.
"
" To reload this file into an already running vim, type `:source $MYVIMRC`.
" However, this is not perfect; for example, it will not automatically unmap
" commands and uninstall plugins.

" Enable cool VIM features.
set nocompatible

let mapleader=','


"""""""""""""""""""" Indentation """"""""""""""""""""
" To configure the tab width for a specific file type,
" edit ~/.vim/after/ftplugin/<FT>.vim
" where <FT> is the file type returned by :set ft?
set expandtab      " convert tabs to spaces
set shiftwidth=4   " tabs are 4 spaces
set tabstop=4      " tabs are 4 spaces
set softtabstop=4  " tabs are 4 spaces
set autoindent     " newlines keep the indentation level


"""""""""""""""""""" Search """"""""""""""""""""
set hlsearch    " highlight search results (hide with :nohl)
set ignorecase  " use case insensitive search, but...
set smartcase   " only when searching for lowercase words
set incsearch   " preview first match


"""""""""""""""""""" Misc """"""""""""""""""""
set number                 " line numbering
set cmdheight=2            " larger command window allows for more info
set showcmd                " eg. HxW for block selection
set mouse=a                " enable the mouse in all modes
set hidden                 " instead of closing, buffers become hidden
set scrolloff=3            " keep 3 lines below and above the cursor


"""""""""""""""""""" Tentative """"""""""""""""""""
" I am still trying out these commands. I will recategorize them later.
set foldmethod=marker     " folding
set visualbell            " remove bell and flash instead
set backspace=2           " backspaces can delete line breaks


"""""""""""""""""""" Mappings """"""""""""""""""""
nnoremap <LEADER>a :NERDTreeToggle<CR>
nnoremap th :tabp<CR>
nnoremap tl :tabn<CR>
noremap <F5> :setlocal spell! spelllang=en_ca<CR>


"""""""""""""""""""" Mappings Graveyard """"""""""""""""""""
" These were nice but make it difficult to use other people's vims.
" These wrecked me whenever running vim without my configs:
"inoremap jj <Esc>          " Map jj to ESC in insert mode
"nnoremap ; :               "
"nnoremap : ;
" Since deleting text also yanked, this caused the accidently loss of
" clipboard content too often:
"set clipboard=unnamedplus  " use clipboard for yank


"""""""""""""""""""" Swap and Backup Directory """"""""""""""""""""
set backupdir=~/.vimtemp,.
set dir=~/.vimtemp//,.


"""""""""""""""""""" Scripts """"""""""""""""""""
" remove trailing whitespace on save
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
" automatically change working directory of window to current file
"autocmd BufEnter * silent! lcd %:p:h
command Json %!python3 -m json.tool


"""""""""""""""""""" Vundle Plugin """"""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'msanders/snipmate.vim'
Plug 'derekwyatt/vim-fswitch'
Plug 'cschlueter/vim-wombat'
Plug 'justmao945/vim-clang', { 'for': 'cpp' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'Shougo/neocomplete'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
call plug#end()


"""""""""""""""""""" WOMBAT PLUGIN """"""""""""""""""""
set t_Co=256
colorscheme wombat256


"""""""""""""""""""" NEOCOMPLETE PLUGIN """"""""""""""""""""
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_select = 1
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
