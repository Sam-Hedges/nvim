require("nvchad.configs.lspconfig").defaults()

-- local servers = { "html", "cssls", "lua_ls", "clangd" }
-- vim.lsp.enable(servers)

-- lsps with default config
-- for _, lsp in ipairs(servers) do
--     lspconfig[lsp].setup {
--         on_attach = nvlsp.on_attach,
--         on_init = nvlsp.on_init,
--         capabilities = nvlsp.capabilities,
--     }
-- end

local on_init = require("nvchad.configs.lspconfig").on_init
local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

-- C and CPP setup
vim.lsp.enable "clangd"
-- lspconfig.clangd.setup {
--     cmd = {
--         "clangd",
--         "--fallback-style={BasedOnStyle: llvm, IndentWidth: 4}",
--     },
--     on_attach = function(client, bufnr)
--         client.server_capabilities.documentFormattingProvider = false
--         client.server_capabilities.documentRangeFormattingProvider = false
--         client.server_capabilities.semanticTokensProvider = true
--         on_attach(client, bufnr)
--     end,
--     on_init = on_init,
--     capabilities = capabilities,
-- }

-- Lua setup
lspconfig.lua_ls.setup {
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
    on_init = on_init,
    capabilities = capabilities,
}
