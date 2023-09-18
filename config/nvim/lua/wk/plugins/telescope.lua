return {
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  {
    'nvim-telescope/telescope.nvim',
    lazy = false,
    tag = '0.1.3',
    dependencies = { 
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
      "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function () 
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      telescope.setup {
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "ignore_case",
          }
        }
      }

      telescope.load_extension('fzf')
      telescope.load_extension('file_browser')

      local map = {
        ['<leader>ff'] = { builtin.find_files, "find files" },
        ['<leader>fg'] = { builtin.live_grep, "find files" },
        ['<leader>fb'] = { builtin.buffers, "find buffers" },
        ['<leader>fx'] = { telescope.extensions.file_browser.file_browser, "find files" },
      }

      utils.map('n', map)
    end
  }
}
