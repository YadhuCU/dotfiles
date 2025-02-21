return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    -- Setup Prettier with null-ls
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier
      }
    })

    -- Use vim.lsp.buf.format() to trigger Prettier formatting
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, { silent = true })
  end
}

