require "user.packages"
require "user.colorscheme"
require "user.comment"
require "user.illuminate"
require "user.indentline"
require "user.keymaps"
require "user.lualine"
require "user.oil"
require "user.options"
require "user.telescope"
require "user.treesitter"
require "user.whichkey"
require "user.coc"

vim.opt.list = true
vim.opt.listchars = {
  tab = "⇥ ",
  trail = "•",
  space = "⸱", -- U+2E31 WORD SEPARATOR MIDDLE DOT
  eol = "↴",
}

vim.opt.foldenable = true
vim.opt.foldlevel = 99        -- ensures everything starts unfolded
vim.opt.foldcolumn = "1"      -- shows fold markers in the gutter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
