" language en_US

if has ('win32') || has ('win64')
    let &shell='cmd.exe'
endif

set nocompatible " be iMproved, required
filetype off " required

""" plug config
call plug#begin("~/.vim/plugged")

" Theme
Plug 'dracula/vim'

" General plugins
Plug 'Raimondi/delimitMate' " Auto-completion for quotes, parens, brackets
Plug 'airblade/vim-gitgutter' " Shows a git diff in the gutter.
" Plug 'ctrlpvim/ctrlp.vim' " File finder with ctrl-p.
Plug 'editorconfig/editorconfig-vim' " EditorConfig plugin for vim.
Plug 'ekalinin/dockerfile.vim' " Vim syntax file & snippets for Docker's Dockerfile.
Plug 'scrooloose/nerdtree' " A tree explorer for vim.
Plug 'tpope/vim-commentary' " Comment stuff out.
Plug 'tpope/vim-fugitive' " A Git wrapper.
Plug 'vim-airline/vim-airline' " Lean & mean status/tabline for vim.
Plug 'vim-airline/vim-airline-themes' " A collection of themes for vim-airline.
Plug 'vim-syntastic/syntastic' " Syntax checking hacks for vim.
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' } " Modern performant generic finder and dispatcher for Vim and NeoVim

" Go plugins
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Golang plugin.

" YAML plugins
Plug 'pedrohdz/vim-yaml-folds' " YAML, RAML, EYAML & SaltStack SLS folding for vim.

call plug#end()
""" end of plug config

""" theme configuration
syntax on
set background=dark
colorscheme dracula
""" end of theme configuration

""" command mappings 
map <C-b> :NERDTreeToggle<CR>
map <C-p> :Clap files<CR>
map <C-f> :Clap blines<CR>
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

""" ctrlp
" set wildignore+=node_modules/**,vendor/**,obj/**,bin/Debug/**,bin/Release/**,dist/**,target/**,.git/**,**/node_modules/**,**/vendor/**,**/obj/**,**/bin/Debug/**,**/bin/Release/**,**/dist/**,**/target/**,**/.git/**,**/build/**
" let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|vendor|bin|obj|build)|(\.(swp|ico|git|svn))$'

" set runtimepath^=~/.vim/bundle/ctrlp.vim
" set wildignore+=*/node_modules/*,*/.git/*,*.swp
""" end of ctrlp

""" airline (tabline)
let g:airline_section_b='%{fugitive#statusline()}'
""" end of airline

""" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_go_checkers = ['golint', 'go vet', 'golangci-lint']
let g:syntastic_yaml_checkers = ['yamllint']
let g:syntastic_cloudformation_checkers = ['cfn_lint']
""" end of syntastic

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

""" go-vim
let g:go_fmt_experimental = 1
let g:go_fmt_command = "goimports"
""" end of go-vim
