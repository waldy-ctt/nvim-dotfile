return {
	"AdrianMosnegutu/docscribe.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("docscribe").setup({
			ui = {
				highlight = {
					style = "signature", -- "signature" | "full" | "none"
					timeout = 2000, -- Highlight duration (ms)
					bg = "#545454", -- Highlight color
				},
			},
			llm = {
				provider = "groq", -- "ollama" | "google" | "groq"
				provider_opts = {
					ollama = {
						model = "llama3.2",
					},
					google = {
						model = "gemini-1.5-flash",
						api_key = os.getenv("GOOGLE_API_KEY"),
					},
					groq = {
						model = "llama-3.1-8b-instant",
						api_key = os.getenv("GROQ_API_KEY"),
					},
				},
			},
		})
	end,
}
