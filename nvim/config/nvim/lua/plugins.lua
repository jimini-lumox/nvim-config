
-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

  	use 'williamboman/mason.nvim'    
  	use 'williamboman/mason-lspconfig.nvim'

  	-- Post-install/update hook with neovim command
  	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  	use 'ryanoasis/vim-devicons'

    -- telescope
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    --use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'}, { 'nvim-treesitter/nvim-treesitter' } }
	}

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
		  'nvim-tree/nvim-web-devicons', -- optional
		},
		config = function()
		  require("nvim-tree").setup {}
		end
	}

	--use 'phaazon/hop.nvim'
	use 'folke/tokyonight.nvim'

    use 'neovim/nvim-lspconfig'
    use 'simrat39/rust-tools.nvim'
    -- rust analyser progress/status
    use 'j-hui/fidget.nvim'

    -- which-key
    use { "folke/which-key.nvim", tag = 'v1.4.2' }
    --[[ use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    } ]]--
    use {
        'rmagatti/auto-session',
        config = function()
            require("auto-session").setup {
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
                -- ⚠️ This will only work if Telescope.nvim is installed
                -- The following are already the default values, no need to provide them if these are already the settings you want.
                session_lens = {
                    -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
                    buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
                    load_on_setup = true,
                    theme_conf = { border = true },
                    previewer = false,
                },
            }
        end
    }
    --[[ use {
        'rmagatti/session-lens',
        requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
        config = function()
            require('session-lens').setup({
                path_display = {'shorten'},
                theme = 'ivy', -- default is dropdown
                theme_conf = { border = true },
                previewer = true
            })
        end
    } ]]--

end)
