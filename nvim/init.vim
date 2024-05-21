" This line makes pacman-installed global Arch Linux vim packages work.
source /usr/share/nvim/archlinux.vim

set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=2              " number of columns occupied by a tab 
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set smarttab
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set relativenumber
syntax on                   " syntax highlighting
set clipboard+=unnamedplus   " using system clipboard
set ttyfast                 " Speed up scrolling in Vim
set termguicolors
set ma
set foldmethod=marker
set nowrap

call plug#begin("~/.vim/plugged")
 " Plugin Section
 Plug 'tikhomirov/vim-glsl'
 Plug 'leafOfTree/vim-matchtag'
 Plug 'ryanoasis/vim-devicons'
 Plug 'honza/vim-snippets'
 Plug 'scrooloose/nerdtree'
 Plug 'tpope/vim-commentary'
 Plug 'mhinz/vim-startify'
 Plug 'NvChad/nvim-colorizer.lua'
 Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
 Plug 'ellisonleao/gruvbox.nvim'
 Plug 'folke/tokyonight.nvim'
 Plug 'lervag/vimtex'
call plug#end()

lua require 'colorizer'.setup {filetypes = { "*" }, user_default_options = { rgb_fn = true; }}

" let g:moonflyTransparent = v:true
lua require 'gruvbox'.setup {transparent_mode = true}
colorscheme gruvbox

" colorscheme synthwave84

" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'
" let g:livepreview_previewer = 'zathura'
" Or with a generic interface:
" let g:vimtex_view_general_viewer = 'okular'
" let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
" let g:vimtex_compiler_method = 'latexrun'
" let g:vimtex_compiler_latexmk_engines = {
"     \ '_'                : '-xelatex',
"     \}
" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
" let maplocalleader = ","

" set conceallevel=1
" let g:tex_conceal='abdmg'

hi LineNr guifg=#ffffff

" keybinds
" move line or visually selected block - alt+j/k
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
nnoremap <C-j> :m +1<CR>
nnoremap <C-k> :m -2<CR>

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
