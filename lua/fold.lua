vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.fillchars:append({
  foldopen = "-",
  foldclose = "+",
})

vim.pack.add({
  "https://github.com/kevinhwang91/nvim-ufo",
})

-- Fold provider [ lsp, treesitter, indent ] per filetype
local ftprovider = {
  lua = "indent",
}

require("ufo").setup({
  ---@diagnostic disable-next-line: unused-local
  provider_selector = function(bufnr, filetype, buftype)
    return ftprovider[filetype]
  end,
})
