local statuscolumn = function()
  local statuscolumn = "%=%4r%4l"
  if vim.opt.number:get() or vim.opt.relativenumber:get() then
    statuscolumn = statuscolumn .. "  "
  end
  if vim.opt.signcolumn:get() == "no" then
    return statuscolumn .. " "
  end
  return statuscolumn .. "│  "
end

_G.StatusColumn = statuscolumn
vim.o.statuscolumn = "%{%v:lua._G.StatusColumn()%}"

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
  callback = function()
    if vim.bo.buftype == "help" then
      vim.opt_local.statuscolumn = ""
      vim.opt_local.number = false
      vim.opt_local.signcolumn = "no"
    end
  end,
})
