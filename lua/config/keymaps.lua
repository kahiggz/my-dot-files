vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half-page and center" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half-page and center" })
