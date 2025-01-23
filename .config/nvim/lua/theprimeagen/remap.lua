vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

-- open new window session in tmux while in vim
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- vim.keymap.set("n", "Q", "<nop>")

-- format
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Split window
vim.keymap.set("n", "ss", ":split<Return><C-w>w")
vim.keymap.set("n", "sv", ":vsplit<Return><C-w>w")

-- Navigate through quick list
vim.keymap.set("n", "]a", ":cnext<CR>")
vim.keymap.set("n", "[a", ":cprev<CR>")

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- multiple line search
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- add Empty line
vim.keymap.set("n", "[<Space>", "mzO<C-c>`z")
vim.keymap.set("n", "]<Space>", "mzo<C-c>`z")

--[[
-- TODO: change by requirement;
vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)
vim.keymap.set(
    "n",
    "<leader>ea",
    "oassert.NoError(err, \"\")<Esc>F\";a"
)
vim.keymap.set(
    "n",
    "<leader>ef",
    "oif err != nil {<CR>}<Esc>Olog.Fatalf(\"error: %s\\n\", err.Error())<Esc>jj"
)
vim.keymap.set(
    "n",
    "<leader>el",
    "oif err != nil {<CR>}<Esc>O.logger.Error(\"error\", \"error\", err)<Esc>F.;i"
)
]] --

-- vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

--Don't know what about this.
--[[
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
]] --


-- copy to system clipbord
--[[
--TODO: have to check this.
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')
]] --
