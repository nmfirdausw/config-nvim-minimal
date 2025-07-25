_G.Utils = require("config.utils")

require("config.options")
require("config.dependencies")
require("config.treesitter")
require("config.folding")
require("config.statuscolumn")
require("config.formatting")
require("config.keymaps")

if Utils.is_git_dir() then
  require("config.git")
end

require("config.copilot")
