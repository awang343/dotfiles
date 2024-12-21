" This line makes pacman-installed global Arch Linux vim packages work.
source /usr/share/nvim/archlinux.lua
set nocompatible            " disable compatibility to old-time vi

set ignorecase              " case insensitive 
set hlsearch                " highlight search 
set incsearch               " incremental search

set tabstop=4              " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set shiftwidth=4            " width for autoindents
set smarttab
set expandtab               " converts tabs to white space
set autoindent              " indent a new line the same amount as the line just typed

set number
set clipboard+=unnamedplus   " using system clipboard
set ttyfast                 " Speed up scrolling in Vim
set modifiable              " Make buffers modifiable
set foldmethod=marker
set nowrap
set splitright

let g:vimtex_view_method = 'zathura'
let g:vimwiki_list = [{'path': '~/notes/', 'syntax': 'markdown', 'ext':'md', 'diary_rel_path': 'daily-notes', 'listsyms': ' ○◐●✓'}]
let g:python3_host_prog = expand("~/.micromamba/envs/qtab/bin/python")

filetype plugin indent on

call plug#begin("~/.vim/plugged")
    Plug 'is0n/fm-nvim'
    Plug 'vimwiki/vimwiki'
    Plug 'preservim/nerdtree'
    
    " Syntax highlighting
    Plug 'tikhomirov/vim-glsl'
    Plug 'Vimjas/vim-python-pep8-indent'
    Plug 'lervag/vimtex'

    " Functionality
    Plug 'tpope/vim-commentary'
    Plug 'leafOfTree/vim-matchtag'
    Plug 'jiangmiao/auto-pairs'
    Plug 'benlubas/molten-nvim', { 'do': ':UpdateRemotePlugins' }

    " Visuals
    Plug 'NvChad/nvim-colorizer.lua'
    Plug 'ellisonleao/gruvbox.nvim'
    Plug 'comfysage/evergarden'
    Plug 'EdenEast/nightfox.nvim'
    Plug 'ryanoasis/vim-devicons'
call plug#end()

syntax on                   " syntax highlighting


lua require 'colorizer'.setup {filetypes = { "*" }, user_default_options = { rgb_fn = true; }}
lua require 'gruvbox'.setup {transparent_mode = true}
lua require 'evergarden'.setup {transparent_background = true, contrast_dark=soft}
lua require 'nightfox'.setup {options = {transparent = true}}
colorscheme carbonfox 

hi LineNr guifg=#ffffff

" keybinds
" move line or visually selected block - alt+j/k
let maplocalleader = "\\"

inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
nnoremap <C-j> :m +1<CR>
nnoremap <C-k> :m -2<CR>

vnoremap > >gv
vnoremap < <gv

" nerdtree
nnoremap <C-e> :Xplr<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
