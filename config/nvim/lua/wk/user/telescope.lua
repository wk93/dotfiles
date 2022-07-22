local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')

local M = {}

telescope.setup({
	defaults = {
		layout_config = { prompt_position = 'top' },
		layout_strategy = 'horizontal',
		sorting_strategy = 'ascending',
		use_less = false,
	},
	pickers = {
		buffers = {
			show_all_buffers = true,
			sort_lastused = true,
			theme = "dropdown",
			previewer = false,
			mappings = {
				i = {
					["<c-d>"] = "delete_buffer",
				}
			}
		}
	}
})


function M.find_files()
	telescope_builtin.find_files({
		find_command = { 'rg', '--ignore', '--hidden', '--files' },
		previewer = false
	})
end

function M.live_grep()
	telescope_builtin.live_grep({ only_sort_text = true })
end

function M.buffers()
	telescope_builtin.buffers()
end

function M.find_in_buffer()
	telescope_builtin.current_buffer_fuzzy_find({ fuzzy = false, case_mode = 'ignore_case' })
end

return M
