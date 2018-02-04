set shell=/bin/bash 
set rtp+=~/.vim/bundle/Vundle.vim 
set rtp+=/usr/bin/fzf 

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'dracula/vim'

Plugin 'tylerbrazier/vim-bracepair'
Plugin 'dansomething/vim-eclim'
Plugin 'rhysd/vim-clang-format'

Plugin 'Yggdroot/indentLine'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'junegunn/fzf.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'nightsense/seabird'
"Plugin 'twe4ked/vim-colorscheme-switcher'
"Plugin 'scrooloose/nerdcommenter'

Plugin 'airblade/vim-gitgutter'
"Plugin 'tpope/vim-fugitive'

Plugin 'lervag/vimtex'
Plugin 'rhysd/vim-grammarous'


call vundle#end() 

filetype plugin indent on
set t_Co=256
syntax on
colorscheme PaperColor
set background=light

highlight clear SignColumn
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1

let g:airline_theme = 'lucius'

let g:EclimCompletionMethod = 'omnifunc'
let g:indentLine_char = '|'

let g:clang_format#code_style = "mozilla"
let g:clang_format#auto_format=0

filetype plugin indent on
set tabstop=2
set shiftwidth=2
set clipboard=unnamedplus
set completeopt-=preview
set number
set cursorline
set timeout timeoutlen=200 ttimeoutlen=200

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

autocmd Filetype java nnoremap <C-s> :%JavaFormat<CR> :w<CR>
autocmd Filetype java inoremap <C-s> <Esc> :%JavaFormat<CR> :w <CR>
autocmd Filetype java nnoremap <C-D> :JavaDocComment<CR>

" Reload vimrc
nnoremap <F12> :source ~/.vimrc<CR>

" Palette search
inoremap <C-p><Esc> :Lines<CR> 
nnoremap <C-p> :Lines<CR>

if strftime("%H") < 7 || strftime("%H") >= 19
  let themes = [
     \ 'vimspectr0-dark'   , 'vimspectr0-dark'    , 'vimspectr30-dark'  ,
     \ 'vimspectr60-dark'  , 'vimspectr90-dark'   , 'vimspectr120-dark' ,
     \ 'vimspectr150-dark' , 'vimspectr180-dark'  , 'vimspectr210-dark' ,
     \ 'vimspectr240-dark' , 'vimspectr270-dark'  , 'vimspectr300-dark' ,
     \ 'vimspectr330-dark' , 'vimspectrgrey-dark'
     \ ]
else
  let themes = [
    \ 'vimspectr0-light'  , 'vimspectr0-light'   , 'vimspectr30-light' ,
    \ 'vimspectr60-light' , 'vimspectr90-light'  , 'vimspectr120-light',
    \ 'vimspectr150-light', 'vimspectr180-light' , 'vimspectr210-light',
    \ 'vimspectr240-light', 'vimspectr270-light' , 'vimspectr300-light',
    \ 'vimspectr330-light', 'vimspectrgrey-light'
    \ ]
endif
exe 'colorscheme '.themes[localtime() % len(themes)]
