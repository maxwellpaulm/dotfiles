local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = function(modes, orig, mapped, opts)
    for m in modes:gmatch"." do
        vim.keymap.set(m, orig, mapped, opts)
    end
end

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- normal navigation
keymap("nv", "j", "h", opts)
keymap("nv", "k", "j", opts)
keymap("nv", "l", "k", opts)
keymap("nv", ";", "l", opts)

-- super navigation
keymap("nv", "sk", "<C-d>", opts)
keymap("nv", "sl", "<C-u>", opts)
keymap("nv", "s;", "$", opts)
keymap("nv", "sj", "^", opts)

-- delete shortcuts
keymap("n", "d;", "d$", opts)
keymap("n", "dj", "d^", opts)

local toggle_oil = function()
  local bufnr = vim.api.nvim_win_get_buf(0)
  local dir = require("oil").get_current_dir(bufnr)
  if dir then
    return require("oil").toggle_float(dir)
  else
    -- If there is no current directory (e.g. over ssh), just default to the current dir
    return require("oil").toggle_float()
  end
end

-- tab and window navigation --
keymap("n", "cc", ":BufferPrevious<cr>", opts)
keymap("n", "vv", ":BufferNext<cr>", opts)
keymap("n", "fj", "<C-o>", opts)
keymap("n", "f;", "gd", opts)
keymap("n", "fk", "<C-w>j", opts)
keymap("n", "fl", "<C-w>l", opts)
keymap("n", "ff", toggle_oil, opts)
keymap("n", "ft", "<cmd>terminal --float", opts)
keymap("n", "fv", "<cmd>vsplit<cr>", opts)
keymap("n", "fc", "<cmd>q<cr>", opts)
keymap("n", "g;", "<C-i>", opts)
keymap("n", "gj", "<C-o>", opts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })

-- Resize with arrows
keymap("n", "<S-Up>", ":resize -2<CR>", opts)
keymap("n", "<S-Down>", ":resize +2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- Press jk fast to exit insert mode
keymap("i", "lk", "<ESC>", opts)
keymap("i", "kl", "<ESC>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

