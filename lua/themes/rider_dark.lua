-- this line for types, by hovering and autocompletion (lsp required)
-- will help you understanding properties, fields, and what highlightings the color used for
---@diagnostic disable missing-field
---@type Base46Table
local M = {}

M.base_30 = {
    white = "#d3dbe3",
    darker_black = "#1C1C1C",
    black = "#262626", --  nvim bg
    black2 = "#1c1c1c",
    one_bg = "#33383d",
    one_bg2 = "#5c5c5c", -- StatusBar (filename)
    one_bg3 = "#42474c",
    grey = "#5d5d5d", -- Line numbers (shouldn't be base01?)
    grey_fg = "#85C46C", -- Why this affects comments?
    grey_fg2 = "#60656a",
    light_grey = "#6a6f74",
    red = "#ff7f8d", -- StatusBar (username)
    baby_pink = "#ffa198",
    pink = "#ec6cb9",
    line = "#33383d", -- for lines like vertsplit
    green = "#56d364", -- StatusBar (file percentage)
    vibrant_green = "#85e89d",
    nord_blue = "#58a6ff", -- Mode indicator
    blue = "#79c0ff",
    yellow = "#ffdf5d",
    sun = "#ffea7f",
    purple = "#d2a8ff",
    dark_purple = "#bc8cff",
    teal = "#39c5cf",
    orange = "#ffab70",
    cyan = "#56d4dd",
    statusline_bg = "#3b3b3b",
    lightbg = "#4c4c4c",
    pmenu_bg = "#58a6ff", -- Command bar suggestions
    folder_bg = "#58a6ff",
}

M.base_16 = {
    base00 = "#262626", -- Default bg
    base01 = "#33383d", -- Lighter bg (status bar, line number, folding mks)
    base02 = "#08335e", -- Selection bg
    base03 = "#85C46C", -- Comments, invisibles, line hl
    base04 = "#4c5156", -- Dark fg (status bars)
    base05 = "#c9d1d9", -- Default fg (caret, delimiters, Operators)
    base06 = "#d3dbe3", -- Light fg (not often used)
    base07 = "#dde5ed", -- Light bg (not often used)
    base08 = "#B392E9", -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
    base09 = "#5ca571", -- Yank Highlight, Integers, Boolean, Constants, XML Attributes, Markup Link Url
    base0A = "#ffdf5d", -- Classes, Markup Bold, Search Text Background
    base0B = "#a5d6ff", -- Strings, Inherited Class, Markup Code, Diff Inserted
    base0C = "#83caff", -- Support, regex, escape chars
    base0D = "#6AB1F0", -- Function, methods, headings
    base0E = "#6C95EB", -- Keywords
    base0F = "#85e89d", -- Deprecated, open/close embedded tags
}

M.rider = {
    light_teal = "#66C3CC",
    teal = "#39CC9B",
    blue = "#79C0FF",
    dark_blue = "#6C95EB",
    orange = "#C9A26D",
    pale_pink = "#E1BFFF",
    light_pink = "#ED94C0",
    pink = "#D688D4",
    purple = "#C191FF",
    green = "#85C46C",
    dark_green = "#487D34",
    yellow = "#EBC36C",
    red = "#DB5C5C",
}

M.polish_hl = {
    treesitter = {

        -- See ' :h treesitter-highlight-groups ' for details.

        ["@variable"] = { fg = M.rider.light_teal }, -- various variable names
        ["@variable.builtin"] = { fg = M.rider.dark_blue }, -- built-in variable names (e.g. `this`, `self`)
        ["@variable.parameter"] = { fg = M.base_30.white }, -- parameters of a function
        ["@parameter"] = { fg = M.base_30.white }, -- parameters of a function
        ["@variable.parameter.builtin"] = { fg = M.rider.dark_blue }, -- special parameters (e.g. `_`, `it`)
        ["@variable.member"] = { fg = M.rider.light_teal }, -- object and struct fields

        ["@constant"] = { fg = M.rider.light_teal }, -- constant identifiers
        ["@constant.builtin"] = { fg = M.rider.light_teal }, -- built-in constant values
        ["@constant.macro"] = { fg = M.rider.light_teal }, -- constants defined by the preprocessor

        ["@module"] = { fg = M.rider.purple }, -- modules or namespaces
        ["@module.builtin"] = { fg = M.rider.purple }, -- built-in modules or namespaces
        ["@label"] = { fg = M.rider.blue }, -- `GOTO` and other labels (e.g. `label:` in C), including heredoc labels

        ["@string"] = { fg = M.rider.orange }, -- string literals
        -- ["@string.regexp"] = { fg = "111111" }, -- regular expressions
        ["@string.escape"] = { fg = M.rider.pink }, -- escape sequences

        ["@character"] = { fg = M.rider.orange }, -- character literals
        ["@character.special"] = { fg = M.rider.pink }, -- special characters (e.g. wildcards)

        ["@boolean"] = { fg = M.rider.dark_blue }, -- boolean literals
        ["@number"] = { fg = M.rider.light_pink }, -- numeric literals
        ["@number.float"] = { fg = M.rider.light_pink }, -- floating-point number literals

        ["@type"] = { fg = M.rider.purple }, -- type or class definitions and annotations
        ["@type.builtin"] = { fg = M.rider.dark_blue }, -- built-in types
        ["@type.definition"] = { fg = M.rider.dark_blue }, -- identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)

        -- ["@attribute"] = { fg = "111111" }, -- attribute annotations (e.g. Python decorators, Rust lifetimes)
        -- ["@attribute.builtin"] = { fg = "111111" }, -- builtin annotations (e.g. `@property` in Python)
        ["@property"] = { fg = M.rider.light_teal }, -- the key in key/value pairs

        ["@function"] = { fg = M.rider.teal }, -- function definitions
        ["@function.builtin"] = { fg = M.rider.teal }, -- built-in functions
        ["@function.call"] = { fg = M.rider.teal }, -- function calls
        ["@function.macro"] = { fg = M.rider.teal }, -- preprocessor macros

        ["@function.method"] = { fg = M.rider.teal }, -- method definitions
        ["@function.method.call"] = { fg = M.rider.teal }, -- method calls

        ["@constructor"] = { fg = M.rider.purple }, -- constructor calls and definitions
        ["@operator"] = { fg = M.base_30.white }, -- symbolic operators (e.g. `+`, `*`)

        ["@keyword"] = { fg = M.rider.dark_blue }, -- keywords not fitting into specific categories
        ["@keyword.coroutine"] = { fg = M.rider.dark_blue }, -- keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
        ["@keyword.function"] = { fg = M.rider.dark_blue }, -- keywords that define a function (e.g. `func` in Go, `def` in Python)
        ["@keyword.operator"] = { fg = M.base_30.white }, -- operators that are English words (e.g. `and`, `or`)
        ["@keyword.import"] = { fg = M.rider.dark_blue }, -- keywords for including or exporting modules (e.g. `import`, `from` in Python)
        ["@keyword.type"] = { fg = M.rider.dark_blue }, -- keywords describing namespaces and composite types (e.g. `struct`, `enum`)
        ["@keyword.modifier"] = { fg = M.rider.dark_blue }, -- keywords modifying other constructs (e.g. `const`, `static`, `public`)
        ["@keyword.repeat"] = { fg = M.rider.dark_blue }, -- keywords related to loops (e.g. `for`, `while`)
        ["@keyword.return"] = { fg = M.rider.dark_blue }, -- keywords like `return` and `yield`
        ["@keyword.debug"] = { fg = M.rider.yellow }, -- keywords related to debugging
        ["@keyword.exception"] = { fg = M.rider.dark_blue }, -- keywords related to exceptions (e.g. `throw`, `catch`)

        ["@keyword.conditional"] = { fg = M.rider.dark_blue }, -- keywords related to conditionals (e.g. `if`, `else`)
        ["@keyword.conditional.ternary"] = { fg = M.base_30.white }, -- ternary operator (e.g. `?`, `:`)

        ["@keyword.directive"] = { fg = M.rider.purple }, -- various preprocessor directives and shebangs
        ["@keyword.directive.define"] = { fg = M.rider.purple }, -- preprocessor definition directives

        ["@punctuation.delimiter"] = { fg = M.base_30.white }, -- delimiters (e.g. `;`, `.`, `,`)
        ["@punctuation.bracket"] = { fg = M.base_30.white }, -- brackets (e.g. `()`, `{}`, `[]`)
        ["@punctuation.special"] = { fg = M.base_30.white }, -- special symbols (e.g. `{}` in string interpolation)

        ["@comment"] = { fg = M.rider.green }, -- line and block comments
        ["@comment.documentation"] = { fg = M.rider.dark_green }, -- comments documenting code
        ["@constant.comment"] = { fg = M.base_30.white }, -- name in a comment

        -- error-type comments (e.g. `ERROR`, `FIXME`, `DEPRECATED`)
        ["@comment.error"] = { fg = M.rider.pink, bg = "none" },
        -- warning-type comments (e.g. `WARNING`, `FIX`, `HACK`)
        ["@comment.warning"] = { fg = M.rider.yello, bg = "none" },
        -- todo-type comments (e.g. `TODO`, `WIP`)
        ["@comment.todo"] = { fg = M.rider.red, bg = "none" },
        -- note-type comments (e.g. `NOTE`, `INFO`, `XXX`)
        ["@comment.note"] = { fg = M.rider.pale_pink, bg = "none" },

        ["@tag"] = { fg = M.rider.dark_green }, -- XML-style tag names (e.g. in XML, HTML, etc.)
        ["@tag.builtin"] = { fg = M.rider.dark_green }, -- builtin tag names (e.g. HTML5 tags)
        ["@tag.attribute"] = { fg = M.rider.dark_green }, -- XML-style tag attributes
        ["@tag.delimiter"] = { fg = M.rider.dark_green }, -- XML-style tag delimiters
    },

    semantic_tokens = {
        -- Clang is stupid and doesn't actually use many of these
        ["@lsp.mod.defaultLibrary"] = { fg = M.rider.dark_blue },
        ["@event"] = { fg = M.rider.pale_pink },
        ["@lsp.type.struct"] = { fg = M.rider.pale_pink },
    },
}

-- set the theme type whether is dark or light
M.type = "dark" -- "or light"

-- this will be later used for users to override your theme table from chadrc
M = require("base46").override_theme(M, "rider_dark")

return M
