-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = ".env*",
  callback = function()
    vim.bo.filetype = "sh"
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "bashls" then
      -- Disable unused variable warnings for .env files
      client.server_capabilities.documentSymbolProvider = false
    end
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "neo-tree",
  callback = function()
    vim.keymap.set("n", "l", function()
      local node = require("neo-tree.sources.manager").get_state("filesystem").tree:get_node()
      if node.type == "file" then
        vim.cmd("tabedit " .. node.path)
      else
        require("neo-tree.sources.filesystem.commands").open(
          require("neo-tree.sources.manager").get_state("filesystem")
        )
      end
    end, { buffer = true })
  end,
})
