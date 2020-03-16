" language en_US

""" plug config
call plug#begin("~/.vim/plugged")

" Themes
Plug 'dracula/vim'
Plug 'Raimondi/delimitMate' " Auto-completion for quotes, parens, brackets
Plug 'airblade/vim-gitgutter' " Shows a git diff in the gutter.
Plug 'editorconfig/editorconfig-vim' " EditorConfig plugin for vim.
Plug 'ekalinin/dockerfile.vim' " Vim syntax file & snippets for Docker's Dockerfile.
Plug 'scrooloose/nerdtree' " A tree explorer for vim.
Plug 'tpope/vim-commentary' " Comment stuff out.
Plug 'tpope/vim-fugitive' " A Git wrapper.
Plug 'vim-airline/vim-airline' " Lean & mean status/tabline for vim.
Plug 'vim-airline/vim-airline-themes' " A collection of themes for vim-airline.
Plug 'w0rp/ale' " Syntax checker.
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' } " Modern performant generic finder.
Plug 'sheerun/vim-polyglot' " Language pack for vim.
Plug 'pedrohdz/vim-yaml-folds'

" python plugins
Plug 'vim-python/python-syntax' " python syntax highlighting
Plug 'tmhedberg/SimpylFold' " python folding for python-syntax

" javascript
 Plug 'maksimr/vim-jsbeautify' "js formatting tool, uses .editorconfig

call plug#end()
""" end of plug config

filetype indent plugin on

""" theme configuration
syntax on
set background=dark
colorscheme dracula
""" end of theme configuration

""" command mappings
map <C-b> :NERDTreeToggle<CR>
map <C-p> :Clap files<CR>
map <C-f> :Clap blines<CR>
map <C-g> :Clap grep<CR>
map <C-t> :Clap buffers<CR>
""" end of command mappings

set number
set t_ut=
set hlsearch
set tabstop=4
set shiftwidth=4
set expandtab
set ruler
set foldmethod=syntax
set autoindent
set cindent
set nocompatible
set cmdheight=2
set completeopt-=preview
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list

" remap arrow keys to NOP
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

"Mode Settings

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)]]]

""" airline (tabline)
let g:airline_section_b='%{fugitive#statusline()}'
""" end of airline

""" ALE
let g:ale_fix_on_save = 1

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'js': ['eslint'],
\}

let g:ale_linters = {
\   'js': ['eslint'],
\   'cloudformation': ['cfn_lint'],
\}
""" end of ALE

""" kite
let g:kite_tab_complete=1
set completeopt+=menuone   " Show the completions UI even with only 1 item
set completeopt-=menu
set completeopt+=menuone   " Show the completions UI even with only 1 item
set completeopt-=longest   " Don't insert the longest common text
set completeopt-=preview   " Hide the documentation preview window
set completeopt+=noinsert  " Don't insert text automatically
set completeopt-=noselect  " Highlight the first completion automatically
""" end of kite
