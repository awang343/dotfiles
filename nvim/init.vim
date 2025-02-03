" This line makes pacman-installed global Arch Linux vim packages work.
source /usr/share/nvim/archlinux.lua

" {{{ Basic Settings
set nocompatible            " disable compatibility to old-time vi

set ignorecase              " case insensitive 
set hlsearch                " highlight search 
set incsearch               " incremental search
set title
set titlestring=%{fnamemodify(getcwd(),':t')}/%t

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
set splitright"}}}

let g:vimtex_view_method = 'zathura'
let g:python3_host_prog = expand("~/.micromamba/envs/qtab/bin/python3")
let g:shfmt_opt="-ci"
let g:latexindent_opt="-m"

" Define a custom command to set g:python3_host_prog with a dynamic path
command -nargs=1 PythonEnv let g:python3_host_prog = expand("~/.micromamba/envs/<args>/bin/python3")

hi LineNr guifg=#ffffff

filetype plugin indent on
syntax on

" {{{ Plugins
call plug#begin("~/.vim/plugged")
    Plug 'is0n/fm-nvim'
    Plug 'preservim/nerdtree'

    " Syntax highlighting
    Plug 'tikhomirov/vim-glsl'
    Plug 'Vimjas/vim-python-pep8-indent'
    Plug 'lervag/vimtex'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " Functionality
    Plug 'tpope/vim-commentary'
    Plug 'leafOfTree/vim-matchtag'
    Plug 'jiangmiao/auto-pairs'
    Plug 'benlubas/molten-nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'sbdchd/neoformat'

    " Visuals
    Plug 'NvChad/nvim-colorizer.lua'
    Plug 'EdenEast/nightfox.nvim'
    Plug 'ryanoasis/vim-devicons'
call plug#end()

lua require 'colorizer'.setup {filetypes = { "*" }, user_default_options = { rgb_fn = true; }}
" lua require 'gruvbox'.setup {transparent_mode = true}
" lua require 'evergarden'.setup {transparent_background = true, contrast_dark=soft}
lua require 'nightfox'.setup { options = { transparent = true } }
colorscheme carbonfox 

lua require 'nvim-treesitter.configs'.setup { ensure_installed = { "tsx", "typescript", "html", "javascript", "bash", "latex" },  highlight = { enable = true } }
autocmd BufWritePre *.js Neoformat

" }}}

"{{{ Keybinds
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
"}}}

"{{{ Tabline Setup
fu! MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let string = fnamemodify(bufname(buflist[winnr - 1]), ':t')
    return empty(string) ? '[unnamed]' : string
endfu

fu! MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
        " select the highlighting
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif

        " set the tab page number (for mouse clicks)
        "let s .= '%' . (i + 1) . 'T'
        " display tabnumber (for use with <count>gt, etc)
        let s .= ' '. (i+1) . ' ' 

        " the label is made by MyTabLabel()
        let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
	    let s ..= '%#TabLineFill#%T'
    endfor
    return s
endfu
set tabline=%!MyTabLine()
"}}}
