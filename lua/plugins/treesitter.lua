return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      -- 1. FORCE install the Go parsers
      ensure_installed = { "go", "gomod", "gowork", "javascript", "typescript", "lua" },
      
      -- 2. Sync install them so you see results immediately
      sync_install = false,

      -- 3. ENABLE Highlighting (Critical!)
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      
      -- 4. Indentation based on treesitter
      indent = { enable = true },
    })
  end,
}
