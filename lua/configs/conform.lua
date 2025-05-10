local conform = require "conform"

local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        -- c = { "clang-format" },
        -- cpp = { "clang-format", args = '--style="{BasedOnStyle: llvm, IndentWidth: 4}"' },
        -- css = { "prettier" },
        -- html = { "prettier" },
    },

    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
}

conform.setup(options)

-- Automatically format on save for any buffer that supports formatting
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     pattern = "*",
--     callback = function(args)
--         conform.format { bufnr = args.buf }
--     end,
-- })

return options
