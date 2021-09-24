-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Simple plugins can be specified as strings
  --use '9mm/vim-closer'

  -- Lazy loading:
  -- Load on specific commands
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Load on an autocommand event
  use {'andymass/vim-matchup', event = 'VimEnter'}

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  --use {
  --  'w0rp/ale',
  --  ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
  --  cmd = 'ALEEnable',
  --  config = 'vim.cmd[[ALEEnable]]'
  --}

  use {
    'neoclide/coc.nvim',
    run = {
      'yarn install --frozen-lockfile'
    }
  }

  use {
    'preservim/nerdcommenter'
  }

  -- Plugins can have dependencies on other plugins
  use {
    'haorenW1025/completion-nvim',
    opt = true,
    requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  }

  -- You can specify rocks in isolation
  use_rocks 'penlight'
  use_rocks {'lua-resty-http', 'lpeg'}

  -- Plugins can have post-install/update hooks
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- Post-install/update hook with neovim command
  --use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Post-install/update hook with call of vimscript function with argument
  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  --use {
    --'vim-airline/vim-airline'
  --}

  -- Use dependency and run lua function after load
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

  -- You can specify multiple plugins in a single call
  use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}

  -- You can alias plugin names
  use {'dracula/vim', as = 'dracula'}

  use {'arcticicestudio/nord-vim', as = 'nord'}

  use {
    "hoob3rt/lualine.nvim",
    config = function ()
      require("lualine").setup {
        options = {
          theme = "github"
        }
      }
    end
  }

  use {
    "projekt0n/github-nvim-theme",
    after = "lualine.nvim",
    config = function ()
      require("github-theme").setup({
          theme_style = "dark",
          transparent = true
        })
    end
  }

  use {
    'junegunn/fzf.vim',
    requires = {
      'junegunn/fzf',
      run = { 'fzf#install()' }
    }
  }

  use {
    'jackguo380/vim-lsp-cxx-highlight'
  }

  use {
    'tpope/vim-surround'
  }

  use {
    'sheerun/vim-polyglot'
  }

  use {
    'derekwyatt/vim-fswitch'
  }

  use {
    'farmergreg/vim-lastplace'
  }


  use { 'luochen1990/rainbow' }

  use {
    'google/vim-codefmt',
    requires = { 'google/vim-maktaba', 'google/vim-glaive' }
  }


  --use {
    --'rstacruz/vim-closer'
  --}
  use {
    'airblade/vim-gitgutter'
  }
  use {
    'jiangmiao/auto-pairs'
  }


end)
