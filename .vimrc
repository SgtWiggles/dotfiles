set shell=/bin/bash 
set rtp+=~/.vim/bundle/Vundle.vim 
set rtp+=/usr/bin/fzf 

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'NLKNguyen/papercolor-theme'

Plugin 'tylerbrazier/vim-bracepair'
Plugin 'dansomething/vim-eclim'
Plugin 'rhysd/vim-clang-format'

Plugin 'dracula/vim'

Plugin 'Yggdroot/indentLine'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'junegunn/fzf.vim'
Plugin 'flazz/vim-colorschemes'
"Plugin 'twe4ked/vim-colorscheme-switcher'
Plugin 'scrooloose/nerdcommenter'

Plugin 'airblade/vim-gitgutter'
"Plugin 'tpope/vim-fugitive'

Plugin 'lervag/vimtex'
Plugin 'rhysd/vim-grammarous'
call vundle#end() 


filetype plugin indent on
set t_Co=256

syntax on
highlight clear SignColumn

set backspace=indent,eol,start

set timeout timeoutlen=200 ttimeoutlen=200

set tabstop=2
set shiftwidth=2

set clipboard=unnamedplus
set completeopt-=preview

set number
set cursorline

set ignorecase
set smartcase

"Theme
if strftime("%H") < 7 || strftime("%H") >= 19
	set background=dark
	colorscheme dracula
else
	set background=light
	colorscheme PaperColor
endif

"Keyboard bindings
map <F11> :setlocal spell! spelllang=en_us<CR>

" Movement keys
nnoremap J 10j
nnoremap K 10k
nnoremap L w
nnoremap H b

vnoremap J 10j
vnoremap K 10k
vnoremap L w
vnoremap H b

imap <C-BS> <C-W>

if !has("gui_running")
	noremap! <C-BS> <C-w>
	noremap! <C-h> <C-w>
endif

let mapleader=" "

"  Splits management
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
noremap <C-e> :Ex<CR>
noremap <C-e><C-v> :Vex<CR>
noremap <C-e><C-h> :Hex<CR>

" Saving and loading
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc> :w<CR>

"autocmd Filetype java nnoremap <C-s> :%JavaFormat<CR> :w<CR>
"autocmd Filetype java inoremap <C-s> <Esc> :%JavaFormat<CR> :w <CR>
autocmd Filetype java nnoremap <C-D> :JavaDocComment<CR>

" Reload vimrc
nnoremap <F12> :source ~/.vimrc<CR>

" Palette search
inoremap <C-p><Esc> :Lines<CR> 
nnoremap <C-p> :Lines<CR>

"Plugin: Clang Format 
let g:clang_format#code_style = "chromium"
let g:clang_format#style_options = {
			\"AccessModifierOffset": -4											 , 
			\"AllowShortBlocksOnASingleLine": "false",
			\"AllowShortFunctionsOnASingleLine": "None",
			\"AllowShortIfStatementsOnASingleLine": "false",
			\"AllowShortLoopsOnASingleLine": "false",
			\"BreakBeforeBinaryOperators": "false",
			\"BreakBeforeBraces": "Attach",
			\"BreakAfterJavaFieldAnnotations": "true",
			\"ColumnLimit": 120 ,
			\"IndentCaseLabels": "true",
			\"IndentWidth": 4,
			\"MaxEmptyLinesToKeep": 1,
			\"SpaceBeforeAssignmentOperators":"true",
			\"SpaceBeforeParens": "ControlStatements",
			\"SpacesInParentheses": "false",
			\"TabWidth": 4,
			\"UseTab": "Always"
			\ }

let g:clang_format#auto_format=1

"Plugin: Gitgutter
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1

"Plugin: Airline
let g:airline_theme = 'lucius'

"Plugin: Eclim
let g:EclimCompletionMethod = 'omnifunc'

"Plugin: Indent Line
let g:indentLine_enabled = 1
let g:indentLine_char = '|'

