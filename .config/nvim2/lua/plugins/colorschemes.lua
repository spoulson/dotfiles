return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    opts = {
      contast = "soft",
    },
  },
  { "catppuccin/nvim", lazy = true },
  {
    "neanias/everforest-nvim",
    lazy = true,
    config = function()
      ---@diagnostic disable: missing-fields
      require("everforest").setup {
        background = "hard",
      }
    end,
  },
}
