local lint = require("lint")
local nnoremap = require("palani.keymap").nnoremap

lint.linters_by_ft = {
	css = { "eslint_d" },
	javascript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescript = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	markdown = { "markdownlint" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile", "BufWritePost" }, {
	callback = function()
		lint.try_lint()
	end,
})

nnoremap("<leader>l", function()
	lint.try_lint()
end, { silent = true, desc = "Trigger linting for current buffer" })
