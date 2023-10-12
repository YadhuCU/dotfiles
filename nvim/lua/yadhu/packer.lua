
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	--Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.3',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
  use 'nvim-telescope/telescope-file-browser.nvim'

  use 'kyazdani42/nvim-web-devicons' -- File icons


	--Color Theme
	use({ 'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
			vim.cmd('colorscheme rose-pine')
		end

	})

	--Treesitter
	use( 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
	use( 'nvim-treesitter/playground' )

  --LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  --Autopair
  use 'windwp/nvim-autopairs'

  --Autotag
  use 'windwp/nvim-ts-autotag'

  --Commment
  use { 'numToStr/Comment.nvim',
  requires = {
    'JoosepAlviste/nvim-ts-context-commentstring'
  }

}

  --Undotree
  use 'mbbill/undotree'

  --Gitgigns
  use 'lewis6991/gitsigns.nvim'

  --Colorizer
  use 'norcalli/nvim-colorizer.lua'

  --Blankline
  use "lukas-reineke/indent-blankline.nvim"

  --Code formatter
  use "jose-elias-alvarez/null-ls.nvim"

  --Lualine
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }


}

end)
