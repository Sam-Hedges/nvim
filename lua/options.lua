require "nvchad.options"

-- Custom Options!
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.cursorlineopt = "both"

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
