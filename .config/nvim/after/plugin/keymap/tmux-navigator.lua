
local nnoremap = require("palani.keymap").nnoremap

local silent = { silent = true }

nnoremap("<C-l>", "<cmd>TmuxNavigateRight<CR>", silent)

-- A hack to disable NetrwRefresh's mapping to C-l
nnoremap("<C-Refresh>", "<Plug>NetrwRefresh", silent)
