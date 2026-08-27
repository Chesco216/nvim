return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true, -- Show dotfiles like .env
            ignored = true, -- Show files ignored by .gitignore
          },
          files = {
            hidden = true, -- Applies when finding files with <leader><leader>
            ignored = true,
          },
        },
      },
    },
  },
}
