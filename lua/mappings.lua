require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move Selection Down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move Selection Up" })

map("n", "<A-CR>", vim.lsp.buf.code_action, {})
map("n", "K", vim.lsp.buf.hover, {})

map("n", "<leader>cfm", function()
    require("conform").format()
end)

--- MENU PLUGIN ---
-- Keyboard users
vim.keymap.set("n", "<C-t>", function()
    require("menu").open "default"
end, {})

-- mouse users + nvimtree users!
vim.keymap.set({ "n", "v" }, "<RightMouse>", function()
    require("menu.utils").delete_old_menus()

    vim.cmd.exec '"normal! \\<RightMouse>"'

    -- clicked buf
    local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
    local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

    require("menu").open(options, { mouse = true })
end, {})
--- MENU PLUGIN ---

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- map("x", "<leader>ca", function()
--     vim.lsp.buf.code_action()
-- end, { desc = "Apply LSP Code Action" })
