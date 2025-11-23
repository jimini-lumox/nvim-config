return {
    "neovim/nvim-lspconfig",
    config = function()
        --require("user.nvim-lsp")
    end,
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
    event = {
       "InsertEnter",
    },
}
