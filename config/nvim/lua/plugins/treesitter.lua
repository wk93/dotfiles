return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = { "lua", "vim", "vimdoc", "query" },
			auto_install = true,
			highlight = {
				enable = true,
				disable = function(_, buf)
					local max_filesize = 100 * 1024
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,

				additional_vim_regex_highlighting = false,
			},
		})
	end,
}
