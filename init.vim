"""
" Personal Neovim configuration.
" This configuration uses nvim-lspconfig and required nvim v0.5 .
"
" To install the configured LSP servers run:
"
"   Outside vim:
"       $ pip install 'python-language-server[all]'
"       $ npm install rome -g
"
"   Inside vim:
"       :LspInstall dockerls
"       :LspInstall jsonls
"       :LspInstall omnisharp
"       :LspInstall yamlls

syntax on

set autoindent
set background=dark
set backspace=indent,eol,start
set cindent
set cmdheight=2 " Give more space for displaying messages.
set completeopt-=preview
set expandtab
set hlsearch
set nobackup
set noswapfile
set nowrap
set number
set shiftwidth=4
set smartcase
set smartindent
set relativenumber
set tabstop=4
set termguicolors
set updatetime=50
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list

set colorcolumn=120
highlight ColorColumn ctermbg=0 guibg=lightgrey

""" Plug configuration
call plug#begin("~/.vim/plugged")

Plug 'dracula/vim', { 'as': 'dracula' } " Dracula theme.
Plug 'neovim/nvim-lspconfig' " Quickstart configurations for the Nvim LSP client.
Plug 'nvim-lua/completion-nvim' " A async completion framework aims to provide completion to neovim's built in LSP written in Lua.
Plug 'preservim/nerdtree' " A tree explorer plugin for vim.
Plug 'sheerun/vim-polyglot' " A solid language pack for Vim.
Plug 'Raimondi/delimitMate' " Auto-completion for quotes, parens, brackets
Plug 'airblade/vim-gitgutter' " Shows a git diff in the gutter.
Plug 'editorconfig/editorconfig-vim' " EditorConfig plugin for vim.
Plug 'tpope/vim-commentary' " Comment stuff out.
Plug 'tpope/vim-fugitive' " A Git wrapper.

" A command-line fuzzy finder plugins
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

call plug#end()
""" End of plug configuration

colorscheme dracula

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require'nvim_lsp'.tsserver.setup{ on_attach=require'completion'.on_attach }

""" LSP configuration
lua require'nvim_lsp'.pyls.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.dockerls.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.jsonls.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.omnisharp.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.rome.setup{ on_attach=require'completion'.on_attach }
""" End of LSP configuration

""" FZF configuration
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
""" End of FZF configuration

""" Mappings
let mapleader = " "

" Remap arrow keys to NOP
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

noremap <C-b> :NERDTreeToggle<CR>
nnoremap <silent> <C-p> :Files<CR>

" LSP mappings 
nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>rr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>ho :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>ca :lua vim.lsp.buf.code_action()<CR>

" Git mappings
nnoremap <leader>gc :GBranches<CR>

nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
""" End of mappings
