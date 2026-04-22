require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move Selection Down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move Selection Up" })

map("n", "<A-CR>", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
map("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover Docs" })

-- map("n", "<A-r>", vim.lsp.buf.rename, { desc = "LSP Rename" })
map("n", "<A-r>", function()
    require "nvchad.lsp.renamer"()
end, { desc = "LSP Rename" })

map("n", "<C-c>", function()
    vim.diagnostic.jump { count = 1, float = true }
end, { desc = "Next LSP diagnostic" })
map("n", "<C-S-c>", function()
    vim.diagnostic.jump { count = -1, float = true }
end, { desc = "Previous LSP diagnostic" })

-- Move buffer left/right in the tabline
map("n", "<A-h>", function()
    require("nvchad.tabufline").move_buf(-1)
end, { desc = "Buffer move left" })

map("n", "<A-l>", function()
    require("nvchad.tabufline").move_buf(1)
end, { desc = "Buffer move right" })

map("n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "Telescope Go To References" })

--- Mapping for Outline for LSP symbols---
map("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

--- Map Alt+v to Visual Block mode ---
map("n", "<A-v>", "<C-v>", { desc = "Enter Visual Block mode" })

--- COMPILE & RUN
local function notify(msg, level, opts)
    opts = opts or {}
    require "notify"(msg, level, vim.tbl_extend("keep", opts, { title = "Build" }))
end

local function find_exe()
    local exe_files = vim.fn.glob(vim.fn.getcwd() .. "/build/*.exe", false, true)
    if #exe_files == 0 then
        notify("No .exe found in build/ directory.", "error")
        return nil
    end
    return exe_files[1]
end

local function run_exe(exe_path)
    vim.fn.jobstart({ "explorer.exe", exe_path }, { detach = true })
end

local function run_build_bat(on_success)
    local cwd = vim.fn.getcwd()
    local build_script = cwd .. "/build.bat"
    if vim.fn.filereadable(build_script) == 0 then
        notify("No build.bat found in current directory.", "error")
        return false
    end

    local output_lines = {}

    vim.fn.jobstart({ "cmd", "/c", build_script }, {
        cwd = cwd,
        stdout_buffered = true,
        stderr_buffered = true,
        on_stdout = function(_, data)
            if data then
                for _, line in ipairs(data) do
                    if line ~= "" then
                        table.insert(output_lines, line)
                    end
                end
            end
        end,
        on_stderr = function(_, data)
            if data then
                for _, line in ipairs(data) do
                    if line ~= "" then
                        table.insert(output_lines, line)
                    end
                end
            end
        end,
        on_exit = function(_, code)
            vim.schedule(function()
                local full_output = table.concat(output_lines, "\n")

                if code ~= 0 then
                    notify("Build failed!\n" .. full_output, "error")
                    return
                end

                -- Header notification (build start tags)
                local header = full_output:match "%[.-%]%s*%[.-%]" or "Build started"
                notify(header, "info", { timeout = 1000 })

                -- Timing notification (build complete)
                local compile = full_output:match "Compile time:%s*%S+"
                local link = full_output:match "Link time:%s*%S+"
                local total = full_output:match "Total time:%s*%S+"
                local times = table.concat(
                    vim.tbl_filter(function(s)
                        return s
                    end, { compile, link, total }),
                    "\n"
                )
                notify(times ~= "" and times or "Build complete.", "info")

                if on_success then
                    on_success(full_output)
                end
            end)
        end,
    })
    return true
end

-- <leader>cp — compile only
map("n", "<leader>cp", function()
    run_build_bat()
end, { desc = "Compile with build.bat (silent, notify)" })

-- <leader>rr — run only
map("n", "<leader>rr", function()
    local exe = find_exe()
    if not exe then
        return
    end
    run_exe(exe)
end, { desc = "Run compiled .exe (external shell)" })

-- <leader>cr — compile then run
map("n", "<leader>cr", function()
    run_build_bat(function()
        local exe = find_exe()
        if not exe then
            return
        end
        run_exe(exe)
    end)
end, { desc = "Compile and run .exe (silent build, external shell)" })

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
