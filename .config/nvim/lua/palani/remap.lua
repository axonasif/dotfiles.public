local nnoremap = require("palani.keymap").nnoremap
local vnoremap = require("palani.keymap").vnoremap

--moving around selected text in visual mode
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

-- tmux navigator
nnoremap("<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- search and replace
nnoremap("<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- disable up, down, left and right arrow keys
nnoremap("<up>", "<nop>")
nnoremap("<down>", "<nop>")
nnoremap("<left>", "<nop>")
nnoremap("<right>", "<nop>")

--window size management
nnoremap("<C-Left>", ":vertical resize -3<CR>")
nnoremap("<C-Right>", ":vertical resize +3<CR>")
nnoremap("<C-Up>", ":resize -3<CR>")
nnoremap("<C-Down>", ":resize +3<CR>")

--jumping around vim vertically
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- pasting on new line
nnoremap("<C-p>", "<cmd>pu<CR>")

-- copying the entire file
nnoremap("<leader>y", "ggyG")

-- selecting the entire file
nnoremap("<leader>v", "ggVG")

-- add a new line without entering insert mode
nnoremap("<leader>o", "mOo<Esc>`O")
nnoremap("<leader>O", "moO<Esc>`o")

--navigating while searching
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
