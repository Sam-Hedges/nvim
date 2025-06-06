-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(
--
vim.g.mason_shell = "cmd.exe"

---@type ChadrcConfig
local M = {}

M.base46 = {
    -- theme = require "themes.rider_dark",
    ---@diagnostic disable-next-line
    theme = "rider_dark",

    -- hl_override = {
    -- 	Comment = { italic = true },
    -- 	["@comment"] = { italic = true },
    -- },
}

M.nvdash = {
    load_on_startup = true,
}

M.mason = {
    pkgs = {
        "stylua",
        "clangd",
        "clang-format",
    },
}

M.lsp = {
    signature = true,
}

-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

return M
