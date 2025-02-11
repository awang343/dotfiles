return {
    -- File manager stuff
    { "is0n/fm-nvim" },
    { "preservim/nerdtree" },

    -- Syntax highlighting
    { "lervag/vimtex" },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    -- Functionality
    { "vimwiki/vimwiki" },
    { "tpope/vim-commentary" },
    { "jiangmiao/auto-pairs" },
    { "benlubas/molten-nvim", build = ":UpdateRemotePlugins" },
    { "sbdchd/neoformat" },

    -- Visuals
    { 
        "NvChad/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({
                filetypes = { "*" },
                user_default_options = { rgb_fn = true }
            })
        end
    },
    { 
        "EdenEast/nightfox.nvim",
        config = function()
            require("nightfox").setup({
                options = { transparent = true }
            })
        end
    },
    { "ryanoasis/vim-devicons" },
}
