local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		go = { "gofumpt", "goimports", "golines" },
		css = { "prettierd" },
		javascript = { "prettierd" },
		javascriptreact = { "prettierd" },
		typescript = { "prettierd" },
		typescriptreact = { "prettierd" },
		markdown = { "prettierd" },
		lua = { "stylua" },
		sh = { "shfmt" },
		zsh = { "shfmt" },
	},
	-- timeout_ms = 10000,
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 10000,
	},
})
