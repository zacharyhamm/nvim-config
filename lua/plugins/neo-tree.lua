return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "echasnovski/mini.icons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle file explorer" },
    },
    opts = {
      filesystem = {
        follow_current_file = { enabled = true },
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
        },
      },
    },
  },
}
