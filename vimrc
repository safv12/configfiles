" language en_US

if has ('win32') || has ('win64')
    let &shell='cmd.exe'
endif

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'dracula/vim' " Dracula theme for vim.
Plugin 'connorholyday/vim-snazzy' " Snazzy theme for vim.

Plugin 'Raimondi/delimitMate' " Auto-completion for quotes, parens, brackets
Plugin 'airblade/vim-gitgutter' " Shows a git diff in the gutter.
Plugin 'ctrlpvim/ctrlp.vim' " File finder with ctrl-p.
Plugin 'editorconfig/editorconfig-vim' " EditorConfig plugin for vim.
Plugin 'ekalinin/dockerfile.vim' " Vim syntax file & snippets for Docker's Dockerfile.
Plugin 'pedrohdz/vim-yaml-folds' " YAML, RAML, EYAML & SaltStack SLS folding for vim.
Plugin 'scrooloose/nerdtree' " A tree explorer for vim.
Plugin 'tpope/vim-fugitive' " A Git wrapper.
Plugin 'vim-airline/vim-airline' " Lean & mean status/tabline for vim.
Plugin 'vim-airline/vim-airline-themes' " A collection of themes for vim-airline.
Plugin 'tpope/vim-commentary' " Comment stuff out.
Plugin 'vim-syntastic/syntastic' " Syntax checking hacks for vim

" all of your plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" color theme configuration
syntax on
colorscheme snazzy

" nerdTree configuration
map <C-b> :NERDTreeToggle<CR>

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

" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/node_modules/*,*/.git/*,*.swp

" airline (tabline)
let g:airline_section_b='%{fugitive#statusline()} - %{kite#statusline()}'
set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2

" echodoc
let g:echodoc#enable_at_startup = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Kite for python
let g:kite_tab_complete=1
set completeopt+=menuone   " Show the completions UI even with only 1 item
set completeopt-=menu
set completeopt+=menuone   " Show the completions UI even with only 1 item
set completeopt-=longest   " Don't insert the longest common text
set completeopt-=preview   " Hide the documentation preview window
set completeopt+=noinsert  " Don't insert text automatically
set completeopt-=noselect  " Highlight the first completion automatically
