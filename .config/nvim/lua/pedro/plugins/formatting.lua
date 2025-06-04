return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                javascript = {"prettier"},
                typescript = {},
                javascriptreact = {},
                typescriptreact = {},
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

        vim.keymap.set({ "n", "v" }, "<leader>mp", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            })
        end, { desc = "Format file or range (in visual mode)" })
    end,
}
