vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "x",
      [vim.diagnostic.severity.WARN] = "!",
      [vim.diagnostic.severity.INFO] = "i",
      [vim.diagnostic.severity.HINT] = "?",
    },
  },
  underline = true,
  update_in_insert = true,
  severity_sort = true,
  virtual_text = false,
  virtual_lines = {
    current_line = true,
  },
})

vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*:i",
  callback = function()
    vim.diagnostic.config({
      virtual_text = {
        current_line = true,
      },
      virtual_lines = false,
    })
  end,
})

vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*:n",
  callback = function()
    vim.diagnostic.config({
      virtual_text = false,
      virtual_lines = {
        current_line = true,
      },
    })
  end,
})
