require "nvchad.options"
local opt = vim.o

-- Custom Options!
opt.relativenumber = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.scrolloff = 10
opt.cursorlineopt = "both"
opt.autoindent = true
opt.smartindent = true

-- Highlights the yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.hl.on_yank { timeout = 200 }
    end,
})

-- Custom Command to toggle transparency for when using terminal
vim.api.nvim_create_user_command("ToggleTransparency", function()
    local base46 = require "base46"
    -- local transparency = not base46.transparency (was passed into base46 function)
    pcall(function()
        base46.toggle_transparency()
    end)
end, {})
