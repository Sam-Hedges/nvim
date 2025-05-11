require("nvchad.configs.lspconfig").defaults()

-- local servers = { "html", "cssls", "lua_ls", "clangd" }
-- vim.lsp.enable(servers)

local on_attach_default = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

lspconfig.clangd.setup {
  cmd = {
    "clangd",
    "--fallback-style={BasedOnStyle: llvm, IndentWidth: 4}",
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    -- Explicitly start semantic tokens
    if client.server_capabilities.semanticTokensProvider then
      vim.lsp.semantic_tokens.start(bufnr, client.id)
    end

    on_attach_default(client, bufnr)
  end,

  -- LIGMA BALLS NVCHAD WHY TF DO YOU NOT MENTION THIS IN THE DOCS
  -- I WASTED 10 YEARS OF MY LIFE TRYING TO FIGURE OUT WHY SEMANTIC
  -- TOKENS WERE DISABLED
  
  -- Do NOT import nvchad's `on_init`, it disables semantic tokens
  on_init = function() end,

  capabilities = capabilities,
}

local on_init = require("nvchad.configs.lspconfig").on_init

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
