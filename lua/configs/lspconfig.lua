local nvchad_lsp = require "nvchad.configs.lspconfig"

-- override their on_init to *not* disable semanticTokens
nvchad_lsp.on_init = function()
    -- Allow semantic tokens (do nothing here)
end

-- continue with your config
require("nvchad.configs.lspconfig").defaults()

local servers = { "clangd" }
vim.lsp.enable(servers)

-- DO NOT import nvchad's `on_init`, it disables semantic tokens
-- LIGMA BALLS NVCHAD WHY TF DO YOU NOT MENTION THIS IN THE DOCS
-- I WASTED 10 YEARS OF MY LIFE TRYING TO FIGURE OUT WHY SEMANTIC
-- TOKENS WERE DISABLED

local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- Lua setup
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        on_attach(client, bufnr)
    end,
    capabilities = capabilities,
})

-- vim.lsp.config("clangd", {
--     cmd = {
--         "clangd",
--         "--fallback-style={BasedOnStyle: llvm, IndentWidth: 4}",
--     },
--     on_attach = function(client, bufnr)
--         -- client.server_capabilities.documentFormattingProvider = false
--         -- client.server_capabilities.documentRangeFormattingProvider = false
--
--         -- Explicitly start semantic tokens
--         if client.server_capabilities.semanticTokensProvider then
--             vim.lsp.semantic_tokens.start(bufnr, client.id)
--         end
--
--         on_attach_default(client, bufnr)
--     end,
--
--     on_init = function() end,
--
--     capabilities = capabilities,
-- })
