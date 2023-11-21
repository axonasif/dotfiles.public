local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local uv = vim.uv or vim.loop

-- Auto-install lazy.nvim if not present
if not uv.fs_stat(lazypath) then
	print("Installing lazy.nvim....")
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
	print("Done.")
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- dependencies
	"nvim-lua/plenary.nvim",

	-- icons
	"nvim-tree/nvim-web-devicons",

	-- fuzzy finder
	"ibhagwan/fzf-lua",

	-- window navigation
	"christoomey/vim-tmux-navigator",

	-- comments in nvim
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	"JoosepAlviste/nvim-ts-context-commentstring",

	-- AI Autocompletion
	"github/copilot.vim",

	-- color theme
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},

	-- formatter
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre", "BufNewFile" },
	},

	-- linter
	{
		"mfussenegger/nvim-lint",
		event = { "BufWritePre", "BufNewFile" },
	},

	-- treesitter syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufWritePre", "BufNewFile" },
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	},

	-- git signs
	"lewis6991/gitsigns.nvim",

	-- surround
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},

	-- nvim colors
	"norcalli/nvim-colorizer.lua",

	-- file explorer
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- refactoring code
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},

	-- harpooooon for quick file switching
	"ThePrimeagen/harpoon",

	-- better ts tools
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},

	-- lsp progress
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
	},

	-- lsp
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
		config = false,
		init = function()
			-- Disable automatic setup, we are doing it manually
			vim.g.lsp_zero_extend_cmp = 0
			vim.g.lsp_zero_extend_lspconfig = 0
		end,
		dependencies = {
			-- Mason Support for installing and managing LSP Servers
			{
				"williamboman/mason.nvim",
				lazy = false,
				config = true,
			},
			"williamboman/mason-lspconfig.nvim",

			-- LSP Support
			{
				"neovim/nvim-lspconfig",
				dependencies = {
					-- Autocompletion
					{
						"hrsh7th/nvim-cmp",
						dependencies = {
							{
								"L3MON4D3/LuaSnip",
								dependencies = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" },
							},
						},
					},
					"hrsh7th/cmp-nvim-lsp",
					"hrsh7th/cmp-nvim-lua",
					"hrsh7th/cmp-buffer",
					"hrsh7th/cmp-path",
				},
			},
		},
	},
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		opts = {},
	},
	-- send commands from vim to tmux terminal, example executing the current js/java file
	-- "slarwise/vim-tmux-send",
})
