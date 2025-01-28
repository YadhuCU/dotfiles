return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "InsertEnter",
  opts = {
    suggestion = {
      enabled = not vim.g.ai_cmp,
      auto_trigger = true,
      keymap = {
        accept = "<C-l>",
        next = "<M-]>",
        prev = "<M-[>",
      },
    },
    panel = { enabled = false },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
  config = function(_, opts)
    require("copilot").setup(opts)

    vim.keymap.set(
      "n",
      "<leader>cpd",
      function()
        vim.cmd("Copilot disable")
        print("Copilot disabled")
      end,
      { desc = "Disable Copilot" })

    vim.keymap.set(
      "n",
      "<leader>cpe",
      function()
        vim.cmd("Copilot enable")
        print("Copilot enabled")
      end,
      { desc = "Disable Copilot" })

    vim.keymap.set("n", "<leader>cps", "<cmd>Copilot status<CR>", { desc = "Disable Copilot" })
  end
}
