return {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    config = function()
        require('mason-lspconfig').setup {
            ensure_installed = { 'clangd' }, -- Ensure clangd is installed by Mason
        }
        vim.lsp.config("clangd", {})
        --require('lspconfig').clangd.setup {
            -- Optional: Add specific clangd configurations here, e.g., capabilities
            -- capabilities = require('cmp_nvim_lsp').default_capabilities(),
        --}
    end
}
