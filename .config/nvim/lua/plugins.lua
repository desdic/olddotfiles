local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_path)) then
	vim.fn.system {
		'git',
		'clone',
		'https://github.com/wbthomason/packer.nvim',
		packer_path
	}
	vim.cmd('packadd packer.nvim')
end

return require('packer').startup {
	function(use)
		-- speed up filetype detection
		use {'nathom/filetype.nvim'}

		use { 'luukvbaal/stabilize.nvim',
			config = function()
				require("stabilize").setup()
			end
		}

		use {'wbthomason/packer.nvim', opt = true}

		use {
			'folke/trouble.nvim',
			requires = 'kyazdani42/nvim-web-devicons',
			config = function()
				require('trouble').setup {}
			end
		}

		use {'p00f/nvim-ts-rainbow'}

		use {
			'nvim-treesitter/nvim-treesitter',
			requires = {
				'nvim-treesitter/nvim-treesitter-refactor',
				'nvim-treesitter/nvim-treesitter-textobjects',
				'windwp/nvim-ts-autotag'
			},
			run = ':TSUpdate',
			config = function()
				require('config.treesitter')
			end
		}

		use {'ggandor/lightspeed.nvim'}
		use {'SirVer/ultisnips'}
		use {'honza/vim-snippets'}

		use {'lukas-reineke/indent-blankline.nvim',
			config = function()
				require('indent_blankline').setup {
					char = '|',
					buftype_exclude = {'terminal', 'popup'}
				}
			end
		}

		use {'golang/vscode-go'}
		use {'rafamadriz/friendly-snippets'}

		use {'editorconfig/editorconfig-vim'}
		use 'Vimjas/vim-python-pep8-indent'

		use {'b3nj5m1n/kommentary',
			config = function()
				require('kommentary.config').configure_language('sxhkdrc', {
					prefer_single_line_comments = true,
					use_consistent_indentation = true,
				})

				require('kommentary.config').configure_language('default', {
					prefer_single_line_comments = true,
					use_consistent_indentation = true,
				})
			end
		}

		use {
			'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
			config = function()
				require'toggle_lsp_diagnostics'.init()
			end
		}

		use { "beauwilliams/focus.nvim",
			 config = function()
				 require("focus").setup(
					{
						enable = true,
						cursorline = true,
						signcolumn = true,
						hybridnumber = true,
						excluded_filetypes = {"toggleterm"},
						-- excluded_buftypes = {"help", "popup"}
					}
				)
			end
		}

		use {'christianchiarulli/nvcode-color-schemes.vim'}
		use "catppuccin/nvim"

		use {
			'windwp/windline.nvim',
			config = function()
				require('windline')
				require('wlsample.evil_line')
			end
		}

		use {'tomasiser/vim-code-dark'}

		use {
			'akinsho/nvim-bufferline.lua',
			requires = 'kyazdani42/nvim-web-devicons',
			config = function()
				require('bufferline').setup {}
			end
		}

		use {
			'kyazdani42/nvim-tree.lua',
			requires = 'kyazdani42/nvim-web-devicons',
			config = function() require'nvim-tree'.setup {} end
		}

		use {'neovim/nvim-lspconfig',
			config = function()
				require('config.nvim-lspconfig')
			end
		}

		use {'williamboman/nvim-lsp-installer'}
		use {'glepnir/lspsaga.nvim'}
		use {'mhartington/formatter.nvim'}

		use {
			'onsails/lspkind-nvim',
			config = function()
				local i = require('config.icons')

				require('lspkind').init {
					symbol_map = {
						Class = i.lang.class,
						Color = i.lang.color,
						Constant = i.lang.constant,
						Constructor = i.lang.constructor,
						Enum = i.lang.enum,
						EnumMember = i.lang.enummember,
						Event = i.lang.event,
						Field = i.lang.field,
						File = i.lang.file,
						Folder = i.lang.folder,
						Function = i.lang['function'],
						Interface = i.lang.interface,
						Keyword = i.lang.keyword,
						Method = i.lang.method,
						Module = i.lang.module,
						Operator = i.lang.operator,
						Property = i.lang.property,
						Reference = i.lang.reference,
						Snippet = i.lang.snippet,
						Struct = i.lang.struct,
						Text = i.lang.text,
						TypeParameter = i.lang.typeparameter,
						Unit = i.lang.unit,
						Value = i.lang.value,
						Variable = i.lang.variable
					}
				}
			end
		}


		use {
			'nvim-telescope/telescope.nvim',
			requires = {
				'nvim-lua/plenary.nvim',
				'nvim-telescope/telescope-fzy-native.nvim',
				'nvim-telescope/telescope-media-files.nvim',
				'nvim-telescope/telescope-github.nvim'
				-- 'nvim-telescope/telescope-packer.nvim'  -- currently breaking packer
			},
			config = function()
				require('config.telescope')
			end
		}

		use {
			'filipdutescu/renamer.nvim',
			branch = 'master',
			requires = { {'nvim-lua/plenary.nvim'} },
			config = function()
				require("renamer").setup()
			end
		}

		use { 'ray-x/lsp_signature.nvim' }
		use { 'rcarriga/nvim-notify' }
		use {
			'kshenoy/vim-signature',
			config = function()
				-- only supports vim-gitgutter
				-- vim.g.SignatureMarkTextHLDynamic = 1
			end
		}

		use {
			'lewis6991/gitsigns.nvim',
			requires = 'nvim-lua/plenary.nvim',
			config = function()
				require('config.gitsigns')
			end
		}

		use {
			'hrsh7th/nvim-cmp',
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
			config = function()
				require('cmp_nvim_lsp').setup()
				local cmp = require('cmp')
				local lspkind = require('lspkind')
				local compare = require('cmp.config.compare')

				cmp.setup {
					preselect = false,
					snippet = {
						expand = function(args)
							-- You must install `vim-vsnip` if you use the following as-is.
							vim.fn['vsnip#anonymous'](args.body)
						end
					},
					formatting = {
						format = lspkind.cmp_format{
							with_text = true,
							menu = {
								buffer = "[buf]",
								nvim_lsp = "[LSP]",
								nvim_lua = "[api]",
								path = "[path]",
								calc = "[calc]",
								vsnip = "[vsnip]",
							}
						}
					},
					sorting = {
						priority_weight = 2.,
						comparators = {
							compare.offset,
							compare.exact,
							compare.score,
							compare.kind,
							compare.sort_text,
							compare.length,
							compare.order,
						},
					},
					min_length = 0, -- allow for `from package import _` in Python
					mapping = {
						['<S-Tab>'] = cmp.mapping.select_prev_item(),
						['<Tab>'] = cmp.mapping.select_next_item(),
						['<C-k>'] = cmp.mapping.confirm({
							behavior = cmp.ConfirmBehavior.Insert,
							select = true,
						}),
						['<CR>'] = cmp.mapping.confirm {
							behavior = cmp.ConfirmBehavior.Replace,
							select = true
						}
					},
					sources = {
						{name = 'nvim_lsp'},
						{name = 'nvim_lua'},
						{name = 'path'},
						{name = 'vsnip'},
						{name = 'buffer', keyword_length = 3},
						{name = 'calc'},
					}
				}
			end
		}

		use {
			'windwp/nvim-autopairs',
			after = 'nvim-cmp',
			config = function()
				require('nvim-autopairs').setup ({ map_cr = true})
				local cmp_autopairs = require('nvim-autopairs.completion.cmp')
				local cmp = require('cmp')
				cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
			end
		}

	end,
	config = {
		python_cmd = 'python3'
	}
}
