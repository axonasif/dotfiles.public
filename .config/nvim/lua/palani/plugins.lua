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

	{ "kevinhwang91/nvim-bqf" },

	-- comments in nvim
	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
		event = "VeryLazy",
	},
	"JoosepAlviste/nvim-ts-context-commentstring",

	-- AI Autocompletion
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
					debounce = 75,
					keymap = {
						accept = "<Tab>",
						accept_word = false,
						accept_line = false,
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
			})
		end,
	},

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
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = true,
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					move = {
						enable = true,
						goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
						goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
						goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
						goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
					},

					select = {
						enable = true,

						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,
						keymaps = {
							["ac"] = { query = "@call.outer", desc = "Select outer part of a function call" },
							["ic"] = { query = "@call.inner", desc = "Select inner part of a function call" },

							["af"] = {
								query = "@function.outer",
								desc = "Select outer part of a method/function definition",
							},
							["if"] = {
								query = "@function.inner",
								desc = "Select inner part of a method/function definition",
							},
						},
					},
				},
			})
		end,
	},

	-- TODO: comments
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"]t",
				function()
					require("todo-comments").jump_next()
				end,
				desc = "Next todo comment",
			},
			{
				"[t",
				function()
					require("todo-comments").jump_prev()
				end,
				desc = "Previous todo comment",
			},
		},
	},

	-- git signs
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		opts = function()
			local C = {
				on_attach = function(buffer)
					local gs = package.loaded.gitsigns
					local function map(mode, l, r, desc)
						vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
					end
					map("n", "]g", gs.next_hunk, "Next Hunk")
					map("n", "[g", gs.prev_hunk, "Prev Hunk")
				end,
			}
			return C
		end,
	},
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
	{ "norcalli/nvim-colorizer.lua" },

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
	-- { "ThePrimeagen/harpoon", event = "VeryLazy" },
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } },
		event = "VeryLazy",
	},

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
				cmd = "LspInfo",
				event = { "BufReadPre", "BufNewFile" },
				dependencies = {
					-- Autocompletion
					"saadparwaiz1/cmp_luasnip",
					"rafamadriz/friendly-snippets",
					{
						"hrsh7th/nvim-cmp",
						event = "InsertEnter",
						dependencies = {
							{
								"L3MON4D3/LuaSnip",
								dependencies = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" },
							},
						},
					},
					{
						"L3MON4D3/LuaSnip",
						dependencies = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" },
					},
					"hrsh7th/cmp-nvim-lsp",
					"hrsh7th/cmp-nvim-lua",
					"hrsh7th/cmp-buffer",
					"hrsh7th/cmp-path",
				},
			},
		},
	},
	-- send commands from vim to tmux terminal, example executing the current js/java file
	-- "slarwise/vim-tmux-send",
})
