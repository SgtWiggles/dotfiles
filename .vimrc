set shell=/bin/bash
set rtp+=~/.vim/bundle/Vundle.vim
set encoding=utf-8

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

if has('nvim')
	Plugin 'Shougo/deoplete.nvim'
else 
	Plugin 'Shougo/deoplete.nvim'
	Plugin 'roxma/nvim-yarp'
	Plugin 'roxma/vim-hug-neovim-rpc'
endif

"Plugin 'Shougo/neoinclude.vim'
Plugin 'autozimu/LanguageClient-neovim'

Plugin 'NLKNguyen/papercolor-theme'
Plugin 'chriskempson/base16-vim'
Plugin 'miyakogi/seiya.vim'

Plugin 'tylerbrazier/vim-bracepair'
Plugin 'rhysd/clever-f.vim'
Plugin 'nelstrom/vim-visual-star-search'


Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdcommenter'

Plugin 'airblade/vim-gitgutter'

Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-repeat'

Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'

Plugin 'ludovicchabant/vim-gutentags'

Plugin 'vim-scripts/syntaxm4.vim'

Plugin 'dansomething/vim-eclim'

Plugin 'justinmk/vim-dirvish'
Plugin 'bounceme/remote-viewer'

Plugin 'lervag/vimtex'
Plugin 'xuhdev/vim-latex-live-preview'

Plugin 'pangloss/vim-javascript'
Plugin 'igankevich/mesonic'

call vundle#end()

set nocompatible
let &rtp  = '~/.vim/bundle/vimtex,' . &rtp
let &rtp .= ',~/.vim/bundle/vimtex/after'

let mapleader=" "

filetype plugin indent on
set t_Co=256


"Theme
source ~/.vimcolors
colorscheme PaperColor
nnoremap <leader>pn :set bg=dark<CR>:AirlineTheme violet<CR>
nnoremap <leader>pd :set bg=light<CR>:AirlineTheme papercolor<CR>

set hlsearch
nnoremap <silent> <leader>noh :noh<CR>

syntax on
highlight clear SignColumn

set backspace=indent,eol,start

set timeout timeoutlen=200 ttimeoutlen=200

set tabstop=2
set shiftwidth=2
set softtabstop=0

set noexpandtab
autocmd Filetype haskell set expandtab
autocmd Filetype haskell set tabstop=8
set list lcs=tab:\¦\ "needs the space

filetype plugin on
set omnifunc=syntaxcomplete#Complete

set clipboard=unnamedplus
"set completeopt-=preview

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


"Plugin: Airline
"Airline: Formatting Settings
let g:airline_section_c = '%02n: %F'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
			\ '0': '0: ',
			\ '1': '1: ',
			\ '2': '2: ',
			\ '3': '3: ',
			\ '4': '4: ',
			\ '5': '5: ',
			\ '6': '6: ',
			\ '7': '7: ',
			\ '8': '8: ',
			\ '9': '9: '}
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab10
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab
nnoremap <leader>b :ls<CR>:b
nnoremap <leader>q :bw<CR>
nmap <leader>k <Plug>AirlineSelectNextTab
nmap <leader>j <Plug>AirlineSelectPrevTab

nnoremap <C-n> :%s///g<left><left>
vnoremap <C-n> *:%s///g<left><left>

set scrolloff=10

if !has("gui_running")
	noremap! <C-BS> <C-w>
	noremap! <C-h> <C-w>
endif


" Folds
"nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
"vnoremap <Space> zf

" Splits management
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

noremap <C-e><C-v> :vsplit<CR>:Dirvish %<CR>
noremap <C-e><C-h> :split<CR>:Dirvish %<CR>
nnoremap <C-w><C-w> :sp
nnoremap <C-w><C-v> :vsp


" Saving and loading
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>

" Java
"autocmd Filetype java nnoremap <C-s> :%JavaFormat<CR> :w<CR>
"autocmd Filetype java inoremap <C-s> <Esc> :%JavaFormat<CR> :w <CR>
"autocmd Filetype java nnoremap <C-D> :JavaDocComment<CR>
let g:EclimCompletionMethod = 'omnifunc'

" Reload vimrc
nnoremap <F12> :source ~/.vimrc<CR>


