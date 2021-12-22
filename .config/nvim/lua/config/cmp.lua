local ok, cmp = pcall(require, 'nvim-autopairs')
if not ok then
	return
end

require('cmp_nvim_lsp').setup()
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
	},
	documentation = {
		border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
	},
	experimental = {
		ghost_text = false,
		native_menu = false,
	},
}
