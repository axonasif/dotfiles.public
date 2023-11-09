local nnoremap = require("palani.keymap").nnoremap

-- replacement for tsserver
require("typescript-tools").setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false

		if vim.lsp.inlay_hint then
			vim.lsp.inlay_hint(bufnr, true)
		end
	end,
	settings = {
		tsserver_file_preferences = {
			-- Inlay Hints
			includeInlayParameterNameHints = "all",
			includeInlayParameterNameHintsWhenArgumentMatchesName = true,
			includeInlayFunctionParameterTypeHints = true,
			includeInlayVariableTypeHints = true,
			includeInlayVariableTypeHintsWhenTypeMatchesName = true,
			includeInlayPropertyDeclarationTypeHints = true,
			includeInlayFunctionLikeReturnTypeHints = true,
			includeInlayEnumMemberValueHints = true,
		},
	},
})

if vim.lsp.inlay_hint then
	vim.keymap.set("n", "<leader>l", function()
		vim.lsp.inlay_hint(0, nil)
	end, { desc = "Toggle Inlay Hints" })
end
