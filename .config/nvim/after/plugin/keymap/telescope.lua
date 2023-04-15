local Remap = require("palani.keymap")
local nnoremap = Remap.nnoremap

-- telescope settings
local actions = require("telescope.actions")

require("telescope").setup({
  defaults = {
    mappings = {
      i = {
            ["<esc>"] = actions.close,
      },
    },
    file_ignore_patterns = {
      "vendor/*",
      "%.lock",
      "__pycache__/*",
      "%.sqlite3",
      "%.ipynb",
      "node_modules/*",
      "%.jpg",
      "%.jpeg",
      "%.png",
      "%.svg",
      "%.otf",
      "%.ttf",
      ".git/",
      "%.webp",
      ".dart_tool/",
      ".github/",
      ".gradle/",
      ".idea/",
      ".settings/",
      ".vscode/",
      "__pycache__/",
      "build/",
      "env/",
      "gradle/",
      "node_modules/",
      "target/",
      "%.pdb",
      "%.dll",
      "%.class",
      "%.exe",
      "%.cache",
      "%.ico",
      "%.pdf",
      "%.dylib",
      "%.jar",
      "%.docx",
      "%.met",
      "smalljre_*/*",
      ".vale/",
    }
  },
})

function FuzzyFindFiles()
  require('telescope.builtin').grep_string({
    path_display = { 'smart' },
    only_sort_text = true,
    word_match = "-w",
    search = '',
    shorten_path = true,
    layout_config = {
      preview_width = 0.6,
    },
  })
end

nnoremap("<Leader>f", function()
  require('telescope.builtin').find_files()
end)

nnoremap("<Leader>g", '<cmd>lua FuzzyFindFiles{}<cr>')

-- nnoremap("<Leader>g", function()
--   require('telescope.builtin').live_grep()
-- end)
