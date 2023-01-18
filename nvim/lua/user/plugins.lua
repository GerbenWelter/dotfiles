-- Bootstrap packer on new installs
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- color themes
    use 'vim-scripts/ScrollColors'
    use 'frankier/neovim-colors-solarized-truecolor-only'
    use 'folke/tokyonight.nvim'
    use 'tanvirtin/monokai.nvim'
    use 'sainnhe/sonokai'
    use 'nanotech/jellybeans.vim'
    use 'rakr/vim-one'
    use ('sonph/onehalf', {
        rtp = 'vim'
    })
    use 'EdenEast/nightfox.nvim'
    use 'tomasiser/vim-code-dark'
    use 'nyoom-engineering/oxocarbon.nvim'
    use 'ellisonleao/gruvbox.nvim'
    use 'rebelot/kanagawa.nvim'
    use 'talha-akram/noctis.nvim'

    -- Completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer' -- buffer completions
    use 'hrsh7th/cmp-path' -- path completions
	use 'saadparwaiz1/cmp_luasnip' -- snippet completions
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-nvim-lua'

  	-- Snippets
    use 'L3MON4D3/LuaSnip' --snippet engine

    -- plugins
    use {
        'nvim-telescope/telescope.nvim',
        --tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'airblade/vim-rooter'
    use 'kyazdani42/nvim-web-devicons'
    use 'nvim-lualine/lualine.nvim'
    --use 'kyazdani42/nvim-tree.lua'

    use {
      "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
        }
      }

    use ('nvim-treesitter/nvim-treesitter', {
        run = ':TSUpdate',
    })
    use 'tpope/vim-endwise'
    use 'Raimondi/delimitMate'
    use 'editorconfig/editorconfig-vim'
    use 'pearofducks/ansible-vim'
    use 'ntpeters/vim-better-whitespace'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'RRethy/vim-illuminate'
    use 'eandrju/cellular-automaton.nvim'
    use 'nanozuki/tabby.nvim'
    use 'tpope/vim-commentary'
    use 'tpope/vim-fugitive'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end

end)

