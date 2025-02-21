return {
  {
    dir = "~/yadhu/development/donut",
    config = function()
      local donut = require "donut"
      vim.keymap.set("n", "<leader>do", function() donut.run_donut() end)
    end
  }
}
