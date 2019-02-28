" language en_US

if has ('win32') || has ('win64')
	let &shell='cmd.exe'
endif

if has('nvim')
	let s:editor_root=expand("~/AppData/Local/nvim")
else
	let s:editor_root=expand("~/.vim")
	set ttymouse=xterm2
endif

set nocompatible	" be iMproved, required
filetype off		" required

" set the runtime path to include Vundle and initialze
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" themes plugins
Plugin 'dracula/vim'

" navigation/visual plugins
Plugin 'Raimondi/delimitMate'			    " Provides auto-completion for quotes, parens, brackets, etc
Plugin 'scrooloose/nerdtree'			    " A tree explorer
Plugin 'airblade/vim-gitgutter'			    " Shows a git diff in the gutter
Plugin 'tpope/vim-fugitive' 			    " git wrapper inside of vim
Plugin 'scrooloose/syntastic' 			    " general linting
Plugin 'ctrlpvim/ctrlp.vim' 			    " finder
Plugin 'vim-airline/vim-airline' 		    " status line configuration
Plugin 'vim-airline/vim-airline-themes' 	" airline plugin to support themes in status line
Plugin 'editorconfig/editorconfig-vim' 		" formats code depending on .editorconfig

" html/css plugins
Plugin 'othree/html5.vim'
Plugin 'mattn/emmet-vim'
Plugin 'hail2u/vim-css3-syntax'

" golang plugins
Plugin 'fatih/vim-go' 		" go tool wrapper
Plugin 'zchee/deoplete-go' 	" go autocompletion using gocode

" js plugins
Plugin 'pangloss/vim-javascript' 		" js syntax highlighting
Plugin 'moll/vim-node' 				" node.js navigation tool
Plugin 'maksimr/vim-jsbeautify' 		" js formatting tool, uses .editorconfig
Plugin 'mxw/vim-jsx' 				" jsx syntax highlighting and indenting

" docker plugins
Plugin 'ekalinin/dockerfile.vim'

" all of your plugins must be added before the following line
call vundle#end() 		    " required
filetype plugin indent on	" required

" color theme configuration
syntax on
color dracula

" nerdTree configuration
nmap <C-b> NERDTreeToggle<CR>

" emmet configuration
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

set number
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

" go-vim
let g:go_fmt_command = "goimports"
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" airline (tabline)
let g:airline_section_b='%{fugitive#statusline()}'

" syntatic
let g:syntastic_check_on_open=1
let g:syntastic_go_checkers = ['golint', 'go vet']

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'

" echodoc
let g:echodoc#enable_at_startup = 1

" js beautify
autocmd FileType javascript noremap <buffer> <c-f> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" jsx
let g:jsx_ext_required = 0
