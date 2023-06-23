vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>vert Git<CR>",
{ noremap = true, silent = true })

require('gitsigns').setup()

