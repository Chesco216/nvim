-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- cmp Tab navigation
vim.api.nvim_set_keymap("n", "<leader>m", "<CMD>Markview<CR>", { desc = "Toggles `markview` previews globally." })
vim.keymap.set("n", "<leader>l", function()
  if vim.bo.filetype == "neo-tree" then
    vim.cmd("wincmd p") -- jump to previous window
  else
    vim.cmd("Neotree focus")
  end
end, { desc = "Toggle Neo-tree focus" })
-- vim.keymap.set("n", "<Tab>", ":tabnext<CR>", { silent = true })
-- vim.keymap.set("n", "<S-Tab>", ":tabprevious<CR>", { silent = true })
