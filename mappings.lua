-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<c-s>"] = { ":w!<cr>", desc = "save file" },  -- change description but the same command

    ["<Tab>"] = { ":bnext <CR>", desc = "Move to next buffer" },
    ["<S-Tab>"] = { ":bprev <CR>", desc = "Move to next buffer" },

    ["<leader>x"] = { '"_x', desc = "Delete (no copy)" },
    ["<leader>X"] = { '0"_D', desc = "Delete line (no copy)" },

    ["<leader>W"] = { ":wa <CR>", desc = "Write All" },
    ["<leader>Q"] = { ":qa <CR>", desc = "Quit All" },

    -- Aerial mappings
    ["<leader>a"] = { name = "Aerial" },
    ["<leader>aa"] = { "<cmd> AerialToggle <CR>", desc = "Toggle Aerial" },
    ["<leader>an"] = { "<cmd> AerialNavOpen <CR>", desc = "Toggle Nav Aerial" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  i = {
    ["<S-BS>"] = { "<esc>", desc = "Escape" },
  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", desc = "Move Down" },
    ["K"] = { ":m '<-2<CR>gv=gv", desc = "Move Up" },
    ["<S-BS>"] = { "<esc>", desc = "Escape" },
    ["<leader>x"] = { '"_d', desc = "Delete (no copy)" },
    ["<leader>X"] = { '"_D', desc = "Delete line (no copy)" },
  },
}
