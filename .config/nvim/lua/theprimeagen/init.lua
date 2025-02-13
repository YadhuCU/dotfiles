require("theprimeagen.set")
require("theprimeagen.remap")
require("theprimeagen.lazy_init")

-- DO.not
-- DO NOT INCLUDE THIS

-- If i want to keep doing lsp debugging
-- function restart_htmx_lsp()
--     require("lsp-debug-tools").restart({ expected = {}, name = "htmx-lsp", cmd = { "htmx-lsp", "--level", "DEBUG" }, root_dir = vim.loop.cwd(), });
-- end

-- DO NOT INCLUDE THIS
-- DO.not

local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup('ThePrimeagen', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
  require("plenary.reload").reload_module(name)
end

vim.filetype.add({
  extension = {
    templ = 'templ',
  }
})

autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})

autocmd({ "BufWritePre" }, {
  group = ThePrimeagenGroup,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

autocmd('BufEnter', {
  group = ThePrimeagenGroup,
  callback = function()
    --[[
        if vim.bo.filetype == "zig" then
            vim.cmd.colorscheme("tokyonight-night")
        else
            vim.cmd.colorscheme("rose-pine-moon")
        end
    ]] --
    vim.cmd("Copilot disable")
  end
})

autocmd('LspAttach', {
  group = ThePrimeagenGroup,
  callback = function(e)
    local opts = { buffer = e.buf }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>cr", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
  end
})

vim.api.nvim_create_user_command("S", function(opts)

  local input = opts.fargs[1]
  local parts = vim.split(input, "/", { plain = true })

  if #parts < 2 then
    print("Usage :[range]S/find/replace/flag")
    return
  end

  local find = parts[2]
  local replace = parts[3]
  local flag = parts[4] or ""
  local range
  local start_line = opts.line1
  local end_line = opts.line2

  if opts.range == 0 then
    range = "."
  else
    range = string.format("%d,%d", start_line, end_line)
  end

  find = vim.fn.escape(find, "/")

  local cmd = string.format(
    [[%s s/\c%s/\=submatch(0)[0] ==# toupper(submatch(0)[0]) ? '%s' : '%s'/%s]],
    range,
    find,
    replace:sub(1,1):upper() .. replace:sub(2),
    replace:lower(),
    flag
  )

  local ns_id = vim.api.nvim_create_namespace("SubstitutionHighlight")
  print("ns_id",ns_id)

  vim.cmd(cmd)
end, { nargs = "+", range = true })


vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
