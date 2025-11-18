require("which-key").setup({
	preset = "helix",
    plugins = {
        marks = true,
        spelling = {
            enabled = true,
            suggestions = 20
        }
    },
    win = {
        title = false,
        title_pos = "center"
    }
})
