-- plugins/telescope.lua:
return {
	"nvim-telescope/telescope.nvim",
	-- tag = "0.1.9",
	dependencies = { { "nvim-lua/plenary.nvim" } },
	config = function()
		require("telescope").load_extension('fzf')
	end,
}
