function get_diagnostic_counts()
    local diagnostics = vim.diagnostic.get(0)
    local error_count = 0
    local warning_count = 0

    for _, diagnostic in ipairs(diagnostics) do
        if diagnostic.severity == vim.diagnostic.severity.ERROR then
            error_count = error_count + 1
        elseif diagnostic.severity == vim.diagnostic.severity.WARN then
            warning_count = warning_count + 1
        end
    end

    return string.format("E:%d W:%d", error_count, warning_count)
end

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2     -- 4
vim.opt.softtabstop = 2 -- 4
vim.opt.shiftwidth = 2  -- 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.clipboard = "unnamedplus"

vim.o.statusline = "%f"       -- File name
vim.o.statusline = vim.o.statusline .. "%m"  -- Modified flag
vim.o.statusline = vim.o.statusline .. "%r"  -- Readonly flag
vim.o.statusline = vim.o.statusline .. "%h"  -- Help flag
vim.o.statusline = vim.o.statusline .. "%w"  -- Preview window flag
vim.o.statusline = vim.o.statusline .. " %{v:lua.get_diagnostic_counts()}" -- Diagnostic counts
vim.o.statusline = vim.o.statusline .. "%=%l,%c" -- Line and column number
