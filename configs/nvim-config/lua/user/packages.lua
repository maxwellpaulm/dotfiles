local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])

end

-- Autocommand that reloads neovim whenever you save the packages.lua file
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost packages.lua source <afile> | PackerSync
    augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({ display = { open_fn = function() return require("packer.util").float({ border = "rounded" }) end } })

-- Install your plugins here
return packer.startup(function(use)

    -- Base
    use { "wbthomason/packer.nvim" } -- Have packer manage itself
    use { "nvim-lua/plenary.nvim" } -- Useful lua functions used by lots of plugins
    use { "windwp/nvim-autopairs" } -- Autopairs, integrates with both cmp and treesitter

    -- Quality of Life
    use { "numToStr/Comment.nvim" }
    use { "Pocco81/auto-save.nvim" }

    -- LSP
    use { "neoclide/coc.nvim", branch = "release"}
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use { "lukas-reineke/indent-blankline.nvim" }
    use { "RRethy/vim-illuminate" }

	-- Navigation
    use { "nvim-lualine/lualine.nvim", requires = { 'nvim-tree/nvim-web-devicons', opt = true } }
    use { "stevearc/oil.nvim" }

    -- Search
    use { "nvim-telescope/telescope.nvim", requires = {'nvim-lua/plenary.nvim'}}
    use { "nvim-telescope/telescope-file-browser.nvim", requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }}

    -- Colorschemes
    use { "lunarvim/darkplus.nvim" }
    use { "EdenEast/nightfox.nvim"}

	-- Shortcuts
    use {"folke/which-key.nvim" } -- Whichkey allows for leaderkey shortcuts

    -- Personal Packages - will not install without ".personal" being present
    -- this is to avoid installing packages on company computers that might violate policies
    -- these packages will NOT install by default
    local has_personal = vim.fn.filereadable(vim.fn.expand("~/.config/nvim/.personal")) == 1

        if has_personal then
            use {
                "github/copilot.vim",
                config = function()
                    vim.g.copilot_no_tab_map = true
                    vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
                end
            }
        end
    -- Automatically set up your configuration after cloning packer.nvim
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end

end)
