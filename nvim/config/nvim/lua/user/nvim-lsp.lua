
require('fidget').setup()

-- Setup language servers.
local rt = require("rust-tools")
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.jedi_language_server.setup {}
--lspconfig.pyright.setup {}
lspconfig.tsserver.setup {}
lspconfig.cmake.setup {}
--lspconfig.clangd.setup {}
lspconfig.clangd.setup {
    on_attach = function(_, bufnr)
      -- Hover actions
      --vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      vim.keymap.set("n", "<C-space>", "<cmd>lua vim.lsp.buf.hover()<cr>", { buffer = bufnr })
      -- Code action groups
      --vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
}

-- Configure `ruff-lsp`.
-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruff_lsp
-- For the default config, along with instructions on how to customize the settings
lspconfig.ruff_lsp.setup {
    on_attach = function(client, bufnr)
        client.server_capabilities.hoverProvider = false
    end,
  init_options = {
    settings = {
      -- Any extra CLI arguments for `ruff` go here.
      args = {},
    }
  }
}

