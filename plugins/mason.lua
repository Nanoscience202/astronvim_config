-- customize mason plugins

return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",

    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "lua_ls",
        "clangd",
        "cssls",
        "jsonls",
        "tailwindcss",
        "tsserver",
        "prismals",
      })
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",

    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
    },
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "prettierd",
        "stylua",
        "clang-format",
        "eslint_d",
        "cspell",
      })

      opts.automatic_installation = false

      local null_ls = require "null-ls"
      -- null_ls.setup()

      opts.handlers = {
        function() end,

        cspell = function()
          null_ls.register(null_ls.builtins.code_actions.cspell.with { filetypes = { "markdown" } })
          null_ls.register(null_ls.builtins.diagnostics.cspell.with { filetypes = { "markdown" } })
        end,

        prettierd = function() null_ls.register(null_ls.builtins.formatting.prettierd) end,

        stylua = function() null_ls.register(null_ls.builtins.formatting.stylua) end,

        clang_format = function() null_ls.register(null_ls.builtins.formatting.clang_format) end,

        eslint_d = function()
          null_ls.register(null_ls.builtins.code_actions.eslint_d)
          null_ls.register(null_ls.builtins.diagnostics.eslint_d)
        end,
      }
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "python",
        "codelldb",
        "js-debug-adpater",
      })
    end,
  },
}
