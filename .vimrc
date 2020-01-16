" VIM CONFIGURATION

" ===== FUNCTIONS
function! FoldConfig()
	let line = getline(v:lnum)
	if match(line, '^[#"!]\s=') > -1
		return ">1"
	else
		return "="
	endif
endfunction
function! TextFold()
	let foldSize = (v:foldend-v:foldstart)
	return getline(v:foldstart).' ('.foldSize.' lines)'
endfunction

" ===== AUTOCMDS
autocmd FileType vim,sh,xdefaults,conf,tmux setlocal foldmethod=expr foldexpr=FoldConfig() foldtext=TextFold() foldlevel=0 foldenable

" ===== PRESETS
syntax on
colorscheme dracula
let mapleader = " "

" Save
nnoremap <leader>s :w<CR>
" Close without save
nnoremap <leader>Q :q!<CR>
" Close
nnoremap <leader>q :q<CR>
" No Highlights
nnoremap <leader>; :nohls<CR>
" Reload VIM
nnoremap <C-r> :source ~/.vimrc<CR>
" Toggle Fold
noremap <leader><leader> za
" ===== AIRLINES
let g:airline_powerline_fonts = 1
let g:airline_theme='cool'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
" function
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '>>'
"let g:airline_left_sep = '▶'
let g:airline_right_sep = '<<'
"let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = '㏑'

" ===== PLUGINS
"StartVimPlug
call plug#begin()
	Plug 'StanAngeloff/php.vim'
	Plug 'dracula/vim', { 'as': 'dracula' }
	Plug 'tpope/vim-commentary'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'vim-airline/vim-airline'
	Plug 'majutsushi/tagbar'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'flazz/vim-colorschemes'
call plug#end()
"End Vim Plug

" ===== SETS
set number
set numberwidth=4
" set relativenumber
" search
set hlsearch
set ignorecase
set incsearch
" show typed cmd
set showcmd
set autoindent
set encoding=UTF-8
" set history change
set undodir=~/.vim/undodir
set undofile
" highlight current line
" set cursorline
" draw screen config
" set lazyredraw
" set redrawtime=10000
" tab config
" set tabstop=3
" set shiftwidth=3
" set softtabstop=3
" set noexpandtab
" show matching curly, paren or bracket
" set showmatch
" set splitbelow splitright
" :find [file]
set path+=**
" show nice menu on command mode
" set wildmenu
" show tabs and spaces
set list
set listchars=tab:▸\ ,trail:•
" complete
" set omnifunc=syntaxcomplete#Complete
" set completeopt=menu,longest
" set complete=.,w,b,u,t,i
" fold
"set foldmethod=syntax
" set nofoldenable
" set foldlevel=2
" remove esc delay
" set timeoutlen=1000 ttimeoutlen=0
" fix backspace
set backspace=indent,eol,start
set backspace=2
set tags=tags,.tags;
" remove backup and swap files
set nobackup
set nowritebackup
set noswapfile
" enable mouse
" set mouse=a
" better colors and cursor
" set t_Co=256
" set guicursor=
" if &t_Co >= 256 || has("gui_running")
	" let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
	" let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
	" if (has("termguicolors"))
		" set termguicolors
	" endif
" endif
" better diff
" set diffopt=vertical,filler,foldcolumn:1
" if has('nvim-0.3.2') || has("patch-8.1.0360")
	" set diffopt+=internal,algorithm:patience,indent-heuristic
" endif
" html indent
" let g:html_indent_script1 = "inc"
" let g:html_indent_style1 = "inc"
" PHP Generated Code Highlights (HTML & SQL)
" let php_sql_query=1
" let php_htmlInStrings=1
