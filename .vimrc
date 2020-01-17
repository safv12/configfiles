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
Plugin 'joshdick/onedark.vim' " One dark theme.
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
Plugin 'dense-analysis/ale' " Check syntax in Vim asynchronously and fix files

" Csharp plugins
Plugin 'OrangeT/vim-csharp'
Plugin 'OmniSharp/omnisharp-vim'

" all of your plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" color theme configuration
syntax on
colorscheme onedark

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
let g:airline_section_b='%{fugitive#statusline()}'

" echodoc
let g:echodoc#enable_at_startup = 1

" omnisharp
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_selector_ui = 'ctrlp'

augroup omnisharp_commands
  autocmd!

  autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
  autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
  autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
  autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>
  autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
  autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>

 augroup END

" ALE
let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}
