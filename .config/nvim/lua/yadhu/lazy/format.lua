return {
	{
		"stevearc/conform.nvim",
		dependencies = {
			"j-hui/fidget.nvim",
		},
		config = function()
			local fidget = require("fidget")

			require("conform").setup({
        --[[
				format_on_save = {
					timeout_ms = 500,
					lsp_format = "fallback",
				},
        ]]--
        autoformat = false,
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "isort", "black" },
					javascript = { "prettier", lsp_format = "fallback" },
					javascriptreact = { "prettier", lsp_format = "fallback" },
					typescript = { "prettier", lsp_format = "fallback" },
					typescriptreact = { "prettier", lsp_format = "fallback" },
				},
			})
			-- Use vim.lsp.buf.format() to trigger Prettier formatting
			vim.keymap.set("n", "<leader>f", function()
				local task = fidget.progress.handle.create({
					title = "Formatting",
					message = "Running conform...",
					lsp_client = { name = "conform.nvim" },
				})
				require("conform").format({
					bufnr = 0,
					async = true,
					lsp_fallback = true,
				}, function()
					task:finish({ message = "Done!" })
				end)
			end, { silent = true })
		end,
	},
}
