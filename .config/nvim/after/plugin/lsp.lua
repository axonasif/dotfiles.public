local lsp_zero = require("lsp-zero")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
local luasnip = require("luasnip")
local nnoremap = require("palani.keymap").nnoremap
local conform = require("conform")

vim.opt.completeopt = { "menu", "menuone", "noselect" }
mason.setup({})
mason_lspconfig.setup({
	ensure_installed = {
		"lua_ls",
		"html",
		"cssls",
		"bashls",
		"gopls",
		"tailwindcss",
	},

	handlers = {
		lsp_zero.default_setup,
		-- to avoid global variable vim error
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require("lspconfig").lua_ls.setup(lua_opts)
		end,
	},
})

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
	local options = { buffer = bufnr, remap = false }

	if vim.bo.filetype == "typescript" or vim.bo.filetype == "typescriptreact" then
		nnoremap("gd", "<cmd>TSToolsGoToSourceDefinition<CR>", options)
	else
		nnoremap("gd", vim.lsp.buf.definition, options)
	end

	if vim.bo.filetype == "typescript" or vim.bo.filetype == "typescriptreact" then
		nnoremap("frn", "<cmd>TSToolsRenameFile<CR>", options)
	end

	nnoremap("K", vim.lsp.buf.hover, options)
	nnoremap("gn", vim.diagnostic.goto_next, options)
	nnoremap("gp", vim.diagnostic.goto_prev, options)
	nnoremap("gD", vim.lsp.buf.declaration, options)
	nnoremap("gt", vim.lsp.buf.type_definition, options)
	nnoremap("gi", vim.lsp.buf.implementation, options)
	nnoremap("<leader>ca", vim.lsp.buf.code_action, options)
	nnoremap("<leader>gr", vim.lsp.buf.references, options)
	nnoremap("<leader>rn", vim.lsp.buf.rename, options)
	nnoremap("<space>e", vim.diagnostic.open_float, options)
	nnoremap("<space>q", vim.diagnostic.setloclist, options)
	vim.keymap.set({ "n", "v", "x" }, "<leader>i", function()
		conform.format({
			lsp_fallback = true,
			async = false,
			timeout_ms = 10000,
		})
	end)
end)

vim.diagnostic.config({
	virtual_text = false,
})

lsp_zero.set_preferences({
	file_ignore_patterns = { "*.d.ts" },
	suggest_lsp_servers = true,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

-- add vscode like snippets support
require("luasnip.loaders.from_vscode").lazy_load()

-- add .tsx snippets support for .ts files
require("luasnip").filetype_extend("typescript", { "typescriptreact" })

cmp.setup({
	sources = {
		{ name = "path" },
		{ name = "luasnip" }, -- For luasnip users.
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "buffer" },
	},
	window = {
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		-- changing the order of fields so the icon is the first
		fields = { "menu", "abbr", "kind" },
		snippet = {
			-- REQUIRED - you must specify a snippet engine
			expand = function(args)
				require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			end,
		},

		-- here is where the change happens
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = "λ",
				luasnip = "⋗",
				buffer = "Ω",
				path = "🖫",
				nvim_lua = "Π",
			}

			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end,
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		-- Disable Tab key to navigate completion menu for AI completions
		["<Tab>"] = cmp.config.disable,
		["<S-Tab>"] = cmp_action.luasnip_supertab(),

		-- Ctrl+Space to trigger completion menu
		["<C-Space>"] = cmp.mapping.complete(),

		-- Navigate between snippet placeholder
		["<C-f>"] = cmp_action.luasnip_jump_forward(),
		["<C-b>"] = cmp_action.luasnip_jump_backward(),

		-- Scroll up and down in the completion documentation
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
	}),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})
