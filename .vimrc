set shell=/bin/bash
set rtp+=~/.vim/bundle/Vundle.vim 
set rtp+=/usr/bin/fzf 

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'miyakogi/seiya.vim'

Plugin 'tylerbrazier/vim-bracepair'
"Plugin 'dansomething/vim-eclim'
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
Plugin 'tpope/vim-vinegar'

Plugin 'rdnetto/YCM-Generator'
Plugin 'ludovicchabant/vim-gutentags'

Plugin 'ARM9/arm-syntax-vim'

Plugin 'rust-lang/rust.vim'

Plugin 'godlygeek/tabular'
Plugin 'philj56/vim-asm-indent'

Plugin 'dansomething/vim-eclim'
Plugin 'justinmk/vim-dirvish'
"Plugin 'francoiscabrol/ranger.vim'

"Plugin 'vim-latex/vim-latex'
Plugin 'lervag/vimtex'
Plugin 'xuhdev/vim-latex-live-preview'
"Plugin 'rhysd/vim-grammarous'
call vundle#end()

set nocompatible
let &rtp  = '~/.vim/bundle/vimtex,' . &rtp
let &rtp .= ',~/.vim/bundle/vimtex/after'

filetype plugin indent on
set t_Co=256

"Theme
if strftime("%H") < 7 || strftime("%H") >= 19
	"//set background=dark
	"//colorscheme dracula
	set background=light
	colorscheme PaperColor
else
	set background=light
	colorscheme PaperColor
endif

syntax on
highlight clear SignColumn

set backspace=indent,eol,start

set timeout timeoutlen=200 ttimeoutlen=200


set tabstop=2
set shiftwidth=2
set softtabstop=0

set noexpandtab
set list lcs=tab:\¦\ "needs the space

set clipboard=unnamedplus
set completeopt-=preview

set number
set cursorline
let g:seiya_auto_enable=1

set ignorecase
set smartcase


"Keyboard bindings
map <F11> :setlocal spell! spelllang=en_us<CR>

"Movement keys
nnoremap J 10j
nnoremap K 10k
nnoremap L w
nnoremap H b

vnoremap J 10j
vnoremap K 10k
vnoremap L w
vnoremap H b

set scrolloff=10

noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

if !has("gui_running")
	noremap! <C-BS> <C-w>
	noremap! <C-h> <C-w>
endif

let mapleader=" "

"  Splits management

 let g:loaded_netrwPlugin = 1
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
noremap <C-e><C-v> :vsplit<CR>:Dirvish %<CR>
noremap <C-e><C-h> :split<CR>:Dirvish %<CR>

" Saving and loading
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc> :w<CR>

"autocmd Filetype java nnoremap <C-s> :%JavaFormat<CR> :w<CR>
"autocmd Filetype java inoremap <C-s> <Esc> :%JavaFormat<CR> :w <CR>
"autocmd Filetype java nnoremap <C-D> :JavaDocComment<CR>
let g:EclimCompletionMethod = 'omnifunc'

" Reload vimrc
nnoremap <F12> :source ~/.vimrc<CR>

" Palette search
inoremap <C-p><Esc> :Files<CR> 
nnoremap <C-p> :Files<CR>

"Plugin: Clang Format 
let g:clang_format#code_style = "llvm"
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
			\"IndentWidth": 2,
			\"MaxEmptyLinesToKeep": 1,
			\"SpaceBeforeAssignmentOperators":"true",
			\"SpaceBeforeParens": "ControlStatements",
			\"SpacesInParentheses": "false",
			\"TabWidth": 2,
			\"UseTab": "Always"
			\ }

let g:clang_format#auto_format=1

"Plugin: Gitgutter
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1

"Plugin: Airline
let g:airline_theme = 'lucius'

"Plugin: Eclim
"let g:EclimCompletionMethod = 'omnifunc'

"Plugin: Indent Line
"let g:indentLine_enabled = 1
"let g:indentLine_char = '|'
"j


"Plugin: FZF file search
nnoremap <silent> <Leader><Leader> :Files <C-R>=expand('%:h')<CR><CR>

"Plugin: YCM
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"
function! TrimWhiteSpace()
	%s/\s*$//
	''
	normal! mzgg=G`z
	normal! zz
endfunction

" autocmd BufWritePre *.lua silent call TrimWhiteSpace()
" autocmd FileWritePre * call TrimWhiteSpace()
" autocmd FileAppendPre * call TrimWhiteSpace()
" autocmd FilterWritePre * call TrimWhiteSpace()

map <F2> :silent call TrimWhiteSpace()<CR>
map <F1> mzgg=G`z

"Rust: rust settings
let g:rustfmt_autosave = 1
let g:rust_recommended_style = 0
"autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
"autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!
"autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
"
"LaTex: LaTex settings
let g:livepreview_previewer = 'zathura'
let g:tex_flavor = "latex"
let g:vimtex_latexmk_callback = 1
let g:vimtex_latexmk_continuous = 0
let g:vimtex_quickfix_ignore_all_warnings=0 
let g:vimtex_quickfix=2 
let g:vimtex_fold_automatic=0 
let g:tex_fast = "bMpr"
let g:tex_conceal = ""

if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
  endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme
"qpdfviewer plugin for forward search 
"let g:vimtex_fold_enabled=1

