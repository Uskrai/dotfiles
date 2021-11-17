-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Simple plugins can be specified as strings
    -- use '9mm/vim-closer'

    -- Lazy loading:
    -- Load on specific commands
    use {
        'tpope/vim-dispatch',
        opt = true,
        cmd = {'Dispatch', 'Make', 'Focus', 'Start'}
    }

    use { 'nvim-lua/plenary.nvim' }

    -- Load on an autocommand event
    use {'andymass/vim-matchup', event = 'VimEnter'}

    -- Load on a combination of conditions: specific filetypes or commands
    -- Also run code after load (see the "config" key)
    -- use {
    --  'w0rp/ale',
    --  ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    --  cmd = 'ALEEnable',
    --  config = 'vim.cmd[[ALEEnable]]'
    -- }

    -- You can specify rocks in isolation
    use_rocks 'penlight'
    use_rocks {'lua-resty-http', 'lpeg'}

    -- Plugins can have post-install/update hooks
    use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install',
        cmd = 'MarkdownPreview'
    }

    -- Post-install/update hook with neovim command
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    -- Post-install/update hook with call of vimscript function with argument
    use {
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end
    }

    -- use {
    -- 'vim-airline/vim-airline'
    -- }

    use {
        'airblade/vim-gitgutter'
    }
    -- Use dependency and run lua function after load
    -- use {
    --     'lewis6991/gitsigns.nvim',
    --     requires = {'nvim-lua/plenary.nvim'},
    --     config = function()
    --         require('gitsigns').setup()
    --     end
    -- }


    use {'sindrets/diffview.nvim'}

    use {'tpope/vim-surround'};

    use {'SirVer/ultisnips'};

    use {'honza/vim-snippets'};

    -- auto expand
    -- use "cohama/lexima.vim"

    -- auto expand
    -- use {'Raimondi/delimitMate'}

    -- auto expand
    -- use {'uskrai/vim-closer'}
    -- use {'tpope/vim-endwise'}

    use {'tpope/vim-fugitive'}
    use {'tpope/vim-repeat'}

    -- comment
    -- use {'preservim/nerdcommenter'}
    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }

    -- LSP
    use {'neoclide/coc.nvim', run = {'yarn install --frozen-lockfile'}}
    use {'gluon-lang/vim-gluon'}
    -- }}Editing

    -- Appereance{{

    use {
        "hoob3rt/lualine.nvim",
        config = function()
            require("lualine").setup {
                options = {theme = "github"},
                sections = {
                    lualine_c = {
                        'filename',
                        'g:coc_status'
                    }
                }
            }
        end
    }

    use {
        "projekt0n/github-nvim-theme",
        config = function()
            require("github-theme").setup({
                -- theme_style = "dark",
                transparent = true

            })
            -- require("github-theme").setup()
            -- require("github-theme").setup({
            --     theme_style = "dark_default",
            --     transparent = true
            -- })
        end
    }

    use {'lukas-reineke/indent-blankline.nvim'}
    -- }}

    use {
        'junegunn/fzf.vim',
        requires = {'junegunn/fzf', run = {'fzf#install()'}}
    }

    use {'jackguo380/vim-lsp-cxx-highlight'}

    use {'sheerun/vim-polyglot'}

    use {'derekwyatt/vim-fswitch'}

    use {'farmergreg/vim-lastplace'}

    use {'luochen1990/rainbow'}

    use {
        'google/vim-codefmt',
        requires = {'google/vim-maktaba', 'google/vim-glaive'}
    }

    use {'andrejlevkovitch/vim-lua-format'}

    use {'raymond-w-ko/vim-lua-indent'}

    use {
        'nvim-telescope/telescope.nvim', require"telescope".setup {
            extensions = {
                frecency = {
                    show_unindexed = true,
                    show_scores = true,
                    sorter = require"telescope".extensions.fzf
                        .native_fzf_sorter()
                }
            }
        }

    }

    use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
    use {
        "nvim-telescope/telescope-frecency.nvim",
        requires = {"tami5/sqlite.lua"},
        config = function() require"telescope".load_extension("frecency") end
    }

    -- document reading {{
    use {'lervag/vimtex'}
    -- }} document reading

    use {'tpope/vim-eunuch'}

    use {'rmagatti/auto-session'}

    use {'romgrk/barbar.nvim', requires = 'kyazdani42/nvim-web-devicons'}

    use {'gelguy/wilder.nvim'}

    use 'andweeb/presence.nvim'

    use 'tpope/vim-sleuth'
end)
