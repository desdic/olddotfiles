
local fn = vim.fn
local packer_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(packer_path)) > 0 then
	PACKER_BOOTSTRAP = vim.fn.system {
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		packer_path
	}
	print('Installing packer')
end

vim.cmd('packadd packer.nvim')

-- if packer is not loaded lets return
local ok, packer = pcall(require, 'packer')
if not ok then
	vim.notify('Unable to require packer')
	return
end


-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require('packer.util').float { border = "rounded" }
		end,
	},
}

return packer.startup {
	function(use)
		-- speed up filetype detection
		use {'nathom/filetype.nvim'}

		use {'luukvbaal/stabilize.nvim'}
		use {'wbthomason/packer.nvim', opt = true}
		use {'nvim-lua/popup.nvim'}
		use {'p00f/nvim-ts-rainbow'}
		use {'nvim-treesitter/nvim-treesitter',
			requires = {
				'nvim-treesitter/nvim-treesitter-refactor',
				'nvim-treesitter/nvim-treesitter-textobjects',
				'windwp/nvim-ts-autotag'
			},
			run = ':TSUpdate',
		}
		use {'ggandor/lightspeed.nvim'}
		use {'honza/vim-snippets'}
		use {'golang/vscode-go'}
		use {'rafamadriz/friendly-snippets'}
		use {'gpanders/editorconfig.nvim'}
		use {'Vimjas/vim-python-pep8-indent',
			ft = {'python'},
		}
		use {'numToStr/Comment.nvim'}
		use {'beauwilliams/focus.nvim'}
		use {'christianchiarulli/nvcode-color-schemes.vim'}
		use {'catppuccin/nvim'}
		use {'nvim-lualine/lualine.nvim',
			requires = {'kyazdani42/nvim-web-devicons', opt = true},
		}
		use {'akinsho/nvim-bufferline.lua',
			requires = 'kyazdani42/nvim-web-devicons',
		}
		use {'kyazdani42/nvim-tree.lua',
			requires = 'kyazdani42/nvim-web-devicons',
		}
		use {'neovim/nvim-lspconfig'}
		use {'williamboman/nvim-lsp-installer'}
		use {'jose-elias-alvarez/null-ls.nvim',
			requires = {
				'nvim-lua/plenary.nvim',
			},
			run = {
				'go install github.com/daixiang0/gci@latest',
				'go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest',
				'go install golang.org/x/tools/cmd/goimports@latest'
			}
		}
		use {'onsails/lspkind-nvim' }
		use {'nvim-telescope/telescope.nvim',
			requires = {
				'nvim-lua/plenary.nvim',
				'nvim-telescope/telescope-fzy-native.nvim',
				'nvim-telescope/telescope-media-files.nvim',
			},
		}
		use {'ray-x/lsp_signature.nvim'}
		use {'rcarriga/nvim-notify'}
		use {'kshenoy/vim-signature'}
		use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim', }
		use { 'hrsh7th/nvim-cmp',
			requires = {
				'hrsh7th/vim-vsnip',
				'hrsh7th/cmp-nvim-lsp',
				'hrsh7th/cmp-buffer',
				'hrsh7th/cmp-nvim-lua',
				'hrsh7th/cmp-path',
				'hrsh7th/cmp-calc',
				'hrsh7th/cmp-vsnip'
			},
			after = 'lspkind-nvim',
		}
		use { 'windwp/nvim-autopairs', after = 'nvim-cmp' }
	end,
	config = {
		python_cmd = 'python3'
	}
}
