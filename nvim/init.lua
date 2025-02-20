-- Highlight settings
vim.cmd("hi LineNr guifg=#ffffff")

require("config.lazy")

-- {{{ Basic Settings
vim.opt.compatible = false
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.title = true
vim.opt.titlestring = "%{fnamemodify(getcwd(),':t')}/%t"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.concealcursor = "nc"

vim.opt.number = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.ttyfast = true
vim.opt.modifiable = true
vim.opt.foldmethod = "marker"
vim.opt.wrap = false
vim.opt.splitright = true

vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")
-- }}}

-- {{{ Global Variables
vim.g.vimtex_view_method = "zathura"
vim.g.python3_host_prog = vim.fn.expand("~/.micromamba/envs/qtab/bin/python3")
vim.g.shfmt_opt = "-ci"
vim.g.latexindent_opt = "-m"

vim.g.vimwiki_list = {{
    path = "~/notes/",
    syntax = "markdown",
    ext = "md"
}}
vim.g.vimwiki_global_ext = 0
-- vim.cmd("colorscheme nightfox")
-- }}}

-- {{{ Keybinds
vim.g.maplocalleader = "\\"

vim.api.nvim_set_keymap("i", "<C-j>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-k>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", ":m +1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", ":m -2<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })

-- File managers
vim.api.nvim_set_keymap("n", "<C-e>", ":Xplr<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-t>", ":NERDTreeToggle<CR>", { noremap = true, silent = true })

vim.cmd([[
command -nargs=1 PythonEnv let g:python3_host_prog = expand("~/.micromamba/envs/<args>/bin/python3")
]])
-- }}}
