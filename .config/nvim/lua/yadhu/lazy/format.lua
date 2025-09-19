return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "williamboman/mason.nvim", "jay-babu/mason-null-ls.nvim" },
  config = function()
    local null_ls = require("null-ls")
    local mason_null_ls = require("mason-null-ls")

    mason_null_ls.setup({
      ensure_installed = { "black", "isort" },
      automatic_setup = true,
    })

    -- Setup Prettier with null-ls
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
      }
    })

    -- Use vim.lsp.buf.format() to trigger Prettier formatting
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, { silent = true })
  end
}
