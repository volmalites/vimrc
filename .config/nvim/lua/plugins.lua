local use = require('packer').use

require('packer').startup(function()
	use 'wbthomason/packer.nvim'

	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	--use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}
	use 'hrsh7th/vim-vsnip'
	use 'hrsh7th/vim-vsnip-integ'
	use { 'neoclide/coc.nvim', branch = 'release' }
	use 'simrat39/rust-tools.nvim'
	use 'williamboman/mason.nvim'
	use 'savq/melange-nvim'
end)
