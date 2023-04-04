---
-- whichkey bindings
---
lvim.builtin.which_key.mappings["l"].w = { "<cmd>Trouble<Cr>", "Trouble" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}
-- golang
lvim.builtin.which_key.mappings["G"] = {
  name = "Golang",
  i = { "<cmd>GoInstallDeps<Cr>", "Install Go Dependencies" },
  m = { "<cmd>GoMod tidy<cr>", "Tidy" },
  t = { "<cmd>GoTestAdd<Cr>", "Add Test" },
  ta = { "<cmd>GoTestsAll<Cr>", "Add All Tests" },
  tx = { "<cmd>GoTestsExp<Cr>", "Add Exported Tests" },
  gg = { "<cmd>GoGenerate<Cr>", "Go Generate" },
  gf = { "<cmd>GoGenerate %<Cr>", "Go Generate File" },
  gc = { "<cmd>GoCmt<Cr>", "Generate Comment" },
  gd = { "<cmd>lua require('dap-go').debug_test()<cr>", "Debug Test" },
}
-- rust specific whichkey bindings
lvim.builtin.which_key.mappings["R"] = {
  name = "Rust",
  r = { "<cmd>RustRunnables<Cr>", "Runnables" },
  t = { "<cmd>lua _CARGO_TEST()<cr>", "Cargo Test" },
  m = { "<cmd>RustExpandMacro<Cr>", "Expand Macro" },
  c = { "<cmd>RustOpenCargo<Cr>", "Open Cargo" },
  p = { "<cmd>RustParentModule<Cr>", "Parent Module" },
  d = { "<cmd>RustDebuggables<Cr>", "Debuggables" },
  v = { "<cmd>RustViewCrateGraph<Cr>", "View Crate Graph" },
  R = {
    "<cmd>lua require('rust-tools/workspace_refresh')._reload_workspace_from_cargo_toml()<Cr>",
    "Reload Workspace",
  },
  o = { "<cmd>RustOpenExternalDocs<Cr>", "Open External Docs" },
}
-- bufferline
lvim.builtin.which_key.mappings["j"] = { "<cmd>BufferLinePick<cr>", "Jump" }
