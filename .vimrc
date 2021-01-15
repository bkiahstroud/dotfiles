set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on            " allows nerdcommenter to work correctly
syntax on
syntax enable
set clipboard=unnamed         " configure terminal vim to use mac clipboard
let mapleader="\<space>"      " remap leader to <space> bar
set backspace=2               " make backspace work like most other apps
set laststatus=2              " always display the status line
set showcmd                   " Show us the command we're typing
set hlsearch                  " highlight search items
set updatetime=100
set number
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

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
set mouse=a
set ttymouse=xterm2

" source: https://vi.stackexchange.com/a/53
" Let's save undo info!
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile

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
Plugin 'itchyny/lightline.vim'            " lightline
" Throwing segmentation errors on :Bdelete
" Plugin 'moll/vim-bbye'                  " bbye
Plugin 'tpope/vim-repeat'                 " vim-repeat
Plugin 'easymotion/vim-easymotion'        " easymotion
Plugin 'dense-analysis/ale'               " ale
Plugin 'maximbaz/lightline-ale'           " lightline-ale
Plugin 'editorconfig/editorconfig-vim'    " editorconfig
Plugin 'tpope/vim-abolish'                " abolish.vim

" Themes
Plugin 'drewtempelmeyer/palenight.vim'    " palenight theme
" alt theme: https://vimawesome.com/plugin/vim-quantum

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
" remap annoying keys
nmap J }
nmap K {
vmap Jk }k
vmap K {

" AUTOCOMPLETE DELIMITERS
inoremap {<CR> {<CR>}<ESC>O
" RUBY AUTOCOMPLETE DELIMITERS
inoremap #{ #{}<left>
inoremap <% <%  %><left><left><left>
inoremap <%= <%=  %><left><left><left>
inoremap <%# <%#  %><left><left><left>

" GitHub username in TODOs and NOTEs
inoremap TODO TODO(bkiahstroud)
inoremap NOTE NOTE(bkiahstroud)

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
map <silent> <leader><CR> :noh<CR>
" Write file
nmap <leader>w :w<CR>
" Quit Vim
nmap <leader>q :q<CR>
" Quit Vim (without saving)
nmap <leader>Q :q!<CR>
" Quit current buffer
"" Switch if bbye plugin is reactivated
nmap <leader>b :bd<CR>
" nmap <leader>b :Bdelete<CR>
" Switch (split) buffer
nnoremap <leader>s <C-W><C-W>
" Tab shortcuts
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tt :tabnext<CR>
nnoremap <leader>tp :tabprev<CR>
nnoremap <leader>tq :tabclose<CR>
" Quickly open vim-fugitive :Gstatus buffer
nnoremap <leader>k :Gstatus<CR>
" Quickly open vim-fugitive :Gblame buffer
nnoremap <leader>j :Gblame<CR>
" Copy relative filepath to clipboard
nnoremap <leader>cfp :let @+ = expand('%')<CR>
" Copy filename to clipboard
nnoremap <leader>cfn :let @+ = expand('%:t')<CR>
" Replace old Ruby hash rocket syntax
nnoremap <leader>R :HashRocketReplace<CR>
vnoremap <leader>R :HashRocketReplace<CR>

" COMMANDS
" command HashRocketReplace %s/:\(\w\+\)\s*=>\s*/\1: /gc
command -range=% HashRocketReplace silent execute <line1>.','.<line2>.'s/:\(\w\+\)\s*=>\s*/\1: /gc'

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
nnoremap <leader>a :Ack!<Space>'

" multicursor config
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key='<C-o>'
let g:multi_cursor_select_all_word_key='<C-a>'
let g:multi_cursor_start_key='g<C-o>'
let g:multi_cursor_next_key='<C-o>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='jk'
let g:multi_cursor_exit_from_visual_mode=0

" ALE config
let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'ruby': ['rubocop'],
\ 'typescript': ['tslint'],
\}
let g:ale_linters_explicit = 1 " Only run linters named in ale_linters settings.
let g:ale_sign_column_always = 1

" Theme config
set background=dark
colorscheme palenight
if (has("termguicolors"))
  set termguicolors
endif

" Lightline config
let g:lightline = {
\  'colorscheme': 'palenight',
\  'active': {
\    'left': [
\              [ 'mode', 'paste' ],
\              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
\            ],
\    'right': [
\               [ 'lineinfo', 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
\               [ 'percent' ],
\               [ 'filetype' ]
\             ]
\  },
\  'component_function': {
\    'gitbranch': 'fugitive#head'
\  },
\}
let g:lightline.component_expand = {
\  'linter_checking': 'lightline#ale#checking',
\  'linter_infos': 'lightline#ale#infos',
\  'linter_warnings': 'lightline#ale#warnings',
\  'linter_errors': 'lightline#ale#errors',
\  'linter_ok': 'lightline#ale#ok',
\}

" easymotion config
" map <leader> <Plug>(easymotion-prefix)
" let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap <leader><leader>s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" nmap s <Plug>(easymotion-overwin-f2)

" <leader>f{char} to move to {char}
" nmap <leader>f <Plug>(easymotion-overwin-f)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
" map <leader>j <Plug>(easymotion-j)
" map <leader>k <Plug>(easymotion-k)

" editorconfig
" (https://github.com/editorconfig/editorconfig-vim#excluded-patterns)
" 'To ensure that this plugin works well with Tim Pope's fugitive'
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Autocomplete
set omnifunc=syntaxcomplete#Complete
