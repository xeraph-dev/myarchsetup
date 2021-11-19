syntax enable
filetype plugin indent on 

set number 
set mouse=a 
set numberwidth=1 
set clipboard=unnamed 
set showcmd 
set ruler 
set encoding=utf-8 
set showmatch 
set sw=2 
set relativenumber 
set laststatus=2 
set noerrorbells 
set expandtab 
set smartindent 
set nowrap 
set noswapfile 
set incsearch 
set ignorecase

call plug#begin('~/.vim/plugged') 

" Themes 
Plug 'rakr/vim-one'
Plug 'ryanoasis/vim-devicons' 
Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes' 

" IDE 
Plug 'easymotion/vim-easymotion' 
Plug 'scrooloose/nerdtree' 
Plug 'christoomey/vim-tmux-navigator' 
Plug 'neoclide/coc.nvim', {'branch': 'release'} 
Plug 'jiangmiao/auto-pairs' 
Plug 'wfxr/minimap.vim' 
Plug 'editorconfig/editorconfig-vim' 
Plug 'ervandew/supertab' 
" Haskell 
Plug 'neovimhaskell/haskell-vim' 
" JavaScript 
Plug 'pangloss/vim-javascript' 
Plug 'leafgarland/typescript-vim' 
Plug 'peitalin/vim-jsx-typescript' 

call plug#end() 

if (has("termguicolors")) 
  set termguicolors 
endif 

if &term == "alacritty"        
    let &term = "xterm-256color"
endif

colorscheme one 
set background=dark 
hi Normal guibg=NONE ctermbg=NONE
let t:is_transparent = 1
let g:one_allow_italics=1 

let g:airline_powerline_fonts=1 
let g:airline#extensions#tabline#enabled = 1 
let g:airline_theme='onedark' 
let g:airline#extensions#tabline#buffer_nr_show = 1 

let g:webdevicons_enable_nerdtree=1 
let g:webdevicons_conceal_nerdtree_brackets=1 

let g:minimap_width = 10 
let g:minimap_auto_start = 1 
let g:minimap_auto_start_win_enter = 1 
let g:minimap_highlight='Visual'

let NERDTreeQuitOnOpen=1

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*'] 

let g:haskell_enable_quantification = 1 " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1 " to enable highlighting of `mdo` and `rec` 
let g:haskell_enable_arrowsyntax = 1 " to enable highlighting of `proc` 
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern` 
let g:haskell_enable_typeroles = 1 " to enable highlighting of type roles 
let g:haskell_enable_static_pointers = 1 " to enable highlighting of `static` 
let g:haskell_backpack = 1 " to enable highlighting of backpack keywords

let g:javascript_plugin_jsdoc = 1

let mapleader=" "

nmap <Leader>s <Plug>(easymotion-s2)

nmap <Leader>nt :NERDTreeFind<CR>

nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>sr :source %<CR>

nmap <Leader>l <Plug>AirlineSelectNextTab
nmap <Leader>h <Plug>AirlineSelectPrevTab

nmap <Leader>bd :bd<CR>
