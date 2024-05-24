return {
    "ThePrimeagen/harpoon", -- recent files
    config = function()
        require("harpoon").setup()
        require("telescope").load_extension("harpoon")

        vim.keymap.set("n", "<leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
        vim.keymap.set("n", "<leader>hm", ":lua require('harpoon.mark').toggle_file()<CR>")
        vim.keymap.set("n", "<leader>hq", ":lua require('harpoon.ui').nav_file(1)<CR>")
        vim.keymap.set("n", "<leader>hw", ":lua require('harpoon.ui').nav_file(2)<CR>")
        vim.keymap.set("n", "<leader>he", ":lua require('harpoon.ui').nav_file(3)<CR>")
        vim.keymap.set("n", "<leader>hr", ":lua require('harpoon.ui').nav_file(4)<CR>")
    end,
}
