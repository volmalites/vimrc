return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        dependencies = { "mason.nvim" },
        opts = {
            ensure_installed = { "eslint", "html", "jsonls", "cssls", "ts_ls", "volar" },
            automatic_installation = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        dependencies = { "mason-lspconfig.nvim" },
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-vsnip",
        },
    },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate", -- Changed from 'run' to 'build' for Lazy.nvim
		config = function()
			require("nvim-treesitter.configs").setup {
				ensure_installed = { "c", "python", "javascript", "php", "cpp", "rust", "json", "typescript", "html", "css" },
				highlight = { enable = true },
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer", -- Select entire function
							["if"] = "@function.inner", -- Select function body
							["ac"] = "@conditional.outer", -- Select entire if statement
							["ic"] = "@conditional.inner", -- Select if statement body
						},
					},
				},
			}
		end,
	},
    { "hrsh7th/vim-vsnip" },
    { "hrsh7th/vim-vsnip-integ" },
    { "neoclide/coc.nvim", branch = "release" },
    { "simrat39/rust-tools.nvim" },
    { "ellisonleao/gruvbox.nvim" },
    {
        "Bryley/neoai.nvim",
        dependencies = { "MunifTanjim/nui.nvim" },
        cmd = {
            "NeoAI",
            "NeoAIOpen",
            "NeoAIClose",
            "NeoAIToggle",
            "NeoAIContext",
            "NeoAIContextOpen",
            "NeoAIContextClose",
            "NeoAIInject",
            "NeoAIInjectCode",
            "NeoAIInjectContext",
            "NeoAIInjectContextCode",
        },
        config = function()
            require("neoai").setup({})
        end,
    },
}
