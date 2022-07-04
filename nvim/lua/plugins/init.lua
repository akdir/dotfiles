return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'shaunsingh/nord.nvim'
  use 'navarasu/onedark.nvim'
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  use "projekt0n/github-nvim-theme"
  use 'Mofiqul/vscode.nvim'
  use "preservim/nerdcommenter"
  use 'nvim-telescope/telescope-media-files.nvim'
  use 'nvim-telescope/telescope-project.nvim'
  use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.opts)
    end
  }
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use {'windwp/nvim-ts-autotag'}
  use {'onsails/lspkind-nvim'}
  use {'p00f/nvim-ts-rainbow'}
  use {'windwp/nvim-autopairs'}
  use {'folke/which-key.nvim'}
  use {'mhartington/formatter.nvim'}
  use {'voldikss/vim-floaterm'}
  use { "ray-x/lsp_signature.nvim"}
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { 'L3MON4D3/LuaSnip' }
  use { 'luc-tielen/telescope_hoogle' }
  use {
    'hrsh7th/nvim-cmp',
    config = function ()
      require'cmp'.setup {
      snippet = {
        expand = function(args)
          require'luasnip'.lsp_expand(args.body)
        end
      },
      sources = {
        { name = 'luasnip' },
        -- more sources
      },
    }
    end
  }
  use { 'saadparwaiz1/cmp_luasnip' }
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-nvim-lua'}
  use {'hrsh7th/cmp-path'}
  use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
  use {"akinsho/toggleterm.nvim"}
end)
