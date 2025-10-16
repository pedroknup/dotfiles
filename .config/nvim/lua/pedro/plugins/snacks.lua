return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    enabled = true,
    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "OilActionsPost",
            callback = function(event)
                if event.data.actions.type == "move" then
                    Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
                end
            end,
        })
    end,
    keys = {
        {
            "<leader>zn",
            function()
                Snacks.zen()
            end,
            desc = "Toggle Zen Mode",
            mode = "n",
        },
    },
    opts = {
        bigfile = { enabled = true },
        explorer = {
            follow_file = true,
            enabled = true,
        },
        dashboard = {
            enabled = true,
            preset = {
                pick = nil,
                ---@type snacks.dashboard.Item[]
                keys = {
                    { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    {
                        icon = " ",
                        key = "g",
                        desc = "Find Text",
                        action = ":lua Snacks.dashboard.pick('live_grep')",
                    },
                    {
                        icon = " ",
                        key = "r",
                        desc = "Recent Files",
                        action = ":lua Snacks.dashboard.pick('oldfiles')",
                    },
                    {
                        icon = " ",
                        key = "c",
                        desc = "Config",
                        action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
                    },
                    { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                    {
                        icon = "󰒲 ",
                        key = "l",
                        desc = "Lazy",
                        action = ":Lazy",
                        enabled = package.loaded.lazy ~= nil,
                    },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
                header =
[[
░▒▓███████▓▒░░▒▓████████▓▒░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓██████████████▓▒░  
░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░░▒▓█▓▒░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▓█▓▒░ ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▓█▓▒░ ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░▒▓██████▓▒░   ░▒▓██▓▒░  ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ 
]],
            },
            sections = {
                { section = "header" },
                {
                    section = "keys",
                    indent = 1,
                    padding = 1,
                },
                { section = "recent_files", icon = " ", title = "Recent Files", indent = 3, padding = 2 },
                { section = "startup" },
            },
        },
        input = { enabled = false },
        notifier = { enabled = false },
        terminal = {
            enabled = true,
            win = {
                position = "float",
                border = "single",
            },
        },
        quickfile = { enabled = true },
        scope = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = false },
        rename = { enabled = true },
        zen = {
            enabled = true,
            toggles = {
                ufo = true,
                dim = true,
                git_signs = false,
                diagnostics = false,
                line_number = false,
                relative_number = false,
                signcolumn = "no",
                indent = false,
            },
        },

        picker = {
            sources = {
                explorer = {
                    ignored = true,
                    hidden = true,
                },
            },
            icons = {
                git = {
                    staged = "●",
                    added = "A",
                    deleted = "D",
                    ignored = "",
                    modified = "M",
                    renamed = "R",
                    untracked = "U",
                },
            },
        },
        indent = {
            indent = { enabled = false, char = "▏" },
            scope = {
                enabled = true,
                char = "▏",
                underline = false,
                only_current = true,
                hl = {
                    "RainbowDelimiterRed",
                    "RainbowDelimiterYellow",
                    "RainbowDelimiterBlue",
                    "RainbowDelimiterCyan",
                    "RainbowDelimiterOrange",
                    "RainbowDelimiterGreen",
                    "RainbowDelimiterViolet",
                },
            },
        },
    },
    config = function(_, opts)
        require("snacks").setup(opts)

        vim.api.nvim_set_keymap(
            "n",
            "<leader>ef",
            ":lua Snacks.picker.explorer()<CR>",
            { noremap = true, silent = true, desc = "Open file explorer" }
        )
    end,
}
