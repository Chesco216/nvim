return {
  -- Remove the old typescript.nvim dep entirely
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ts_ls = {}, -- replaces tsserver
      },
    },
  },

  -- Modern TypeScript plugin (replaces jose-elias-alvarez/typescript.nvim)
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { -- 👈 tell lazy when to load it
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    opts = {
      filetypes = { -- 👈 explicit filetype registration
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
      },
      settings = {
        -- Auto-import on completion
        tsserver_file_preferences = {
          importModuleSpecifierPreference = "relative",
          includeCompletionsForModuleExports = true,
          includeCompletionsWithInsertText = true,
          includeAutomaticOptionalChainCompletions = true,
        },
        -- Inlay hints
        tsserver_plugins = {},
        expose_as_code_action = {
          "fix_all",
          "add_missing_imports", -- 👈 this is your auto-import
          "remove_unused_imports",
        },
      },
      on_attach = function(_, buffer)
        vim.keymap.set(
          "n",
          "<leader>co",
          "<cmd>TSToolsOrganizeImports<cr>",
          { buffer = buffer, desc = "Organize Imports" }
        )
        vim.keymap.set("n", "<leader>cR", "<cmd>TSToolsRenameFile<cr>", { buffer = buffer, desc = "Rename File" })
        vim.keymap.set(
          "n",
          "<leader>ci",
          "<cmd>TSToolsAddMissingImports<cr>",
          { buffer = buffer, desc = "Add Missing Imports" }
        )
        vim.keymap.set(
          "n",
          "<leader>cu",
          "<cmd>TSToolsRemoveUnusedImports<cr>",
          { buffer = buffer, desc = "Remove Unused Imports" }
        )
      end,
    },
  },
}
