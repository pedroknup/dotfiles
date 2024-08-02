return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                panel = {
                    enabled = true,
                    auto_refresh = false,
                    keymap = {
                        jump_prev = "[[",
                        jump_next = "]]",
                        -- accept suggestion with ctrl ;
                        accept = "<C-;>",
                        refresh = "gr",
                        -- open = "<leader>gp",
                    },
                    layout = {
                        position = "bottom", -- | top | left | right
                        ratio = 0.4,
                    },
                },
                suggestion = {
                    enabled = true,
                    auto_trigger = false,
                    debounce = 75,
                    keymap = {
                        accept = "<C-;>",
                        accept_word = false,
                        accept_line = false,
                        next = "<M-]>",
                        prev = "<M-[>",
                        dismiss = "<C-]>",
                    },
                },
                filetypes = {
                    yaml = false,
                    markdown = false,
                    help = false,
                    gitcommit = false,
                    gitrebase = false,
                    hgcommit = false,
                    svn = false,
                    cvs = false,
                    ["."] = false,
                },
                copilot_node_command = "node", -- Node.js version must be > 18.x
                server_opts_overrides = {},
            })
            local api = require("copilot.api")
            print("should work")
            api.register_status_notification_handler(function (data)
              vim.api.nvim_set_var("copilot_status", data.status)
            end)

            vim.keymap.set(
                "n",
                "<leader>tt",
                function()
                  vim.cmd('lua require("copilot.suggestion").toggle_auto_trigger()')
                  local copilot_status = vim.api.nvim_get_var("copilot_status")
                  print("Copilot suggestion is now " .. copilot_status)
                end,
                { noremap = true, silent = true, desc = "Toggle Copilot suggestion" }
            )
        end,
    },

    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup()
        end,
    },
}
