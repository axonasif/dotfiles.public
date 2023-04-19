local nnoremap = require("palani.keymap").nnoremap
local vnoremap = require("palani.keymap").vnoremap

--moving around selected text in visual mode
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

nnoremap("<leader-y>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
nnoremap("<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--window management
  --window navigation 
    -- nnoremap("<C-j>", "<C-w>h")
    -- nnoremap("<C-k>", "<C-w>l")
  --window size management
    nnoremap("<C-Left>", ":vertical resize -3<CR>")
    nnoremap("<C-Right>", ":vertical resize +3<CR>")
    nnoremap("<C-Up>", ":resize -3<CR>")
    nnoremap("<C-Down>", ":resize +3<CR>")

--jumping around vim vertically
  nnoremap("<C-d>","<C-d>zz")
  nnoremap("<C-u>","<C-u>zz")

--navigating while searching
  nnoremap("n","nzzzv")
  nnoremap("N","Nzzzv")
