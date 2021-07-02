local actions = require('telescope.actions')
-- Global remapping
------------------------------
-- '--color=never',
require('telescope').setup {
    defaults = {
        find_command = {'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'},
        -- prompt_prefix = " ",
        prompt_prefix = " ",
        selection_caret = " ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
			horizontal = {
				mirror = false
			},
			vertical = {
				mirror = false
			},
			prompt_position = "bottom",
			width = 0.75,
			results_height = 1.0,
			results_width = 0.8,
			preview_cutoff = 120,
		},
        file_sorter = require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
        shorten_path = true,
        winblend = 0,
        border = {},
        borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        color_devicons = true,
        use_less = true,
        set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                -- To disable a keymap, put [map] = false
                -- So, to not map "<C-n>", just put
                -- ["<c-x>"] = false,
                ["<esc>"] = actions.close,

                -- Otherwise, just set the mapping to the function that you want it to be.
                -- ["<C-i>"] = actions.select_horizontal,

                -- Add up multiple actions
                ["<CR>"] = actions.select_default + actions.center

                -- You can perform as many actions in a row as you like
                -- ["<CR>"] = actions.select_default + actions.center + my_cool_custom_action,
            },
            n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                -- ["<C-i>"] = my_cool_custom_action,
            }
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
        media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = {"png", "webp", "jpg", "jpeg", "pdf"},
            find_cmd = "rg" -- find command (defaults to `fd`)
        }
    }
}

require('telescope').load_extension('fzy_native')
require('telescope').load_extension('media_files')

local M = {}
M.search_nvim = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = "$HOME/.config/nvim/",
    })
end

function M.grep_notes()
	local opts = {}
	opts.search_dirs = {"~/notes/"}
	opts.prompt_prefix = '   '
	opts.prompt_title = 'Search Notes'
	opts.shorten_path = true
	require'telescope.builtin'.live_grep(opts)
end

return M
