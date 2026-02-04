return {
  "nvim-telescope/telescope.nvim",

  tag = "0.1.5",

  dependencies = {
    "nvim-lua/plenary.nvim"
  },

  -- TODO: need to work on it.
  config = function()
    require('telescope').setup({})

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader><space>', builtin.find_files, { desc = "Telescop find files"})
    vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Telescop git files"})

    --[[
    vim.keymap.set('n', '<leader>pws', function()
        local word = vim.fn.expand("<cword>")
        builtin.grep_string({ search = word })
    end)
    ]] --
    vim.keymap.set('n', '<leader>/', builtin.live_grep, { desc = "Telescop live grep"} )

    --[[
    vim.keymap.set('n', '<leader>pWs', function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end)
    vim.keymap.set('n', '<leader>ps', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)
    ]]--
    vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    require "lua.yadhu.lazy.telescope.multigrep".setup()
  end
}
