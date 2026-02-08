return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spec = {
        { "<leader>c", group = "code" },
        { "<leader>f", group = "find" },
        { "<leader>h", group = "git hunk" },
        { "<leader>i", group = "inlay" },
        { "<leader>r", group = "rename" },
      },
    },
  },
}
