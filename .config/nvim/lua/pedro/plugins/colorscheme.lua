return {
    {
        "pedroknup/onedark.nvim",
        priority = 1000,
        name = "onedark",
        config = function()
            require("onedark").setup({
                style="deep",
                term_colors = true,
                styles = {
                    comments = "italic",
                    strings = "italic",
                },
            })
        end,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "onedark",
        },
    },
}


