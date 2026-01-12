vim.cmd("source $HOME/.vimrc")
--
--vim.g["packpath"] = "/home/user/.local/share/nvim"
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

vim.cmd("let mapleader = ','")
vim.cmd("set mouse=")
vim.cmd("set formatoptions-=cro")

-- nvim-tree
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("config.lazy")

--require("lazy").setup("plugins")

require ("user.nvim-whichkey")

--require('plugins')

-- Mason Setup
--require("mason").setup({
--    ui = {
--        icons = {
--            package_installed = "",
--            package_pending = "",
--            package_uninstalled = "",
--        },
--    }
--})
--require("mason-lspconfig").setup()

vim.cmd[[colorscheme tokyonight-night]]
--tokyonight
--tokyonight-night
--tokyonight-storm
--tokyonight-day
--tokyonight-moon

--require ("user.nvim-whichkey")
--require ("user.nvim-tree")
--require ("user.nvim-treesitter")
require ("user.nvim-telescope")
--require ("user.nvim-lsp")
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
require ("user.nvim-harpoon")

--[[
require("lazy").setup({
    {
        "ggandor/leap.nvim",
        config = function()
            require("leap").set_default_keymaps()
        end
    }
})
-- keybinds (declared in a separate file)
vim.keymap.set({'n', 'x', 'o'}, '<leader>s', '<Plug>(leap)')
vim.keymap.set({'n', 'x', 'o'}, '<leader>S', function ()
  local focusable_windows = vim.tbl_filter(
    function (win) return vim.api.nvim_win_get_config(win).focusable end,
    vim.api.nvim_tabpage_list_wins(0)
  )
  require('leap').leap { target_windows = focusable_windows }
end)
--]]
vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')
vim.keymap.set('n',             'S', '<Plug>(leap-from-window)')
-- Highly recommended: define a preview filter to reduce visual noise
-- and the blinking effect after the first keypress (see
-- `:h leap.opts.preview`).
-- For example, skip preview if the first character of the match is
-- whitespace or is in the middle of an alphabetic word:
--[[
require('leap').opts.preview = function (ch0, ch1, ch2)
  return not (
    ch1:match('%s')
    or (ch0:match('%a') and ch1:match('%a') and ch2:match('%a'))
  )
end
--]]
-- Define equivalence classes for brackets and quotes, in addition to
-- the default whitespace group:
require('leap').opts.equivalence_classes = { ' \t\r\n', '([{', ')]}', '\'"`' }

-- Use the traversal keys to repeat the previous motion without
-- explicitly invoking Leap:
require('leap.user').set_repeat_keys('<enter>', '<backspace>')
