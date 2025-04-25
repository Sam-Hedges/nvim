require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "clangd" }
vim.lsp.enable(servers)

-- lsps with default config
-- for _, lsp in ipairs(servers) do
--     lspconfig[lsp].setup {
--         on_attach = nvlsp.on_attach,
--         on_init = nvlsp.on_init,
--         capabilities = nvlsp.capabilities,
--     }
-- end

local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

-- C and CPP setup
lspconfig.clangd.setup {
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        on_attach(client, bufnr)
    end,
    on_init = on_init,
    capabilities = capabilities,
}

-- Without the loop, you would have to manually set up each LSP
--
-- lspconfig.html.setup {
--   on_attach = nvlsp.on_attach,
--   capabilities = nvlsp.capabilities,
-- }
