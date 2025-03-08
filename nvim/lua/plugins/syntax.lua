return {
    "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
        ensure_installed = { "c", "cpp", "lua", "python" }, -- Add other languages if needed
        highlight = { enable = true },
        indent = { enable = false }, -- Enables Tree-sitter indentation
    },
    { "lervag/vimtex" },
}
