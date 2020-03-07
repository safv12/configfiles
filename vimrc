" language en_US

if has ('win32') || has ('win64')
    let &shell='cmd.exe'
endif

set nocompatible " be iMproved, required
filetype off " required

""" plug config
call plug#begin("~/.vim/plugged")

" Themes
Plug 'dracula/vim'

" General plugins
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
Plug 'vim-scripts/BufOnly.vim'

" CloudFormation
Plug 'speshak/vim-cfn'

" Go plugins
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Golang plugin.

" YAML plugins
Plug 'pedrohdz/vim-yaml-folds'

" CSharp
Plug 'OrangeT/vim-csharp'
Plug 'OmniSharp/omnisharp-vim', {'for': 'cs'}

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

""" airline (tabline)
let g:airline_section_b='%{fugitive#statusline()}'
""" end of airline

""" ALE
let g:ale_linters = { 'cs': ['OmniSharp'] }
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

""" go-vim
let g:go_fmt_experimental = 1
let g:go_fmt_command = "goimports"
""" end of go-vim

""" asyncomplete
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_force_refresh_on_context_changed = 1
""" end of asyncomplete

""" omnisharp
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 2

nnoremap <F2> :OmniSharpRename<CR>
nnoremap <Leader>cf :OmniSharpCodeFormat<CR>
nnoremap <Leader>ss :OmniSharpStartServer<CR>

augroup omnisharp_commands
    autocmd!

    autocmd CursorHold *.cs OmniSharpTypeLookup

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
""" end of omnisharp
