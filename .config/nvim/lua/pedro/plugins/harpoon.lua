return {
    "ThePrimeagen/harpoon", -- recent files
    config = function()
        require("harpoon").setup({
            menu = {
                width = vim.api.nvim_win_get_width(0) - 4,
            },
        })

        require("telescope").load_extension("harpoon")

        vim.keymap.set("n", "<leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { desc = "Show harpoon menu" })
        vim.keymap.set("n", "<leader>hm", ":lua require('harpoon.mark').toggle_file()<CR>", { desc = "Mark file with harpoon" })
        vim.keymap.set("n", "<leader>hq", ":lua require('harpoon.ui').nav_file(1)<CR>", { desc = "Navigate to harpoon file 1" })
        vim.keymap.set("n", "<leader>hw", ":lua require('harpoon.ui').nav_file(2)<CR>", { desc = "Navigate to harpoon file 2" })
        vim.keymap.set("n", "<leader>he", ":lua require('harpoon.ui').nav_file(3)<CR>", { desc = "Navigate to harpoon file 3" })
        vim.keymap.set("n", "<leader>hr", ":lua require('harpoon.ui').nav_file(4)<CR>", { desc = "Navigate to harpoon file 4" })
    end,
}
