
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

		use { 'luukvbaal/stabilize.nvim',
			config = function()
				require('stabilize').setup()
			end
		}

		use {'wbthomason/packer.nvim', opt = true}
		use {'nvim-lua/popup.nvim'}

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
		use {'honza/vim-snippets'}

		use {'golang/vscode-go'}
		use {'rafamadriz/friendly-snippets'}

		use {'gpanders/editorconfig.nvim'}
		use {'Vimjas/vim-python-pep8-indent',
			ft = {'python'},
		}

		use {
			'numToStr/Comment.nvim',
			config = function()
				require('Comment').setup()
			end
		}

		use { 'beauwilliams/focus.nvim',
			config = function()
				require('focus').setup(
					{
						enable = true,
						cursorline = true,
						signcolumn = true,
						number = false,
						hybridnumber = true,
						absolutenumber_unfocussed = true,
						excluded_filetypes = {'toggleterm'},
						-- excluded_buftypes = {'help', 'popup'}
					}
				)
			end
		}

		use {'christianchiarulli/nvcode-color-schemes.vim'}
		use {'catppuccin/nvim',
			config = function()
				local catppuccin = require('catppuccin')

				-- configure it
				catppuccin.setup({
					transparent_background = false,
					term_colors = false,
					styles = {
						comments = 'italic',
						functions = 'italic',
						keywords = 'italic',
						strings = 'NONE',
						variables = 'NONE',
					},
					integrations = {
						treesitter = true,
						native_lsp = {
							enabled = true,
							virtual_text = {
								errors = 'italic',
								hints = 'italic',
								warnings = 'italic',
								information = 'italic',
							},
							underlines = {
								errors = 'underline',
								hints = 'underline',
								warnings = 'underline',
								information = 'underline',
							},
						},
						lsp_saga = false,
						gitsigns = true,
						telescope = true,
						nvimtree = {
							enabled = true,
							show_root = false,
						},
						indent_blankline = {
							enabled = false,
							colored_indent_levels = false,
						},
						bufferline = false,
						markdown = false,
						lightspeed = true,
						ts_rainbow = true,
					},
				})
			end
		}

		use {
			'nvim-lualine/lualine.nvim',
			requires = {'kyazdani42/nvim-web-devicons', opt = true},
			config = function()
				require('config.evil_lualine')
			end
		}

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
			},
			config = function()
				require('config.telescope')
			end
		}

		use {
			'AckslD/nvim-neoclip.lua',
			config = function()
				require('neoclip').setup()
			end,
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
				local i = require('config.icons')

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
							symbol_map = i.symbol_map,
							menu = {
								buffer = '[buf]',
								nvim_lsp = '[LSP]',
								nvim_lua = '[api]',
								path = '[path]',
								calc = '[calc]',
								vsnip = '[vsnip]',
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
				require('nvim-autopairs').setup ({
					disable_filetype = { "TelescopePrompt" }
				})
			end
		}
	end,
	config = {
		python_cmd = 'python3'
	}
}
