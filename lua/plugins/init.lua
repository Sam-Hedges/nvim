return {
    {
        "rmagatti/auto-session",
        lazy = false,
        -- Ensure it loads before most other plugins
        -- To stop nvchad ui from shitting itself
        -- Might throw errors again if loading huge buffers
        priority = 1000,
        opts = {
            suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
            -- log_level = 'debug',
        },
    },

    {
        "nvchad/ui",
        config = function()
            require "nvchad"
        end,
    },

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

    -- test new blink
    -- { import = "nvchad.blink.lazyspec" },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim",
                "lua",
                "vimdoc",
                "html",
                "css",
                "cpp",
                "comment",
            },
        },
    },

    {
        "m4xshen/hardtime.nvim",
        lazy = false,
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {
            disable_mouse = false,
            restriction_mode = "hint",
            disabled_keys = {
                ["<Up>"] = {},
                ["<Down>"] = {},
                ["<Left>"] = {},
                ["<Right>"] = {},
            },
            restricted_keys = {
                ["h"] = {},
                ["j"] = {},
                ["k"] = {},
                ["l"] = {},
            },
            callback = function(text)
                vim.notify(text, vim.log.levels.INFO, { title = "Hint", timeout = 3000 })
            end,
        },
    },

    {
        "rcarriga/nvim-notify",
        lazy = false,
        opts = {},
        config = function()
            vim.notify = require "notify"
        end,
    },

    {
        "hedyhli/outline.nvim",
        lazy = false,
        config = function()
            -- Example mapping to toggle outline
            -- vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

            require("outline").setup {
                -- Your setup opts here (leave empty to use defaults)
                outline_window = {
                    position = "left",
                    -- Auto close the outline window if goto_location is triggered and not for
                    -- peek_location
                    auto_close = true,
                },
            }
        end,
    },
}
