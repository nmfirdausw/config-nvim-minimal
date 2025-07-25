vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

local statuscolumn = function()
  local lnum = vim.v.lnum
  local bufnr = vim.api.nvim_get_current_buf()
  local signs = vim.fn.sign_getplaced(bufnr, { lnum = lnum, group = "*" })[1].signs
  local marks = vim.api.nvim_buf_get_extmarks(bufnr, -1, { lnum - 1, 0 }, { lnum - 1, -1 }, { details = true })
  local fillchars = vim.opt.fillchars:get()
  local statuscolumn = "%=%4r%4l"

  if vim.opt.number:get() or vim.opt.relativenumber:get() then
    statuscolumn = statuscolumn .. "  "
  end

  if vim.opt.signcolumn:get() == "no" then
    return statuscolumn .. " "
  end

  if vim.opt.foldenable:get() then
    if vim.fn.foldlevel(lnum) > 0 then
      if vim.fn.foldclosed(lnum) ~= -1 then
        return statuscolumn .. fillchars.foldclose .. "  "
      end

      if vim.fn.foldlevel(lnum) > vim.fn.foldlevel(lnum - 1) then
        if #signs > 0 and not signs[1].group:match("gitsigns_signs_") then
          return statuscolumn .. "%s "
        end

        return statuscolumn .. fillchars.foldopen .. "  "
      end
    end
  end

  if #signs > 0 then
    return statuscolumn .. "%s "
  end

  return statuscolumn .. "│  "
end

_G.StatusColumn = statuscolumn
vim.o.statuscolumn = "%{%v:lua._G.StatusColumn()%}"

-- Disable statuswolumn for help file
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
  callback = function()
    if vim.bo.buftype == "help" then
      vim.opt_local.statuscolumn = ""
      vim.opt_local.number = false
      vim.opt_local.signcolumn = "no"
    end
  end,
})
