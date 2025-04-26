return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
        opts = require "configs.conform",
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- Adds Better LuaLS Functionality in Nvim
            { "folke/neodev.nvim", opts = {} },
        },
        config = function()
            require "configs.lspconfig"
        end,
    },

    {
        -- LSP Manager
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "lua-language-server",
                "stylua",
                "clangd",
                "clang-format",
            },
        },
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

    {
        "rmagatti/auto-session",
        lazy = false,
        opts = {
            suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
            -- log_level = 'debug',
        },
    },

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
