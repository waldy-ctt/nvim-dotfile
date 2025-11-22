return {
  "mrcjkb/rustaceanvim",
  version = "^6", -- Recommended
  lazy = false,
  init = function()
    vim.g.rustaceanvim = {
      server = {
        cmd = function()
          -- Force using the system binary
          return { "/usr/bin/rust-analyzer" }
        end,
      },
    }
  end
}
