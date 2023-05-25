-- Basic Settings
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.swapfile = false
vim.opt.updatetime = 100

-- Keymaps
vim.g.mapleader = " "
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<leader>[", ":GitGutterNextHunk<CR>")
map("n", "<leader>]", ":GitGutterPrevHunk<CR>")
map("n", "<leader>gd", ":GitGutterDiffOrig<CR>")
map("n", "<F5>", ":UndotreeToggle<CR>")

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
vim.cmd [[colorscheme dracula]]

require('lspconf')
require('treesitter')
require('telescop')
require('Comment').setup()

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }
  use 'nvim-treesitter/nvim-treesitter'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'airblade/vim-gitgutter'
  use 'mbbill/undotree'

  -- Color Schemes etc
  use {'dracula/vim', as = 'dracula'}
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
end)

