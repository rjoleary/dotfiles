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
set clipboard=unnamedplus  " use clipboard for yank
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
"inoremap jj <Esc>
"nnoremap ; :
"nnoremap : ;


"""""""""""""""""""" Swap and Backup Directory """"""""""""""""""""
set backupdir=~/.vimtemp,.
set dir=~/.vimtemp//,.


"""""""""""""""""""" Scripts """"""""""""""""""""
" remove trailing whitespace on save
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
" automatically change working directory of window to current file
"autocmd BufEnter * silent! lcd %:p:h
command Json %!python -m json.tool


"""""""""""""""""""" Vundle Plugin """"""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
"Bundle 'Rip-Rip/clang_complete'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'msanders/snipmate.vim'
Bundle 'derekwyatt/vim-fswitch'
Bundle 'cschlueter/vim-wombat'
filetype plugin indent on


"""""""""""""""""""" Clang Complete Plugin """"""""""""""""""""

" Use `libclang.so`; it is faster than the running clang, but requires Python.
"let g:clang_library_path      = '/usr/lib/llvm-3.4/lib/'
" Compile with C++11.
"let g:clang_user_options      = '-std=c++11'

" Use a popup completion menu.
"set completeopt=menu
" Select the first entry in the popup menu.
"let g:clang_auto_select       = 1
" Automatically complete after `->`, `.` and `::`.
"let g:clang_complete_auto     = 1
" Show error window when compilation fails.
"let g:clang_complete_copen    = 0
" Periodically update the error window.
"let g:clang_periodic_quickfix = 1
" Highlight errors in the code as well.
"let g:clang_hl_errors         = 1
" Add code placeholders for arguments, parameters, etc.
"let g:clang_snippets          = 1
"let g:clang_snippets_engine   = 'clang_complete'


"""""""""""""""""""" WOMBAT PLUGIN """"""""""""""""""""
syntax on
set t_Co=256
colorscheme wombat256
