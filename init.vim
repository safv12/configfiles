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

Plug 'gruvbox-community/gruvbox' " Gruvbox theme.
Plug 'preservim/nerdtree' " A tree explorer plugin for vim.
Plug 'Raimondi/delimitMate' " Auto-completion for quotes, parens, brackets
Plug 'airblade/vim-gitgutter' " Shows a git diff in the gutter.
Plug 'editorconfig/editorconfig-vim' " EditorConfig plugin for vim.
Plug 'tpope/vim-commentary' " Comment stuff out.

" A command-line fuzzy finder plugins
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

call plug#end()
""" End of plug configuration

colorscheme gruvbox

"" FZF configuration
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
"" End of FZF configuration"

"" Mappings
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

noremap <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-g> :Ag<CR>

nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
