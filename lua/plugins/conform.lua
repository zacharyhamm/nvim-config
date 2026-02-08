return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          rust = { "rustfmt" },
          go = { "goimports", "gofmt" },
          python = { "ruff_format" },
          typescript = { "prettier" },
          javascript = { "prettier" },
          typescriptreact = { "prettier" },
          javascriptreact = { "prettier" },
          vue = { "prettier" },
          html = { "prettier" },
          css = { "prettier" },
          json = { "prettier" },
        },
        format_on_save = {
          timeout_ms = 1000,
          lsp_format = "fallback",
        },
      })
    end,
  },
}
