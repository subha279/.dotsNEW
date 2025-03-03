return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	opts = {
		options = {
			themable = true,
			icons_enabled = true,
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
			disabled_filetypes = { statusline = { "alpha" } }, -- Hide Lualine on Alpha
		},
	},
	config = function(_, opts)
		require("lualine").setup(opts)

		-- Hide Lualine when Alpha is open
		vim.api.nvim_create_autocmd("User", {
			pattern = "AlphaReady",
			callback = function()
				vim.cmd("set laststatus=0") -- Hide statusline
			end,
		})

		-- Restore Lualine when leaving Alpha
		vim.api.nvim_create_autocmd("BufUnload", {
			pattern = "<buffer>",
			callback = function()
				vim.cmd("set laststatus=3") -- Restore statusline after Alpha
			end,
		})
	end,
}
