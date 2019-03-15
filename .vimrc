set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on            " allows nerdcommenter to work correctly
syntax on
set clipboard=unnamed         " configure terminal vim to use mac clipboard
let mapleader="\<space>"      " remap leader to <space> bar
set backspace=2               " make backspace work like most other apps
set laststatus=2              " always display the status line
set showcmd                   " Show us the command we're typing
set hlsearch                  " highlight search items
set updatetime=100
set number

" set relative line numbering hybrid number mode
" set relativenumber

" Auto-toggle line numbers
" relative line numbers for normal mode
" normal line numbers for insert mode
"
" augroup numbertoggle
  " autocmd!
  " autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  " autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" augroup END

" set nice line breaks
set breakindent
set showbreak=\ \ \~~
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

" Indent guide configuration
let g:indentLine_char='|'

" Enable mouse in Iterm
" set mouse=a
" set ttymouse=xterm2

" Ruby autocomplete
autocmd FileType ruby,eruby,haml,slim let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby,haml,slim let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby,haml,slim let g:rubycomplete_rails = 1

" Make Vim detect slim files
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim

" Change cursor shape in insert mode
if $TERM ==# 'screen-256color'
  set notermguicolors
  let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
  let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  " set termguicolors
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'mileszs/ack.vim'                  " Ack
Plugin 'scrooloose/nerdtree'              " nerdtree
Plugin 'Xuyuanp/nerdtree-git-plugin'      " nerdtree-git-plugin
Plugin 'scrooloose/nerdcommenter'         " nerdcommenter
Plugin 'airblade/vim-gitgutter'           " gitgutter
Plugin 'yggdroot/indentline'              " indentline
Plugin 'tpope/vim-endwise'                " endwise
Plugin 'terryma/vim-multiple-cursors'     " multiple-cursors
Plugin 'tpope/vim-surround'               " surround
Plugin 'slim-template/vim-slim.git'       " slim template highlighting
Plugin 'tpope/vim-fugitive'               " fugitive
Plugin 'ctrlpvim/ctrlp.vim'               " ctrlp
Plugin 'ervandew/supertab'                " supertab

" Themes
Plugin 'drewtempelmeyer/palenight.vim'    " palenight theme

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ

" CUSTOM KEY MAPPINGS
" Hitting ESC is hard
inoremap jk <Esc>
vnoremap jk <Esc>
inoremap JK <Esc>
vnoremap JK <Esc>
" LEADER KEY MAPPINGS
" Make buffer switching easier
nmap <leader>L :bnext<CR>
nmap <leader>H :bprev<CR>
" Jump to first and last character of line, respectively
nnoremap <leader>h ^
vnoremap <leader>h ^
nnoremap <leader>l $
vnoremap <leader>l $h
" Jump to beginning of line
nmap <leader>hh 0
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>
" Write file
nmap <leader>w :w<cr>
" Quit Vim
nmap <leader>q :q<cr>
" Quit Vim (without saving)
nmap <leader>Q :q!<cr>
" Quit current buffer
nmap <leader>b :bd<cr>
" Switch (split) buffer
nnoremap <leader>s <C-W><C-W>

map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['.DS_Store', '*.swp', '*.swo']
let NERDTreeHighlightCursorline=1   "Highlight the selected entry in the tree
let NERDTreeShowLineNumbers=0
let NERDTreeMinimalUI=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " auto kill nerdtree if it is the only buffer

" Config NERDCommenter
let NERDSpaceDelims=1               " space around delimiters
let NERDRemoveExtraSpaces=1

"" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ackprg = 'ag --vimgrep'

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
let g:ackhighlight = 1
let g:ack_autofold_results = 1
let g:ackpreview = 1

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>'

" multicursor config
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key='<C-o>'
let g:multi_cursor_select_all_word_key='<C-a>'
let g:multi_cursor_start_key='g<C-o>'
let g:multi_cursor_next_key='<C-o>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Theme config
set background=dark
colorscheme palenight
if (has("termguicolors"))
  set termguicolors
endif

" Autocomplete
set omnifunc=syntaxcomplete#Complete
