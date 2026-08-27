-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
-- vim.opt.wrap = true
vim.diagnostic.config({
  virtual_text = false, -- hides the inline floating text completely
  signs = true, -- keeps the gutter icons (the E/W symbols)
  underline = true, -- keeps the underline on the problematic code
  float = {
    border = "rounded",
    source = true, -- shows which linter/lsp threw the error
  },
})
vim.keymap.set("n", "<leader>h", vim.diagnostic.open_float, { desc = "Show diagnostic" })
