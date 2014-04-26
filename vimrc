" BASIC VIM SETTINGS
set nocompatible          " used for VIM
set expandtab             " convert tabs to spaces
set shiftwidth=4          " tabs are 4 spaces
set tabstop=4             " tabs are 4 spaces
set softtabstop=4         " tabs are 4 spaces
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
set scrolloff=3           " keep 3 lines below and above the cursor


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

" Use `libclang.so`; it is faster than the running clang, but requires Python.
let g:clang_library_path      = '/usr/lib/llvm-3.4/lib/'
" Compile with C++11.
let g:clang_user_options      = '-std=c++11'

" Use a popup completion menu.
set completeopt=menu
" Select the first entry in the popup menu.
let g:clang_auto_select       = 1
" Automatically complete after `->`, `.` and `::`.
let g:clang_complete_auto     = 1
" Show error window when compilation fails.
let g:clang_complete_copen    = 1
" Periodically update the error window.
let g:clang_periodic_quickfix = 1
" Highlight errors in the code as well.
let g:clang_hl_errors         = 1
" Add code placeholders for arguments, parameters, etc.
let g:clang_snippets          = 1
let g:clang_snippets_engine   = 'clang_complete'

" WOMBAT PLUGIN
syntax on
set t_Co=256
colorscheme wombat256