" Plugin: Clang Format
"let g:clang_format#code_style = "LLVM"
"let g:clang_format#style_options = {
"			\"AccessModifierOffset": -4,
"			\"AllowShortBlocksOnASingleLine": "false",
"			\"AllowShortFunctionsOnASingleLine": "None",
"			\"AllowShortIfStatementsOnASingleLine": "false",
"			\"AllowShortLoopsOnASingleLine": "false",
"			\"BreakBeforeBinaryOperators": "false",
"			\"BreakBeforeBraces": "Attach",
"			\"BreakAfterJavaFieldAnnotations": "true",
"			\"ColumnLimit": 120 ,
"			\"IndentCaseLabels": "true",
"			\"IndentWidth": 2,
"			\"MaxEmptyLinesToKeep": 1,
"			\"SpaceBeforeAssignmentOperators":"true",
"			\"SpaceBeforeParens": "ControlStatements",
"			\"SpacesInParentheses": "false",
"			\"TabWidth": 2,
"			\"UseTab": "Always"
"			\ }
"
"let g:clang_format#auto_format=1
"let g:clang_format#detect_style_file=1

"Plugin: Gitgutter
"let g:gitgutter_realtime = 1
"let g:gitgutter_eager = 1


"Plugin: FZF file search
function! FindGitRoot()
	let tmp = system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
	echom tmp
  return tmp
endfunction
command! ProjectFiles execute 'Files' . FindGitRoot()
" nnoremap <silent> <leader><leader> :Files <C-R>=expand('%:h')<CR><CR>
nnoremap <silent> <leader><leader> :ProjectFiles<CR>

inoremap <C-p><Esc> :Files<CR>
nnoremap <C-p> :Files<CR>

"LangaugeClient: 
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'c': ['ccls', '--log-file=/tmp/cc.log'],
    \ 'cpp': ['ccls', '--log-file=/tmp/cc.log'],
    \ 'cuda': ['ccls', '--log-file=/tmp/cc.log'],
    \ 'objc': ['ccls', '--log-file=/tmp/cc.log'],
    \ }
let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_loadSettings = 1 
let g:LanguageClient_settingsPath = '~/.config/nvim/settings.json'
let g:LanguageClient_hasSnippetSupport = 0
augroup LanguageClient_config
	autocmd!
	autocmd BufEnter * let b:Plugin_LanguageClient_started = 0
	autocmd User LanguageClientStarted let b:Plugin_LanguageClient_started = 1
	autocmd User LanguageClientStopped let b:Plugin_LanguageClient_stopped = 0
	autocmd CursorMoved * if b:Plugin_LanguageClient_started | sil call LanguageClient#textDocument_documentHighlight() | endif
augroup END
function! C_init()
  setl formatexpr=LanguageClient#textDocument_rangeFormatting()
endfunction
autocmd FileType c,cpp,cuda,objc :call C_init()
nnoremap <silent> <leader>d :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <leader>R :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <leader>r :call LanguageClient#textDocument_references({'includeDeclaration': v:true})<CR>
nnoremap <silent> <leader>i :call LanguageClient#textDocument_hover()<CR>

function! LC_maps()
	if has_key(g:LanguageClient_serverCommands, &filetype)
		autocmd BufWritePre * call LanguageClient_textDocument_formatting()
	endif
endfunction

highlight ALEWarning ctermbg=Yellow 
highlight ALEError ctermbg=LightRed
highlight ALEWarning ctermbg=Yellow 
highlight ALEErrorSign ctermbg=Red

augroup RunBuffer
	autocmd!
	autocmd BufReadPost,FileReadPost * call LC_maps()
augroup end
let g:LanguageClient_diagnosticsDisplay = {
    	\    1: {
    	\        "name": "Error",
    	\        "texthl": "ALEError",
    	\        "signText": "e",
    	\        "signTexthl": "ALEErrorSign",
    	\    },
    	\    2: {
    	\        "name": "Warning",
    	\        "texthl": "ALEWarning",
    	\        "signText": "w",
    	\        "signTexthl": "ALEWarningSign",
    	\    },
    	\    3: {
    	\        "name": "Information",
    	\        "texthl": "ALEInfo",
    	\        "signText": "i",
    	\        "signTexthl": "ALEInfoSign",
    	\    },
    	\    4: {
    	\        "name": "Hint",
    	\        "texthl": "ALEInfo",
    	\        "signText": "h",
    	\        "signTexthl": "ALEInfoSign",
    	\    },
    	\}



"Deoplete: 
let g:deoplete#enable_at_startup = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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

"if !exists('g:ycm_semantic_triggers')
"	let g:ycm_semantic_triggers = {}
"endif
"let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme
"qpdfviewer plugin for forward search
"let g:vimtex_fold_enabled=1

