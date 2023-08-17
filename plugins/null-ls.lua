return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"
    -- null_ls.setup {
    --   null_ls.builtins.diagnostics.eslint_d.with {
    --     filetypes = { "typescript", "typescriptreact" },
    --     command = "eslint",
    --     debounce = 100,
    --     args = { "--stdin", "--stdin-filename", "$FILENAME" },
    --   },
    -- }

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      require "typescript.extensions.null-ls.code-actions",
      -- Set a formatter
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettierd,
      null_ls.builtins.formatting.clang_format,

      -- diagnostics
      null_ls.builtins.diagnostics.eslint_d,

      -- code_actions
      null_ls.builtins.code_actions.eslint_d,
    }
    return config -- return final config table
  end,
}
