local nnoremap = require("palani.keymap").nnoremap

require("fzf-lua").setup({
	"telescope",
	winopts = { preview = { default = "bat" } },
	grep = {
		rg_opts = "--column --hidden --line-number --no-heading --color=always --smart-case --max-columns=4096 -g '!.git'",
	},
})

nnoremap(
	"<leader>h",
	"<cmd>lua require('fzf-lua').live_grep_native({ fzf_opts = {['--layout'] = 'reverse-list'} })<CR>",
	{ silent = true }
)

nnoremap(
	"<leader>q",
	"<cmd>lua require('fzf-lua').quickfix({ fzf_opts = {['--layout'] = 'reverse-list'} })<CR>",
	{ silent = true }
)

nnoremap(
	"<leader>rh",
	"<cmd>lua require('fzf-lua').live_grep_native({ fzf_opts = {['--layout'] = 'reverse-list'} , resume = true })<CR>",
	{ silent = true }
)

nnoremap(
	"<leader>j",
	"<cmd>lua require('fzf-lua').lsp_references({ fzf_opts = {['--layout'] = 'reverse-list'} })<CR>",
	{ silent = true }
)

nnoremap(
	"<leader>f",
	"<cmd>lua require('fzf-lua').files({ fzf_opts = {['--layout'] = 'reverse-list'} })<CR>",
	{ silent = true }
)
nnoremap(
	"<leader>rf",
	"<cmd>lua require('fzf-lua').files({ fzf_opts = {['--layout'] = 'reverse-list'}, resume= true})<CR>",
	{ silent = true }
)

nnoremap(
	"<leader>wd",
	"<cmd>lua require('fzf-lua').lsp_workspace_diagnostics({ fzf_opts = {['--layout'] = 'reverse-list'} })<CR>",
	{ silent = true }
)

nnoremap("<leader>g", ":lua _G.live_grep_cwd()<CR>", { silent = true })
nnoremap("<leader>u", "<cmd>lua require('fzf-lua').resume()<CR>", { silent = true })

_G.live_grep_cwd = function()
	require("fzf-lua").fzf_exec("fd --type d", {
		actions = {
			["default"] = function(sel, opts)
				require("fzf-lua").live_grep({ cwd = sel[1] })
			end,
		},
	})
end
