local nnoremap = require("palani.keymap").nnoremap

local silent = { silent = true }

nnoremap("<leader>t", "<cmd>TagbarToggle<cr>", silent)
