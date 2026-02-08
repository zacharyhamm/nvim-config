return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "echasnovski/mini.icons" },
    keys = {
      { "<leader>ff", function() require("fzf-lua").files() end, desc = "Find files" },
      { "<leader>fg", function() require("fzf-lua").live_grep() end, desc = "Live grep" },
    },
    opts = {},
  },
}
