return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = {
        cs = { "dotnet_format" }, -- Swap csharpier for the native formatter
      }
    end,
  },
}
