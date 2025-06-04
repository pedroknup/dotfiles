local fugitive = {
    "tpope/vim-fugitive",
    keys = {
        {
            "<Leader>gs",
            ":tab Git<CR>",
            desc = "Git status in new tab",
        },
    },
    cmd = "Git",
}
local gitsigns = {
    "lewis6991/gitsigns.nvim",
    opts = {
        preview_config = {
            border = "single",
            style = "minimal",
            relative = "cursor",
            row = 0,
            col = 1,
        },
        signcolumn = true,
        numhl = true,
        on_attach = function(bufnr)
            local keymap_opts = { silent = true, noremap = true, buffer = bufnr }
            -- vim.keymap.set(
            --     "n",
            --     "=",
            --     "<cmd>Gitsigns preview_hunk<CR>",
            --     vim.tbl_extend("force", keymap_opts, { desc = "Gitsigns float preview" })
            -- )
            vim.keymap.set(
                "n",
                "<Leader>rh",
                "<cmd>Gitsigns reset_hunk<CR>",
                vim.tbl_extend("force", keymap_opts, { desc = "Gitsigns float preview" })
            )
            vim.keymap.set(
                "n",
                "<Leader>gn",
                "<cmd>Gitsigns next_hunk<CR>",
                vim.tbl_extend("force", keymap_opts, { desc = "Gitsigns goto next" })
            )
            -- vim.keymap.set(
            --     "n",
            --     "<Leader>gp",
            --     "<cmd>Gitsigns prev_hunk<CR>",
            --     vim.tbl_extend("force", keymap_opts, { desc = "Gitsigns goto prev" })
            -- )
            vim.keymap.set(
                "n",
                "<Leader>gt",
                "<cmd>Gitsigns toggle_current_line_blame<CR>",
                vim.tbl_extend("force", keymap_opts, { desc = "Toggle current line blame" })
            )
        end,
    },
}
local diffview = {
    "sindrets/diffview.nvim",
    keys = {
        {
            "<Leader>gD",
            "<cmd>DiffviewOpen<CR>",
            desc = "Open changed files",
        },
    },
    cmd = {
        "DiffviewOpen",
        "DiffviewFileHistory",
    },
    opts = {
        view = {
            merge_tool = {
                layout = "diff3_mixed",
            },
        },
    },
}

return {
    fugitive,
    gitsigns,
    diffview,
}
