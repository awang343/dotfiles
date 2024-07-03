" This line makes pacman-installed global Arch Linux vim packages work.
source /usr/share/nvim/archlinux.lua

set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set hlsearch                " highlight search 
set incsearch               " incremental search

set tabstop=4              " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set smarttab
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed

set relativenumber
set clipboard+=unnamedplus   " using system clipboard
set ttyfast                 " Speed up scrolling in Vim
set ma
set foldmethod=marker
set nowrap
set splitright

syntax on                   " syntax highlighting

call plug#begin("~/.vim/plugged")
 " Syntax highlighting
 Plug 'tikhomirov/vim-glsl'
 Plug 'Vimjas/vim-python-pep8-indent'
 Plug 'lervag/vimtex'

 " Functionality
 Plug 'tpope/vim-commentary'
 Plug 'leafOfTree/vim-matchtag'
 Plug 'honza/vim-snippets'
 Plug 'scrooloose/nerdtree'

 " Visuals
 Plug 'NvChad/nvim-colorizer.lua'
 Plug 'ellisonleao/gruvbox.nvim'
 Plug 'ryanoasis/vim-devicons'
call plug#end()

lua require 'colorizer'.setup {filetypes = { "*" }, user_default_options = { rgb_fn = true; }}
lua require 'gruvbox'.setup {transparent_mode = true}
colorscheme gruvbox

hi LineNr guifg=#ffffff

" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on
let g:vimtex_view_method = 'zathura'

let mapleader = " "
let maplocalleader = "\\"

" keybinds
" move line or visually selected block - alt+j/k
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
nnoremap <C-j> :m +1<CR>
nnoremap <C-k> :m -2<CR>

" nerdtree
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" vim-powered terminal in split window
tnoremap <Esc> <C-u>exit<CR>:sleep 50m<CR>
