
-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For vsnip users.
      require('luasnip').lsp_expand(args.body) -- For luasnip users.
      require('snippy').expand_snippet(args.body) -- For snippy users.
      vim.fn["UltiSnips#Anon"](args.body) -- For ultisnips users.
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    { name = 'luasnip' }, -- For luasnip users.
    { name = 'ultisnips' }, -- For ultisnips users.
    { name = 'snippy' }, -- For snippy users.
    { name = 'buffer' },
  },
})

-- Set configuration for specific filetype.
cmp.setup.buffer({
  sources = {
    { name = 'git' },
    { name = 'buffer' },
  },
})

-- Use buffer source for `/` and `?`.
cmp.setup.cmdline('/', {
  sources = { { name = 'buffer' } },
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
  sources = {
    { name = 'path' },
    { name = 'cmdline' },
  },
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Replace '<YOUR_LSP_SERVER>' with the actual name of the LSP server.

