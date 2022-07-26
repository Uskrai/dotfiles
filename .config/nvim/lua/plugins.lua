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

    -- Use dependency and run lua function after load
    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        -- config = function()
        --     require("gitsigns").setup()
        -- end
        config = function()
            require('gitsigns').setup {
                debug_mode = true,
                yadm = {
                    enable = true
                },
                on_attach = function(bufnr)
                    local function map(mode, lhs, rhs, opts)
                        opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
                        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
                    end

                    -- Navigation
                    map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
                    map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

                    -- Actions
                    map('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
                    map('v', '<leader>hs', ':Gitsigns stage_hunk<CR>')
                    map('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
                    map('v', '<leader>hr', ':Gitsigns reset_hunk<CR>')
                    map('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
                    map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
                    map('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
                    map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
                    map('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
                    map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
                    map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
                    map('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
                    map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')

                    -- Text object
                    map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
                    map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
                end
            }
        end
    }


    use {'sindrets/diffview.nvim'}

    use {'tpope/vim-surround'};

    use {'SirVer/ultisnips'};

    use {'honza/vim-snippets'};

    -- auto expand
    -- use "cohama/lexima.vim"

    -- auto expand
    -- use {'Raimondi/delimitMate'}

    -- auto expand
    -- use {'rstacruz/vim-closer'}
    -- use {'tpope/vim-endwise', after="vim-closer"}
    use {'tpope/vim-eunuch'}
    use { 
        'windwp/nvim-autopairs' ,
        config = function() require("nvim-autopairs").setup {} end
    }
    -- use { 'neoclide/coc-pairs' }

    use {'tpope/vim-fugitive'}
    use {'tpope/vim-repeat'}

    -- comment
    -- use {'preservim/nerdcommenter'}
    use {
     'numToStr/Comment.nvim',
      config = function() require('Comment').setup() end
    }
    use { 'JoosepAlviste/nvim-ts-context-commentstring' }

    use 'preservim/nerdtree'

    -- LSP
    use {'neoclide/coc.nvim', run = {'yarn install --frozen-lockfile'}}
    -- }}Editing

    -- Appereance{{

    use {
        "hoob3rt/lualine.nvim",
        config = function()
            require("lualine").setup {
                options = {theme = "ayu"},
                sections = {
                    lualine_c = {
                        {
                            'filename',
                            path = 1
                            
                        },
                        "g:coc_status"
                    }
                }
            }
        end
    }
    use 'joshdick/onedark.vim'
    use 'sainnhe/everforest'
    use 'ayu-theme/ayu-vim'
    use 'drewtempelmeyer/palenight.vim'
    use 'sainnhe/sonokai'
    use 'tomasr/molokai'
    use 'morhetz/gruvbox'
    use 'sainnhe/edge'
    use 'dikiaap/minimalist'
    use 'cocopon/iceberg.vim'
    -- use 'sainnhe/gruvbox-material' // no transparent background on EOL
    use 'kaicataldo/material.vim'

    use {
        'arcticicestudio/nord-vim',
        branch = "main"
    }

    -- use {
    --     'kdheepak/tabline.nvim',
    --     config = function()
    --         require'tabline'.setup {
    --             enable = true
    --         }
    --     end
    -- }
    -- use {
    --     'dracula/vim'
    -- }
    -- use {
    --     "projekt0n/github-nvim-theme",
    --     config = function()
    --         require("github-theme").setup({
    --             transparent = true
    --
    --         })
    --     end
    -- }

    use {'lukas-reineke/indent-blankline.nvim'}
    -- }}
    use 'editorconfig/editorconfig-vim'
    use {
        'junegunn/fzf.vim',
        requires = {'junegunn/fzf', run = {'fzf#install()'}}
    }

    use {'jackguo380/vim-lsp-cxx-highlight'}

    use {'sheerun/vim-polyglot'}

    use {'derekwyatt/vim-fswitch'}

    use {'farmergreg/vim-lastplace'}

    use {'luochen1990/rainbow'}

    -- use { 'google/vim-glaive', requires = {'google/vim-maktaba'} }

    use {
        'google/vim-codefmt',
        requires = {'google/vim-maktaba', 'google/vim-glaive'}
    }

    use {'andrejlevkovitch/vim-lua-format'}

    -- use {'raymond-w-ko/vim-lua-indent'}

    use {
        'nvim-telescope/telescope.nvim', 
        requires = { {'nvim-lua/plenary.nvim' } },
        config = function() 
          require"telescope".setup {
              extensions = {
                  frecency = {
                      show_unindexed = true,
                      show_scores = true,
                      sorter = require"telescope".extensions.fzf
                          .native_fzf_sorter()
                  }
              }
          }
        end
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


    use {
        'rmagatti/auto-session',
        config = function()
            vim.o.sessionoptions="blank,buffers,curdir,folds,help,options,tabpages,winsize,resize,winpos,terminal"
        end
    }

    use {'romgrk/barbar.nvim', requires = 'kyazdani42/nvim-web-devicons'}

    use {'gelguy/wilder.nvim'}

    use 'andweeb/presence.nvim'

    use 'tpope/vim-sleuth'

    use 'Konfekt/FastFold'

    use { 
        'dinhhuy258/vim-local-history',
        run = ":UpdateRemotePlugins"
    }

    use {
        'Iron-E/rust.vim',
        branch = "feature/struct-definition-identifiers"
    }

    use {
        "udalov/kotlin-vim"
    }
    use 'RustemB/sixtyfps-vim'

    use 'stephpy/vim-php-cs-fixer'  
end)
