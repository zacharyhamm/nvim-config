return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- Apply capabilities to ALL servers via wildcard
      vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        root_markers = { ".git" },
      })

      -- Rust
      vim.lsp.config("rust_analyzer", {
        cmd = { "rust-analyzer" },
        filetypes = { "rust" },
        root_markers = { "Cargo.toml", ".git" },
        settings = {
          ["rust-analyzer"] = {
            inlayHints = {
              enabled = true,
            },
            checkOnSave = true,
            check = {
              command = "clippy",
            },
          },
        },
      })

      -- Vue 3 (Volar)
      vim.lsp.config("vue_ls", {
        init_options = {
          typescript = {
            tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
          },
        },
      })

      -- TypeScript / JavaScript (with Vue plugin for hybrid mode)
      local vue_ts_plugin_path
      local vue_ls_path = vim.fn.stdpath("data") .. "/mason/packages/vue-language-server"
      if vim.uv.fs_stat(vue_ls_path) then
        vue_ts_plugin_path = vue_ls_path .. "/node_modules/@vue/language-server"
      end

      local ts_config = {
        filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" },
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
      }

      if vue_ts_plugin_path then
        ts_config.init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = vue_ts_plugin_path,
              languages = { "vue" },
            },
          },
        }
      end

      vim.lsp.config("ts_ls", ts_config)

      -- Go
      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
          },
        },
      })

      -- Python
      vim.lsp.config("pyright", {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
            },
          },
        },
      })

      -- mason-lspconfig: install servers
      require("mason-lspconfig").setup({
        ensure_installed = {
          "rust_analyzer",
          "ts_ls",
          "vue_ls",
          "gopls",
          "pyright",
        },
      })

      -- Explicitly enable all servers so they auto-attach to matching buffers
      vim.lsp.enable("rust_analyzer")
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("vue_ls")
      vim.lsp.enable("gopls")
      vim.lsp.enable("pyright")
    end,
  },
}
