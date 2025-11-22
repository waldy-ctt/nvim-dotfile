return {
  "mason-org/mason.nvim",
  opts = {
    PATH = "append"
  },
  config = function(_, opts)
    require('mason').setup(opts)
  end
}
