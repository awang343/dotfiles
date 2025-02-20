return {
    { "vimwiki/vimwiki" },
    { "tpope/vim-commentary" },
    { "jiangmiao/auto-pairs" },
    { "benlubas/molten-nvim", build = ":UpdateRemotePlugins" },
    { "sbdchd/neoformat" },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {
            modes = {
                char = {
                    enabled = false,
                }
            }
        },
        -- stylua: ignore
        keys = {
            { "f", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "F", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        },
    }
}
