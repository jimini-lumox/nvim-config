
--vim.g["packpath"] = "/home/user/.local/share/nvim"
vim.cmd("let mapleader = ','")
vim.cmd("set mouse=")

-- nvim-tree
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require('plugins')

-- Mason Setup
require("mason").setup({
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    }
})
require("mason-lspconfig").setup()

vim.cmd[[colorscheme tokyonight-night]]
--tokyonight
--tokyonight-night
--tokyonight-storm
--tokyonight-day
--tokyonight-moon

require ("user.nvim-whichkey")
require ("user.nvim-tree")
require ("user.nvim-treesitter")
require ("user.nvim-telescope")
require ("user.nvim-lsp")
--[[
    require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
      width = 30,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
  })
]]--

