-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim.cmd "packadd packer.nvim"

local treesitter_cmds = {
    "TSInstall",
    "TSBufEnable",
    "TSBufDisable",
    "TSEnable",
    "TSDisable",
    "TSModuleInfo",
}


local lazy_load = require "lazy_load"

local function on_file_open()
    return {
        "BufRead", "BufWinEnter", "BufNewFile",
    }
end

local function load_config(name)
    return function()
        return lazy_load.create_config(name)
    end
end

require('vim.lsp._watchfiles')._watchfunc = function(_, _, _) return true end

require("lazy").setup({
    { 'nvim-lua/plenary.nvim' },
    {
        'ggandor/leap.nvim',
        opt = true,
        event = on_file_open(),
        config = function()
            require "leap".add_default_mappings()
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = on_file_open(),
        cmd = treesitter_cmds,
        dependencies = {
            'JoosepAlviste/nvim-ts-context-commentstring',
            'nvim-treesitter/nvim-treesitter-context',
            'nvim-treesitter/playground',
            'SmiteshP/nvim-navic',
            'numToStr/Comment.nvim',
        },
        config = load_config("treesitter")
    },
    {
        'JoosepAlviste/nvim-ts-context-commentstring',
        after = 'nvim-treesitter'
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        config = load_config("treesitter-context")
    },
    -- treesitter plugin
    {
        'nvim-treesitter/playground',
    },
    -- {
    --     'SmiteshP/nvim-navic',
    -- },

    {
        'https://gitlab.com/HiPhish/rainbow-delimiters.nvim.git',
        config = function()
            -- This module contains a number of default definitions
            local rainbow_delimiters = require 'rainbow-delimiters'
            vim.g.rainbow_delimiters = {
                strategy = {
                    [''] = rainbow_delimiters.strategy['global'],
                    commonlisp = rainbow_delimiters.strategy['local'],
                },
                query = {
                    [''] = 'rainbow-delimiters',
                    latex = 'rainbow-blocks',
                },
                highlight = {
                    'RainbowDelimiterRed',
                    'RainbowDelimiterYellow',
                    'RainbowDelimiterBlue',
                    'RainbowDelimiterOrange',
                    'RainbowDelimiterGreen',
                    'RainbowDelimiterViolet',
                    'RainbowDelimiterCyan',
                },
            }
        end
        -- event = on_file_open()
    },

    {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = load_config("gitsigns")
    },


    {
        'sindrets/diffview.nvim',
        cmd = {
            'DiffviewOpen'
        }
    },

    {
        'tpope/vim-surround',
        event = on_file_open(),
    },

    {
        "L3MON4D3/LuaSnip",
        -- opt = true,
        event = on_file_open(),
        config = load_config("luasnip"),
    },
    "rafamadriz/friendly-snippets",

    -- Use dependency and run lua function after load
    -- use {
    --     'SirVer/ultisnips',
    --     opt = true,
    --     setup = require "lazy_load".on_file_open "ultisnips"
    -- };
    --
    -- use {
    --     'honza/vim-snippets',
    --     opt = true,
    --     setup = require "lazy_load".on_file_open "vim-snippets"
    -- };

    -- auto expand
    -- use "cohama/lexima.vim"

    -- auto expand
    -- use {'Raimondi/delimitMate'}

    -- auto expand
    -- use {'rstacruz/vim-closer'}
    -- use {'tpope/vim-endwise', after="vim-closer"}
    {
        'tpope/vim-eunuch',
        cmd = lazy_load.eunuch_cmds,
    },

    {
        'windwp/nvim-autopairs',
        -- opt = true,
        event = on_file_open(),
        config = function() require("nvim-autopairs").setup {} end
    },

    -- use { 'neoclide/coc-pairs' }

    -- use {
    --     'tpope/vim-fugitive',
    --     opt = true,
    --     setup = require "lazy_load".on_file_open "vim-fugitive",
    -- }
    { 'tpope/vim-repeat' },

    -- comment
    -- use {'preservim/nerdcommenter'}
    {
        'numToStr/Comment.nvim',
        after = 'nvim-treesitter',
        dependencies = {
            'JoosepAlviste/nvim-ts-context-commentstring',
        },
        event = on_file_open(),
        config = load_config("comment")
        -- config = require "lazy_load".create_config "comment"
    },
    --
    -- use {
    --     'preservim/nerdtree',
    --     opt = true,
    --     cmd = {
    --         'NERDTree',
    --     }
    -- }
    --
    -- -- LSP
    -- -- use {'neoclide/coc.nvim', run = {'yarn install --frozen-lockfile'}}
    -- {
    --     'neovim/nvim-lspconfig',
    --     config = load_config("lsp"),
    --     dependencies = {
    --         -- 'simrat39/rust-tools.nvim',
    --         -- 'akinsho/flutter-tools.nvim',
    --         "ThePrimeagen/refactoring.nvim",
    --         'j-hui/fidget.nvim',
    --     },
    --     event = on_file_open(),
    --     -- config = require "lazy_load".create_config "lsp",
    -- },

    -- {
    --     'lvimuser/lsp-inlayhints.nvim',
    --     -- config = function()
    --     --     require("lsp-inlayhints").setup()
    --     -- end
    -- },

    "weilbith/nvim-code-action-menu",

    {
        'simrat39/rust-tools.nvim',
        dependencies = {
            'neovim/nvim-lspconfig',
        },
        ft = 'rust',
        -- opt = true,
        -- after = 'nvim-lspconfig',
        config = load_config("rust-tools")
        -- config = require "lazy_load".create_config "rust-tools"
    },

    {
        'akinsho/flutter-tools.nvim',
        dependencies = {
            'neovim/nvim-lspconfig',
        },
        config = load_config("flutter-tools")
        -- opt = true,
        -- after = 'nvim-lspconfig',
        -- config = require "lazy_load".create_config "flutter-tools"
    },

    {
        'j-hui/fidget.nvim',
        branch = 'legacy',
        -- opt = true,
        -- after = 'nvim-lspconfig',
        config = function()
            require "fidget".setup {
                window = {
                    blend = 0
                }
            }
        end
    },
    {
        "ThePrimeagen/refactoring.nvim",
        -- opt = true,
        -- after = 'nvim-lspconfig',
        -- dependencies = {
        --     "nvim-lua/plenary.nvim",
        -- }
    },
    {
        'jose-elias-alvarez/null-ls.nvim',
        dependencies = {
            'nvim-lspconfig',
            'refactoring.nvim',
        },
        -- after = { 'nvim-lspconfig', 'refactoring.nvim' },
        config = load_config("null-ls"),
        -- config = require "lazy_load".create_config "null-ls",
    },

    {
        'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
        event = on_file_open(),
    },

    -- -- completion
    -- -- use { 'ms-jpq/coq_nvim' }
    {
        'hrsh7th/nvim-cmp',
        event = on_file_open(),
        config = load_config("nvim-cmp"),
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
            "saadparwaiz1/cmp_luasnip"
        },
        -- after = { 'cmp-nvim-lsp', 'cmp-nvim-lsp-signature-help', 'lsp_lines.nvim' }
    },
    {
        'kosayoda/nvim-lightbulb',
        dependencies = {
            'antoinemadec/FixCursorHold.nvim',
        },
        after = 'nvim-lspconfig',
        config = function()
            require('nvim-lightbulb').setup({
                autocmd = { enabled = true },
                ignore = {
                    ft = {
                        'null-ls'
                    }
                }
            })
        end
    },
    -- }}Editing


    -- Appereance{{
    {
        "hoob3rt/lualine.nvim",
        config = load_config("status")
        -- config = require "lazy_load".create_config "status"
    },
    {
        'stevearc/dressing.nvim',
        -- opt = true,
        event = on_file_open(),
        config = function()
            require('dressing').setup();
        end
    },

    {
        'catppuccin/nvim',
        name = "catppuccin",
        config = function()
            vim.g.catppuccin_flavour = "macchiato"
            require("catppuccin").setup {
                transparent_background = true,
                integrations = {
                    gitsigns = true,
                    treesitter = true,
                    barbar = true,
                    rainbow_delimiters = true,
                }
            }
            vim.api.nvim_command "colorscheme catppuccin"
        end
    },

    -- use {
    --     'arcticicestudio/nord-vim',
    --     branch = "main"
    -- }

    {
        'lukas-reineke/indent-blankline.nvim',
        -- opt = true,
        event = on_file_open(),
        config = load_config("blankline")
    },
    -- }} appereance
    {
        'editorconfig/editorconfig-vim',
        -- opt = true,
        event = on_file_open(),
        setup = function()
            require "editorconfig"
        end
    },
    { 'junegunn/fzf', build = { 'fzf#install()' } },
    {
        'junegunn/fzf.vim',
        name = "fzf.vim",
        dependencies = { "junegunn/fzf" },
        -- opt = true,
        cmd = lazy_load.fzf_cmds,
    },
    --
    -- -- use { 'jackguo380/vim-lsp-cxx-highlight' }
    --
    -- use {
    --     'sheerun/vim-polyglot',
    --     opt = true,
    -- }
    'jwalton512/vim-blade',
    --
    -- use {
    --     'derekwyatt/vim-fswitch',
    --     opt = true,
    --     ft = {
    --         'cpp',
    --         'c'
    --     }
    -- }
    --
    -- use { 'farmergreg/vim-lastplace' }

    -- {
    --     'luochen1990/rainbow',
    --     -- opt = true,
    --     event = on_file_open(),
    -- },

    -- use { 'andrejlevkovitch/vim-lua-format' }

    -- use {'raymond-w-ko/vim-lua-indent'}

    {
        'nvim-telescope/telescope.nvim',
        config = load_config("telescope"),
        dependencies = { 'nvim-lua/plenary.nvim' },
        cmd = { "Telescope" },
    },

    {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
        after = 'telescope.nvim',
    },
    -- use {
    --     "nvim-telescope/telescope-frecency.nvim",
    --     requires = { "tami5/sqlite.lua" },
    --     after = 'telescope.nvim',
    -- }

    {
        'nvim-pack/nvim-spectre',
        after = 'nvim-lua/plenary.nvim',
        config = load_config("spectre"),
    },

    -- document reading {{
    {
        'lervag/vimtex',
        ft = 'tex'
    },
    -- }} document reading


    {
        'rmagatti/auto-session',
        lazy = false,
        init = function()
            vim.o.sessionoptions = "buffers,curdir,folds,help,options,tabpages"
            -- vim.o.sessionoptions = "buffers,curdir,folds,help,options,tabpages,resize,winpos"
        end,
        opts = {}
        -- config = function()
        --     require("auto-session").setup {
        --
        --     }
        -- end
    },

    {
        'kyazdani42/nvim-web-devicons',
        -- opt = true,
        event = on_file_open(),
    },

    {
        'romgrk/barbar.nvim',
        dependencies = { 'nvim-web-devicons' },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {},
        -- opt = true,
        event = on_file_open(),
    },

    -- use {
    --     'gelguy/wilder.nvim',
    --     setup = require"lazy_load".on_file_open"wilder.nvim",
    -- }

    {
        'andweeb/presence.nvim',
        opt = true,
        event = on_file_open(),
        config = function()
            require("presence").setup({
                blacklist = {
                    "/home/uskrai/project/private",
                    "/home/uskrai/.local/share/mind.nvim",
                    "/home/uskrai/project/go/filemover"
                }
            })
        end
    },

    {
        'tpope/vim-sleuth',
        -- opt = true,
        event = on_file_open(),
    },

    -- FOLD
    {
        'kevinhwang91/promise-async'
    },
    {
        'kevinhwang91/nvim-ufo',
        dependencies = {
            'kevinhwang91/promise-async'
        },
        -- opt = true,
        config = load_config("nvim-ufo"),
        event = on_file_open(),
        -- config = require "lazy_load".create_config "nvim-ufo",
    },


    -- FOLD
    -- use {
    --     'Konfekt/FastFold',
    --     opt = true,
    --     setup = require "lazy_load".on_file_open "FastFold",
    -- }

    {
        'dinhhuy258/vim-local-history',
        -- opt = true,
        event = on_file_open(),
        build = ":UpdateRemotePlugins"
    },

    -- {
    --     'Iron-E/rust.vim',
    --     ft = 'rust',
    --     branch = "feature/struct-definition-identifiers"
    -- },

    {
        "udalov/kotlin-vim",
        ft = 'kotlin',
    },
    {
        'RustemB/sixtyfps-vim',
        ft = 'sixtyfps',
    },

    {
        'stephpy/vim-php-cs-fixer',
        ft = 'php',
    },

    {
        "aklt/plantuml-syntax"
    },

    "tyru/open-browser.vim",
    -- "weirongxu/plantuml-previewer.vim",
    "liuchengxu/graphviz.vim",

    -- note taking
    {
        'phaazon/mind.nvim',
        branch = 'v2.2',
        dependencies = { 'nvim-lua/plenary.nvim' },
        cmd = {
            'MindOpenMain',
            'MindOpenProject',
            'MindOpenSmartProject',
            'MindReloadState',
            'MindClose'
        },
        config = function()
            require 'mind'.setup()
        end
    },

    -- use { 'ja-ford/delaytrain.nvim',
    --     config = function()
    --         require('delaytrain').setup {
    --             delay_ms = 1000,
    --         }
    --     end
    -- };
})

