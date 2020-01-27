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
nnoremap <silent> <leader>Q :q!<CR>
" Close
nnoremap <silent> <leader>q :q<CR>
" No Highlights
nnoremap <silent> <leader>; :nohls<CR>
" Reload VIM
nnoremap <silent> <leader>r :source ~/.vimrc<CR>:AirlineRefresh<CR>
" Toggle Fold
noremap <silent> <leader><leader> za
" CHANGE TABS
nnoremap <C-RIGHT> :tabnext<CR>
nnoremap <C-LEFT> :tabprev<CR>
" Snippet
nnoremap <leader>ue :UltiSnipsEdit<CR>
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

	" GIT
	Plug 'tpope/vim-fugitive'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'airblade/vim-gitgutter'
	" Plug Dracula
	Plug 'dracula/vim', { 'as': 'dracula' }
	" GCC
	Plug 'tpope/vim-commentary'
	" CTRL P
	Plug 'ctrlpvim/ctrlp.vim'
	" AIRLINE
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	" COLORSCHEMES
	Plug 'flazz/vim-colorschemes'
	" TAGS
	Plug 'majutsushi/tagbar'
	Plug 'ludovicchabant/vim-gutentags'
	" DRAGVISUALS
	Plug 'mariappan/dragvisuals.vim'
	" SCROLL
	Plug 'terryma/vim-smooth-scroll'
	" OTHER PLUGINS
	Plug 'suan/vim-instant-markdown'
	Plug 'vimwiki/vimwiki'
	Plug 'mattn/calendar-vim'
	Plug 'godlygeek/tabular'
	Plug 'christoomey/vim-system-copy'
	" Vim Snippet
	Plug 'sirver/ultisnips'
	Plug 'honza/vim-snippets'
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
set lazyredraw
set redrawtime=20000
" tab config
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
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
set timeoutlen=1000 ttimeoutlen=0
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

" ===== DRAGVISUALS
vmap <expr>  <LEFT>   DVB_Drag('left')
vmap <expr>  <RIGHT>  DVB_Drag('right')
vmap <expr>  <DOWN>   DVB_Drag('down')
vmap <expr>  <UP>     DVB_Drag('up')
vmap <expr>  D        DVB_Duplicate()
vmap <expr>  <C-H>   DVB_Drag('left')
vmap <expr>  <C-L>  DVB_Drag('right')
vmap <expr>  <C-J>   DVB_Drag('down')
vmap <expr>  <C-K>    DVB_Drag('up')

" ===== GUTENTAGS
let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.js', '*.json', '*.xml',
\ '*.phar', '*.ini', '*.rst', '*.md','*/vendor/*',
\ '*vendor/*/test*', '*vendor/*/Test*',
\ '*vendor/*/fixture*', '*vendor/*/Fixture*',
\ '*var/cache*', '*var/log*']
let g:gutentags_ctags_tagfile = ".tags"
let g:gutentags_project_root = ['tags', '.tags']
let g:gutentags_add_default_project_roots = 0

" ===== SCROLL

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 20, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 20, 4)<CR>

" ===== GIT GUTTER

set updatetime=100

" ===== VIM INSTANT MARKDOWN
let g:instant_markdown_autostart = 0

" ===== VIMWIKI
let index = {}
let index.path = '$NOTES_PATH/remote/'
let index.syntax = 'markdown'
let index.ext = '.md'

let local_notes = {}
let local_notes.path = '$NOTES_PATH/local/'
let local_notes.syntax = 'markdown'
let local_notes.ext = '.md'

let g:vimwiki_list = [index, local_notes]
let g:vimwiki_ext2syntax = {'.wiki': 'default', '.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" don't use wiki syntax on other .md files
" let g:vimwiki_global_ext = 0

" ===== VIM-COPY
let g:system_copy#copy_command='xclip -sel clipboard'
