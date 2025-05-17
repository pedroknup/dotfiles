vim.g.mapleader = " "

local mapper = function(mode, key, result, desc)
    vim.keymap.set(mode, key, result, { noremap = true, silent = true, desc = desc })
end

mapper("i", "jk", "<ESC>", "Exit insert mode with jk")

mapper("n", "<leader>nh", ":nohl<CR>", "Clear search highlights")

-- increment/decrement numbers
mapper("n", "<leader>+", "<C-a>", "Increment number") -- increment
mapper("n", "<leader>-", "<C-x>", "Decrement number") -- decrement
-- window management
mapper("n", "<leader>sv", "<C-w>v", "Split window vertically") -- split window vertically
mapper("n", "<leader>sh", "<C-w>s", "Split window horizontally") -- split window horizontally
mapper("n", "<leader>se", "<C-w>=", "Make splits equal size") -- make split windows equal width & height
mapper("n", "<leader>sx", "<cmd>close<CR>", "Close current split") -- close current split window

mapper("n", "<leader>to", "<cmd>tabnew<CR>", "Open new tab") -- open new tab
mapper("n", "<leader>tx", "<cmd>tabclose<CR>", "Close current tab") -- close current tab
mapper("n", "<leader>tn", "<cmd>tabn<CR>", "Go to next tab") --  go to next tab
mapper("n", "<leader>tp", "<cmd>tabp<CR>", "Go to previous tab") --  go to previous tab
mapper("n", "<leader>tf", "<cmd>tabnew %<CR>", "Open current buffer in new tab") --  move current buffer to new tab

mapper("x", "<leader>p", '"_dP', "Paste without yanking")
mapper("n", "<C-/>", '<cmd>lua require("snacks.terminal").toggle()<CR>', "Toggle terminal")

mapper("n", "<D-Up>", "<cmd>move-2<CR>", "Move line up")
mapper("n", "<D-Down>", "<cmd>move+<CR>", "Move line down")

-- mapper("n", "<C-e>", "3<C-e>", "Scroll down more quickly")
-- mapper("n", "<C-y>", "3<C-y>", "Scroll up more quickly")

-- toggles a mini tmux pane
-- TODO: add the script to this repository
-- mapper("n", "<leader>tt", ":silent! !~/dev/tmux/collapsable_mini_tmux_pane.sh<CR>")

mapper("i", "<F3>", "<C-c>:", "Exit insert mode and enter command mode")
mapper("n", "<F3>", "<C-c>:", "Enter command mode")
mapper("x", "<F3>", "<C-c>:", "Enter command mode")
