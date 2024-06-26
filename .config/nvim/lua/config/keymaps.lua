-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", '"_dP')

-- copy to system clipbord
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- setting <C-c> and Esc same func
vim.keymap.set("i", "<C-c>", "<Esc>")

-- open new window session in tmux while in vim
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Split window
vim.keymap.set("n", "ss", ":split<Return><C-w>w")
vim.keymap.set("n", "sv", ":vsplit<Return><C-w>w")

-- Navigate through quick list
vim.keymap.set("n", "]a", ":cnext<CR>")
vim.keymap.set("n", "[a", ":cprevious<CR>")

-- -- Select all
-- vim.keymap.set("n", "<C-a>", "gg<S-v>G")
--
-- -- Increment/decrement
-- vim.keymap.set("n", "+", "<C-a>")
-- vim.keymap.set("n", "-", "<C-x>")
