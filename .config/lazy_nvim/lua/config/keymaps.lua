-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

---@cast keys LazyKeysHandler
local keys = require("lazy.core.handler").handlers.keys

local function map(mode, lhs, rhs, opts)
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    -- opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- extra save file keymap other than C-s
map("n", "<leader>w", "<cmd>w<cr><esc>", { desc = "Save file", silent = true })

-- Remove the LazyVim (distro) provided 'windows' keymaps and set custom ones
-- https://github.com/LazyVim/LazyVim/blob/01fbeb139b9fceb775fefc91f27835408a4f04a9/lua/lazyvim/config/keymaps.lua#L133-L139
local stock_keys = {
  "<leader>ww",
  "<leader>wd",
  "<leader>w-",
  "<leader>w|",
  "<leader>-",
  "<leader>|",
}

for _, key in ipairs(stock_keys) do
  vim.api.nvim_del_keymap("n", key)
end

map("n", "<leader>Ww", "<C-W>p", { desc = "Other window" })
map("n", "<leader>Wd", "<C-W>c", { desc = "Delete window" })
map("n", "<leader>W-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>W|", "<C-W>v", { desc = "Split window right" })
map("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right" })
