return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                javascript = {"prettier"},
                typescript = {"prettier"},
                javascriptreact = {"prettier"},
                typescriptreact = {"prettier"},
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                graphql = { "prettier" },
                liquid = { "prettier" },
                lua = { "stylua" },
                python = { "isort", "black" },
            },
            formatters = {
                prettier = {
                    prepend_args = { "--config-precedence", "prefer-file" },
                },
            },

            linters = {
                eslint = {
                    command = "eslint_d",
                    rootPatterns = { ".eslintrc.js", ".eslintrc.json", ".eslintrc" },
                    debounce = 100,
                    args = { "--stdin", "--stdin-filename", "%filepath", "--format", "json" },
                    sourceName = "eslint",
                    parseJson = {
                        errorsRoot = "[0].messages",
                        line = "line",
                        column = "column",
                        endLine = "endLine",
                        endColumn = "endColumn",
                        message = "${message} [${ruleId}]",
                        security = "severity",
                    },
                    securities = {
                        [2] = "error",
                        [1] = "warning",
                    },
                },
            },
        })

        vim.keymap.set("n", "<leader>mp", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            })
        end, { desc = "Format file" })

        vim.keymap.set("v", "<leader>mp", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
                range = {
                    start = vim.api.nvim_buf_get_mark(0, "<"),
                    ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
                },
            })
        end, { desc = "Format range" })
    end,
}
