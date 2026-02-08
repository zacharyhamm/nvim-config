return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      on_attach = function(bufnr)
        local gs = require("gitsigns")
        local opts = function(desc)
          return { buffer = bufnr, desc = desc }
        end

        vim.keymap.set("n", "]h", gs.next_hunk, opts("Next hunk"))
        vim.keymap.set("n", "[h", gs.prev_hunk, opts("Prev hunk"))
        vim.keymap.set("n", "<leader>hs", gs.stage_hunk, opts("Stage hunk"))
        vim.keymap.set("n", "<leader>hr", gs.reset_hunk, opts("Reset hunk"))
        vim.keymap.set("n", "<leader>hp", gs.preview_hunk, opts("Preview hunk"))
        vim.keymap.set("n", "<leader>hb", gs.blame_line, opts("Blame line"))
      end,
    },
  },
}
