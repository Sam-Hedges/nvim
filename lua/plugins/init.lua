return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
        opts = require "configs.conform",
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    {
        -- Sticky Scope
        "nvim-treesitter/nvim-treesitter-context",
        event = "BufEnter",
        config = function()
            require("treesitter-context").setup {
                enable = true,
                max_lines = 5,
            }
        end,
    },

    { "nvzone/volt", lazy = true },
    { "nvzone/menu", lazy = true },

    -- test new blink
    -- { import = "nvchad.blink.lazyspec" },

    -- {
    -- 	"nvim-treesitter/nvim-treesitter",
    -- 	opts = {
    -- 		ensure_installed = {
    -- 			"vim", "lua", "vimdoc",
    --      "html", "css"
    -- 		},
    -- 	},
    -- },
}
