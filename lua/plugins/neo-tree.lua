return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "echasnovski/mini.icons",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle file explorer" },
    },
    init = function()
      -- Load neo-tree when opening a directory, instead of netrw
      vim.api.nvim_create_autocmd("BufEnter", {
        group = vim.api.nvim_create_augroup("neotree_start_directory", { clear = true }),
        callback = function()
          local path = vim.fn.expand("%:p")
          if vim.fn.isdirectory(path) == 1 then
            -- Delete the directory buffer, then open neo-tree in-place
            local bufnr = vim.api.nvim_get_current_buf()
            vim.schedule(function()
              vim.cmd("Neotree position=current dir=" .. vim.fn.fnameescape(path))
              if vim.api.nvim_buf_is_valid(bufnr) then
                vim.api.nvim_buf_delete(bufnr, { force = true })
              end
            end)
          end
        end,
      })
    end,
    opts = {
      filesystem = {
        hijack_netrw_behavior = "open_current",
        follow_current_file = { enabled = false },
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
        },
      },
    },
  },
}
