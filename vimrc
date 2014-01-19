" BASIC VIM SETTINGS
set nocompatible          " used for VIM
set shiftwidth=4          " number of spaces for an indentation
set tabstop=4             " number of spaces that a tab replaces
set autoindent            " newlines keep the indentation level
set number                " line numbering
set ignorecase            " use case insensitive search, but...
set smartcase             " only when searching for lowercase words
set hlsearch              " highlight search results
set cmdheight=2           " change the height of the command window
set confirm               " ask if you wish to save changes
set showcmd               " show the command being typed
set visualbell            " remove bell
set mouse=a               " enable the mouse in all modes
set foldmethod=marker     " folding
set backspace=2           " backspaces can delete line breaks
set clipboard=unnamedplus " use clipboard for yank
set hidden                " instead of closing, buffers become hidden


" MAPPINGS
inoremap jj <Esc>
nnoremap ; :
nnoremap : ;


" SCRIPTS
" remove trailing whitespace on save
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
" automatically change working directory of window to current file
autocmd BufEnter * silent! lcd %:p:h


" VUNDLE PLUGIN
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'Rip-Rip/clang_complete'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'msanders/snipmate.vim'
Bundle 'derekwyatt/vim-fswitch'
Bundle 'cschlueter/vim-wombat'
filetype plugin indent on


" CLANG COMPLETE PLUGIN
let g:clang_user_options = '|| exit 0'
let g:clang_complete_copen = 1
"let g:clang_library_path='/usr/lib'
" complete function parameters using snipmate
let g:clang_snippets = 1
let g:clang_snippets_engine = 'snipmate'
" automatically insert completion
set completeopt=menu,longest

" WOMBAT PLUGIN
syntax on
set t_Co=256
colorscheme wombat256