-- return require('packer').startup(function(use)
--     -- -- Packer can manage itself
--     -- use {
--     --     'wbthomason/packer.nvim',
--     --     cmd = require "lazy_load".packer_cmds,
--     --     config = function()
--     --         require "plugins"
--     --     end
--     -- }
--
--     -- Simple plugins can be specified as strings
--     -- use '9mm/vim-closer'
--
--     -- Lazy loading:
--     -- Load on specific commands
--     use {
--         'tpope/vim-dispatch',
--         opt = true,
--         cmd = { 'Dispatch', 'Make', 'Focus', 'Start' }
--     }
--
--
--     -- Load on an autocommand event
--     use {
--         'andymass/vim-matchup',
--         opt = true,
--         -- setup = require "lazy_load".on_file_open "vim-matchup",
--     }
--
--     -- Load on a combination of conditions: specific filetypes or commands
--     -- Also run code after load (see the "config" key)
--     -- use {
--     --  'w0rp/ale',
--     --  ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
--     --  cmd = 'ALEEnable',
--     --  config = 'vim.cmd[[ALEEnable]]'
--     -- }
--
--     -- Plugins can have post-install/update hooks
--     use {
--         'iamcco/markdown-preview.nvim',
--         run = 'cd app && yarn install',
--         cmd = 'MarkdownPreview'
--     }
--
--     -- Post-install/update hook with call of vimscript function with argument
--     use {
--         'glacambre/firenvim',
--         opt = true,
--         run = function() vim.fn['firenvim#install'](0) end
--     }
--
--     -- use {
--     -- 'vim-airline/vim-airline'
--     -- }
--
--     -- use 'joshdick/onedark.vim'
--     -- use 'sainnhe/everforest'
--     -- use 'ayu-theme/ayu-vim'
--     -- use 'drewtempelmeyer/palenight.vim'
--     -- use 'sainnhe/sonokai'
--     -- use 'tomasr/molokai'
--     -- use 'morhetz/gruvbox'
--     -- use 'sainnhe/edge'
--     -- use 'dikiaap/minimalist'
--     -- use 'cocopon/iceberg.vim'
--     -- use 'sainnhe/gruvbox-material' // no transparent background on EOL
--     -- use {
--     --     'kaicataldo/material.vim',
--     --     config = function()
--     --         vim.api.nvim_command "colorscheme material"
--     --     end
--     -- }
--     -- use {
--     --     'marko-cerovac/material.nvim',
--     --     config = function()
--     --         require("material").setup {
--     --             disable = {
--     --                 -- colored_cursor = false, -- Disable the colored cursor
--     --                 -- borders = false, -- Disable borders between verticaly split windows
--     --                 background = true, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
--     --                 -- term_colors = false, -- Prevent the theme from setting terminal colors
--     --                 -- eob_lines = false -- Hide the end-of-buffer lines
--     --             },
--     --
--     --             plugins = {
--     --                 gitsigns = true,
--     --                 nvim_cmp = true,
--     --                 -- telescope = true,
--     --                 indent_blankline = true,
--     --             }
--     --         }
--     --         vim.api.nvim_command "colorscheme material"
--     --     end
--     -- }
-- end)
