require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move Selection Down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move Selection Up" })

map("n", "<A-CR>", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
map("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover Docs" })
map("n", "<A-r>", vim.lsp.buf.rename, { desc = "LSP Rename" })

map("n", "<C-c>", vim.diagnostic.goto_next, { desc = "Next LSP diagnostic" })
map("n", "<C-S-c>", vim.diagnostic.goto_prev, { desc = "Previous LSP diagnostic" })

--- COMPILE & RUN
function _G.run_build_bat()
    local cwd = vim.fn.getcwd()
    local build_script = cwd .. "/build.bat"

    if vim.fn.filereadable(build_script) == 0 then
        print "No build.bat found in current directory."
        return false
    end

    local command = string.format([[cmd /c "%s"]], build_script)

    require("nvchad.term").runner {
        pos = "sp", -- horizontal split
        cmd = command,
        id = "build_runner",
        clear_cmd = false,
    }
    return true
end

function _G.run_built_exe()
    vim.api.nvim_create_autocmd("TermClose", {
        once = true,
        callback = function()
            local exe_files = vim.fn.glob(vim.fn.getcwd() .. "/build/*.exe", false, true)
            if #exe_files == 0 then
                print "No .exe found in build/ directory."
                return
            elseif #exe_files > 1 then
                print "Multiple .exe files found; running the first one."
            end

            vim.cmd("terminal " .. exe_files[1])
        end,
    })
end

map("n", "<leader>cp", function()
    run_build_bat()
end, { desc = "Compile with build.bat using NvTerm" })

map("n", "<leader>cr", function()
    if not run_build_bat() then
        return
    end
    run_built_exe()
end, { desc = "Compile and run .exe using NvTerm" })

map("n", "<leader>rr", function()
    run_built_exe()
end, { desc = "Rerun compiled .exe using nvterm" })

--- MENU PLUGIN ---
-- Keyboard users
map("n", "<C-t>", function()
    require("menu").open "default"
end, {})

-- mouse users + nvimtree users!
map({ "n", "v" }, "<RightMouse>", function()
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
