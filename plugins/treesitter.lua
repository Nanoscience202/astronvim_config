return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
      "lua",
      "typescript",
      "javascript",
      "tsx",
      "cpp",
      "json",
      "css",
      "html",
      "jsonc",
      "c",
      "objc",
      "cuda",
      "proto",
      "markdown",
      "markdown_inline",
      "prisma",
      "sql",
      "toml",
    })
  end,
}
