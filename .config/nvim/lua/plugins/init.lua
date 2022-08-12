-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
vim.cmd "packadd packer.nvim"

return require('packer').startup(function(use)
    local function lazy_load()
        return require("nvchad-core.lazy_load");
    end

    -- Packer can manage itself
    use {
        'wbthomason/packer.nvim',
        cmd = lazy_load().packer_cmds,
        config = function()
            require "plugins"
        end
    }

    -- Simple plugins can be specified as strings
    -- use '9mm/vim-closer'

    -- Lazy loading:
    -- Load on specific commands
    use {
        'tpope/vim-dispatch',
        opt = true,
        cmd = { 'Dispatch', 'Make', 'Focus', 'Start' }
    }

    use { 'nvim-lua/plenary.nvim' }

    -- Load on an autocommand event
    use {
        'andymass/vim-matchup',
        opt = true,
        setup = require "lazy_load".on_file_open "vim-matchup",
    }

    -- Load on a combination of conditions: specific filetypes or commands
    -- Also run code after load (see the "config" key)
    -- use {
    --  'w0rp/ale',
    --  ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    --  cmd = 'ALEEnable',
    --  config = 'vim.cmd[[ALEEnable]]'
    -- }

    -- Plugins can have post-install/update hooks
    use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install',
        cmd = 'MarkdownPreview'
    }

    -- treesitter plugin
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        setup = require "lazy_load".on_file_open "nvim-treesitter",
        cmd = lazy_load().treesitter_cmds,
        config = require "lazy_load".create_config "treesitter"
    }
    use {
        'JoosepAlviste/nvim-ts-context-commentstring',
        after = 'nvim-treesitter'
    }
    use {
        'nvim-treesitter/nvim-treesitter-context',
        after = 'nvim-treesitter',
        config = require "lazy_load".create_config('treesitter-context')
    }
    use {
        'nvim-treesitter/playground',
        after = 'nvim-treesitter'
    }
    use {
        'SmiteshP/nvim-navic',
        after = 'nvim-treesitter'
    }

    -- Post-install/update hook with call of vimscript function with argument
    use {
        'glacambre/firenvim',
        opt = true,
        run = function() vim.fn['firenvim#install'](0) end
    }

    -- use {
    -- 'vim-airline/vim-airline'
    -- }

    -- Use dependency and run lua function after load
    use {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        setup = function() require "lazy_load".on_file_open "gitsigns.nvim" end,
        config = require "lazy_load".create_config('gitsigns'),
    }


    use {
        'sindrets/diffview.nvim',
        opt = true,
        cmd = {
            'DiffviewOpen'
        }
    }

    use {
        'tpope/vim-surround',
        opt = true,
        setup = require "lazy_load".on_file_open "vim-surround",
    };

    use {
        'SirVer/ultisnips',
        opt = true,
        setup = require "lazy_load".on_file_open "ultisnips"
    };

    use {
        'honza/vim-snippets',
        opt = true,
        setup = require "lazy_load".on_file_open "vim-snippets"
    };

    -- auto expand
    -- use "cohama/lexima.vim"

    -- auto expand
    -- use {'Raimondi/delimitMate'}

    -- auto expand
    -- use {'rstacruz/vim-closer'}
    -- use {'tpope/vim-endwise', after="vim-closer"}
    use {
        'tpope/vim-eunuch',
        opt = true,
        cmd = require "lazy_load".eunuch_cmds,
    }
    use {
        'windwp/nvim-autopairs',
        opt = true,
        setup = require "lazy_load".on_file_open "nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    -- use { 'neoclide/coc-pairs' }

    use {
        'tpope/vim-fugitive',
        opt = true,
        setup = require "lazy_load".on_file_open "vim-fugitive",
    }
    use { 'tpope/vim-repeat' }

    -- comment
    -- use {'preservim/nerdcommenter'}
    use {
        'numToStr/Comment.nvim',
        after = 'nvim-treesitter',
        setup = require 'lazy_load'.on_file_open 'Comment.nvim',
        config = require "lazy_load".create_config "comment"
    }

    use {
        'preservim/nerdtree',
        opt = true,
        cmd = {
            'NERDTree',
        }
    }

    -- LSP
    -- use {'neoclide/coc.nvim', run = {'yarn install --frozen-lockfile'}}
    use {
        'neovim/nvim-lspconfig',
        opt = true,
        setup = require "lazy_load".on_file_open "nvim-lspconfig",
        config = require "lazy_load".create_config "lsp",
    }
    use {
        'j-hui/fidget.nvim',
        opt = true,
        after = 'nvim-lspconfig',
        config = function()
            require "fidget".setup {
                window = {
                    blend = 0
                }
            }
        end
    }
    use {
        "ThePrimeagen/refactoring.nvim",
        opt = true,
        after = 'nvim-lspconfig',
        requires = {
            { "nvim-lua/plenary.nvim" },
        }
    }
    use {
        'jose-elias-alvarez/null-ls.nvim',
        opt = true,
        after = { 'nvim-lspconfig', 'refactoring.nvim' },
        config = require "lazy_load".create_config "null-ls",
    }

    -- completion
    -- use { 'ms-jpq/coq_nvim' }
    use {
        'hrsh7th/nvim-cmp',
        setup = require "lazy_load".on_file_open "nvim-cmp",
        config = require "lazy_load".create_config "nvim-cmp",
        requires = {
            {
                'hrsh7th/cmp-nvim-lsp',
            },
            {
                'hrsh7th/cmp-cmdline',
            },
            {
                'hrsh7th/cmp-buffer',
            },
            {
                'hrsh7th/cmp-path',
            },
            {
                'hrsh7th/cmp-nvim-lsp-signature-help',
            },
            {
                "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
            }
        },
        after = { 'cmp-nvim-lsp', 'cmp-nvim-lsp-signature-help', 'lsp_lines.nvim' }
    }
    use {
        'kosayoda/nvim-lightbulb',
        requires = {
            {
                'antoinemadec/FixCursorHold.nvim',
            },
        },
        after = 'nvim-lspconfig',
        config = function()
            require('nvim-lightbulb').setup({
                autocmd = { enabled = true },
                ignore = {
                    'null-ls'
                }
            })
        end
    }
    -- }}Editing


    -- Appereance{{
    use {
        "hoob3rt/lualine.nvim",
        config = require "lazy_load".create_config "status"
    }
    use {
        'stevearc/dressing.nvim',
        opt = true,
        setup = require "lazy_load".on_file_open "dressing.nvim",
        config = function()
            require('dressing').setup();
        end
    }
    -- use 'joshdick/onedark.vim'
    -- use 'sainnhe/everforest'
    -- use 'ayu-theme/ayu-vim'
    -- use 'drewtempelmeyer/palenight.vim'
    -- use 'sainnhe/sonokai'
    -- use 'tomasr/molokai'
    -- use 'morhetz/gruvbox'
    -- use 'sainnhe/edge'
    -- use 'dikiaap/minimalist'
    -- use 'cocopon/iceberg.vim'
    -- use 'sainnhe/gruvbox-material' // no transparent background on EOL
    use 'kaicataldo/material.vim'

    -- use {
    --     'arcticicestudio/nord-vim',
    --     branch = "main"
    -- }

    use {
        'lukas-reineke/indent-blankline.nvim',
        opt = true,
        setup = require "lazy_load".on_file_open 'indent-blankline.nvim',
        config = require "lazy_load".create_config "blankline"
    }
    -- }}
    use {
        'editorconfig/editorconfig-vim',
        opt = true,
        setup = require "lazy_load".on_file_open "editorconfig-vim",
    }
    use {
        'junegunn/fzf.vim',
        opt = true,
        cmd = require "lazy_load".fzf_cmds,
        requires = { 'junegunn/fzf', run = { 'fzf#install()' } }
    }

    -- use { 'jackguo380/vim-lsp-cxx-highlight' }

    use {
        'sheerun/vim-polyglot',
        opt = true,
        setup = require "lazy_load".on_file_open "vim-polyglot"
    }

    use {
        'derekwyatt/vim-fswitch',
        opt = true,
        ft = {
            'cpp',
            'c'
        }
    }

    use { 'farmergreg/vim-lastplace' }

    use {
        'luochen1990/rainbow',
        opt = true,
        setup = require "lazy_load".on_file_open "rainbow",
    }

    -- use { 'andrejlevkovitch/vim-lua-format' }

    -- use {'raymond-w-ko/vim-lua-indent'}

    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } },
        cmd = "Telescope",
    }

    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
        after = 'telescope.nvim',
    }
    use {
        "nvim-telescope/telescope-frecency.nvim",
        requires = { "tami5/sqlite.lua" },
        after = 'telescope.nvim',
    }

    -- document reading {{
    use {
        'lervag/vimtex',
        ft = 'tex'
    }
    -- }} document reading


    -- use {
    --     'rmagatti/auto-session',
    --     config = function()
    --         vim.o.sessionoptions = "buffers,curdir,folds,help,options,tabpages,resize,winpos"
    --     end
    -- }

    use {
        'kyazdani42/nvim-web-devicons',
        opt = true,
        setup = require "lazy_load".on_file_open "nvim-web-devicons",
    }
    use {
        'romgrk/barbar.nvim',
        after = 'nvim-web-devicons',
        opt = true,
        -- setup = require"lazy_load".on_file_open"barbar.nvim",
    }

    -- use {
    --     'gelguy/wilder.nvim',
    --     setup = require"lazy_load".on_file_open"wilder.nvim",
    -- }

    use {
        'andweeb/presence.nvim',
        opt = true,
        setup = require "lazy_load".on_file_open "presence.nvim"
    }

    use {
        'tpope/vim-sleuth',
        opt = true,
        setup = require "lazy_load".on_file_open "vim-sleuth",
    }

    use {
        'Konfekt/FastFold',
        opt = true,
        setup = require "lazy_load".on_file_open "FastFold",
    }

    use {
        'dinhhuy258/vim-local-history',
        opt = true,
        setup = require "lazy_load".on_file_open "vim-local-history",
        run = ":UpdateRemotePlugins"
    }

    use {
        'Iron-E/rust.vim',
        ft = 'rust',
        branch = "feature/struct-definition-identifiers"
    }

    use {
        "udalov/kotlin-vim",
        ft = 'kotlin',
    }
    use {
        'RustemB/sixtyfps-vim',
        ft = 'sixtyfps',
    }

    use {
        'stephpy/vim-php-cs-fixer',
        ft = 'php',
    }
end)
