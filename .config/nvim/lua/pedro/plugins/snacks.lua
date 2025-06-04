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
                    { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    {
                        icon = " ",
                        key = "g",
                        desc = "Find Text",
                        action = ":lua Snacks.dashboard.pick('live_grep')",
                    },
                    {
                        icon = " ",
                        key = "r",
                        desc = "Recent Files",
                        action = ":lua Snacks.dashboard.pick('oldfiles')",
                    },
                    {
                        icon = " ",
                        key = "c",
                        desc = "Config",
                        action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
                    },
                    { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                    {
                        icon = "󰒲 ",
                        key = "l",
                        desc = "Lazy",
                        action = ":Lazy",
                        enabled = package.loaded.lazy ~= nil,
                    },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
                header = 
[[
                                          
   ████ ██████           █████      ██
  ███████████             █████ 
  █████████ ███████████████████ ███   ███████████
 █████████  ███    █████████████ █████ ██████████████
█████████ ██████████ █████████ █████ █████ ████ █████
███████████ ███    ███ █████████ █████ █████ ████ █████
   ██████  █████████████████████ ████ █████ █████ ████ ██████
]],
            },
            sections = {
                { section = "header" },
                {
                    section = "keys",
                    indent = 1,
                    padding = 1,
                },
                { section = "recent_files", icon = " ", title = "Recent Files", indent = 3, padding = 2 },
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
            { noremap = true, silent = true }
        )
        -- Snacks.toggle.new({
        --     id = "ufo",
        --     name = "Enable/Disable ufo",
        --     get = function()
        --         return require("ufo").inspect()
        --     end,
        --     set = function(state)
        --         if state == nil then
        --             require("noice").enable()
        --             require("ufo").enable()
        --             vim.o.foldenable = true
        --             vim.o.foldcolumn = "1"
        --         else
        --             require("noice").disable()
        --             require("ufo").disable()
        --             vim.o.foldenable = false
        --             vim.o.foldcolumn = "0"
        --         end
        --     end,
        -- })
    end,
}
-- return {
--     "folke/snacks.nvim",
--     priority = 1000,
--     lazy = false,
--     enabled = true,
--     ---@type snacks.Config
--     opts = {
--         -- your configuration comes here
--         -- or leave it empty to use the default settings
--         -- refer to the configuration section below
--         animate = { enable = false },
--         bigfile = { enabled = true },
--         dashboard = {
--             enabled = true,
--             preset = {
--                 pick = nil,
--                 ---@type snacks.dashboard.Item[]
--                 keys = {
--                     { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
--                     { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
--                     {
--                         icon = " ",
--                         key = "g",
--                         desc = "Find Text",
--                         action = ":lua Snacks.dashboard.pick('live_grep')",
--                     },
--                     {
--                         icon = " ",
--                         key = "r",
--                         desc = "Recent Files",
--                         action = ":lua Snacks.dashboard.pick('oldfiles')",
--                     },
--                     {
--                         icon = " ",
--                         key = "c",
--                         desc = "Config",
--                         action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
--                     },
--                     { icon = " ", key = "s", desc = "Restore Session", section = "session" },
--                     {
--                         icon = "󰒲 ",
--                         key = "l",
--                         desc = "Lazy",
--                         action = ":Lazy",
--                         enabled = package.loaded.lazy ~= nil,
--                     },
--                     { icon = " ", key = "q", desc = "Quit", action = ":qa" },
--                 },
--                 header = [[
--                                           
--    ████ ██████           █████      ██
--   ███████████             █████ 
--   █████████ ███████████████████ ███   ███████████
--  █████████  ███    █████████████ █████ ██████████████
-- █████████ ██████████ █████████ █████ █████ ████ █████
-- ███████████ ███    ███ █████████ █████ █████ ████ █████
--    ██████  █████████████████████ ████ █████ █████ ████ ██████
-- ]],
--             },
--             sections = {
--                 { section = "header" },
--                 {
--                     section = "keys",
--                     indent = 1,
--                     padding = 1,
--                 },
--                 { section = "recent_files", icon = " ", title = "Recent Files", indent = 3, padding = 2 },
--                 { section = "startup" },
--             },
--         },
--         explorer = { enabled = true, follow_file = true },
--         indent = { enabled = true },
--         input = { enabled = true },
--         picker = { enabled = true },
--         notifier = { enabled = true },
--         quickfile = { enabled = true },
--         scope = { enabled = true },
--         scroll = { enabled = false },
--         statuscolumn = { enabled = true },
--         words = { enabled = true },
--         terminal = {
--             enabled = true,
--             win = {
--                 position = "float",
--                 border = "single",
--             },
--         },
--     },
--     -- keys = {
--     --     {
--     --         "<leader>zn",
--     --         function()
--     --             Snacks.zen()
--     --         end,
--     --         desc = "Toggle Zen Mode",
--     --         mode = "n",
--     --     },
--     -- },
--     config = function()
--         vim.api.nvim_set_keymap(
--             "n",
--             "<leader>ef",
--             ":lua Snacks.picker.explorer()<CR>",
--             { noremap = true, silent = true }
--         )
--     end,
-- }
