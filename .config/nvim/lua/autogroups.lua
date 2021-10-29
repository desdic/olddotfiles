local utils = require('utils')
local cmd = vim.cmd

utils.define_augroups({
	_general = {
		{'BufEnter','*','set formatoptions-=cro'}, -- Don't continue comments
		{'BufWritePre','/mnt/*','setlocal noundofile,setlocal shada="NONE"'}, -- Disable undo on these locations since
		{'BufWritePre','/boot/*','setlocal noundofile,setlocal shada="NONE"'}, -- they are automounts
		{'BufReadPost','*',':Watch %'} -- reload file on external changes
	},
	_text = {
		{'FileType','text set tw=80 fo+=taw spell'},
		{'FileType','text','set noexpandtab'},
		{'FileType','text','set tabstop=4'},
		{'FileType','text','set shiftwidth=4'}
	},
	_mail = {
		{'FileType','mail set tw=72 fo+=taw spell'}
	},
	_gitcommit = {
		{'FileType','gitcommit','set spell'}
	},
	_markdown = {
		{'FileType','markdown set noexpandtab'},
		{'FileType','markdown set tabstop=4'},
		{'FileType','markdown set shiftwidth=4'}
	},
	_yaml = {
		{'FileType','yaml','set expandtab'},
		{'FileType','yaml','set tabstop=2'},
		{'FileType','yaml','set shiftwidth=2'},
		{'FileType','yaml','set softtabstop=2'}
	},
	_help = {
		{'FileType','help','setlocal nolist'} --  don't show whitespace in help files
	},
	_json = {
		{'FileType','json','set conceallevel=0'},
		{'FileType','json','set ft=json'},
		{'FileType','json','set expandtab'},
		{'FileType','json','set tabstop=2'},
		{'FileType','json','set shiftwidth=2'}
	},
	_sxhkdrc = {
		{'FileType','sxhkdrc','set noexpandtab'},
		{'FileType','sxhkdrc','set tabstop=2'},
		{'FileType','sxhkdrc','set shiftwidth=2'}
	},
	_systemd = {
		{'BufNewFile,BufRead','*/systemd/*.{automount,mount,path,service,socket,swap,target,timer} setfiletype systemd'},
		{'BufNewFile,BufRead','/etc/systemd/system/*.d/*.conf setfiletype systemd'},
		{'BufNewFile,BufRead','/etc/systemd/system/*.d/.#* setfiletype systemd'}
	},
	_toml = {
		{'FileType','toml set expandtab'},
		{'FileType','toml set shiftwidth=2'},
		{'FileType','toml set softtabstop=2'},
		{'FileType','toml set tabstop=2'}
	},
	_make = {
		{'FileType','make set noexpandtab'},
		{'FileType','make set tabstop=2'},
		{'FileType','make set shiftwidth=2'}
	},
	_sh = {
		{'FileType','sh','set expandtab'},
		{'FileType','sh','set tabstop=2'},
		{'FileType','sh','set shiftwidth=2'}
	},
	_python = {
		{'FileType','python','set expandtab'},
		{'FileType','python','set tabstop=4'},
		{'FileType','python','set shiftwidth=4'}
	},
	_asm = {
		{'FileType','asm','set expandtab'},
		{'FileType','asm','set shiftwidth=4'},
		{'FileType','asm','set softtabstop=4'},
		{'FileType','asm','set tabstop=4'}
	},
	_c = {
		{'FileType','c','setlocal expandtab'},
		{'FileType','c','setlocal shiftwidth=4'},
		{'FileType','c','setlocal softtabstop=4'},
		{'FileType','c','setlocal tabstop=4'},
		{'FileType','cpp','setlocal expandtab'},
		{'FileType','cpp','setlocal shiftwidth=4'},
		{'FileType','cpp','setlocal softtabstop=4'},
		{'FileType','cpp','setlocal tabstop=4'}
	},
	_go = {
		{'FileType','go','set nolist'},
		{'FileType','go','set noexpandtab'},
		{'FileType','go','set tabstop=4'},
		{'FileType','go','set softtabstop=4'},
		{'FileType','go','set shiftwidth=4'},
		{'BufWritePre','*.go','lua goimports(1000)'},
		{'BufWritePost','*.go','Format'}
	},
	_lua = {
		{'FileType','lua','set nolist'},
		{'FileType','lua','set noexpandtab'},
		{'FileType','lua','set tabstop=4'},
		{'FileType','lua','set softtabstop=4'},
		{'FileType','lua','set shiftwidth=4'},
		{'BufWritePre', '*.lua', 'lua vim.lsp.buf.formatting_sync(nil, 1000)'}
	},
	_ruby = {
		{'FileType','ruby','set expandtab'},
		{'FileType','ruby','set shiftwidth=2'},
		{'FileType','ruby','set softtabstop=2'},
		{'FileType','ruby','set tabstop=2'},
		{'FileType','eruby','set expandtab'},
		{'FileType','eruby','set shiftwidth=2'},
		{'FileType','eruby','set softtabstop=2'},
		{'FileType','eruby','set tabstop=2'},
		{'FileType','ruby.eruby.chef','set expandtab'},
		{'FileType','ruby.eruby.chef','set shiftwidth=2'},
		{'FileType','ruby.eruby.chef','set softtabstop=2'},
		{'FileType','ruby.eruby.chef','set tabstop=2'}
	}
})

-- Highlight on yank
cmd 'au TextYankPost * silent! lua vim.highlight.on_yank {on_visual = false, higroup="IncSearch", timeout=200}'
