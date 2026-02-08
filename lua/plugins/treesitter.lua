return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "rust",
        "typescript",
        "tsx",
        "javascript",
        "vue",
        "html",
        "css",
        "json",
        "go",
        "gomod",
        "gosum",
        "python",
        "lua",
        "toml",
        "markdown",
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    },
  },
}
