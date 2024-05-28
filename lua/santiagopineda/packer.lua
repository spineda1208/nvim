vim.cmd [[packadd packer.nvim]]
vim.keymap.set("n", "<leader><leader>", ":PackerSync<CR>")
return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')
    use('christoomey/vim-tmux-navigator')

    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        -- or                            , branch = '0.1.x',
        requires = {{'nvim-lua/plenary.nvim'}}
    }
    -- Themes
    use('nyoom-engineering/oxocarbon.nvim')
    use('folke/tokyonight.nvim')
    use('sainnhe/everforest')
    -- use({'kepano/flexoki-neovim', as = 'flexoki'})

    -- Treesitter
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')

    use('stevearc/oil.nvim')
    use('nvim-tree/nvim-web-devicons')

    use('theprimeagen/harpoon')

    use('mbbill/undotree')

    use('tpope/vim-fugitive')
    use('tpope/vim-surround')
    use('tpope/vim-commentary')

    use('windwp/nvim-autopairs')
    use('windwp/nvim-ts-autotag')

    use('nat-418/boole.nvim')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment the two plugins below if you want to manage the language servers from neovim
            --- and read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
            {'neovim/nvim-lspconfig'}, {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'}, {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'}, {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'}, {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lua'}, {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'}
        }
    }
    use('github/copilot.vim')

    use('sbdchd/neoformat')

end)
