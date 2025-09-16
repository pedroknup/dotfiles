
-- vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
-- opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

opt.title = true -- set title of terminal to nvim

-- vim.cmd("set title")
vim.cmd("source ~/.config/nvim/.vimrc")
vim.cmd("hi Normal ctermbg=none guibg=none")
-- vim.api.nvim_create_autocmd("VimEnter", {
--     callback = function()
--         vim.cmd('lua Snacks.dashboard()')
--     end
-- })
vim.g.lazyvim_check_order = false

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    Snacks.util.set_hl({
      PickerDir = { link = 'Text' },
      PickerPathHidden = { link = 'Text' },
      PickerPathIgnored = { link = 'Comment' },
      PickerGitStatusUntracked = { link = 'Special' },
    }, { prefix = 'Snacks' })
  end,
})

-- vim.api.nvim_create_autocmd("VimEnter", {
--     callback = function()

--         if vim.api.nvim_buf_get_name(0) == "" then
--             -- Only open the dashboard if there are no other buffers
--             -- print something
--             print("hello")
--             require("snacks").dashboard.open()
--         end
--     end,
-- })
--
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
