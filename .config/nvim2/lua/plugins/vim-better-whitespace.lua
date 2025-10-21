return {
  "ntpeters/vim-better-whitespace",
  lazy = false,
  -- https://github.com/ntpeters/vim-better-whitespace/issues/172#issuecomment-2778894757
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "SnacksDashboardOpened",
      callback = function() vim.cmd [[DisableWhitespace]] end,
    })
  end,
}
