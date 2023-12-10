local nnoremap = require("palani.keymap").nnoremap

local silent = { silent = true }

local harpoon = require("harpoon")

harpoon:setup()

nnoremap("<leader>a", function()
	harpoon:list():append()
end)
nnoremap("<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)
nnoremap("<C-b>", function()
	harpoon:list():select(1)
end)
nnoremap("<C-i>", function()
	harpoon:list():select(2)
end)
nnoremap("<C-g>", function()
	harpoon:list():select(3)
end)
nnoremap("<C-s>", function()
	harpoon:list():select(4)
end)
