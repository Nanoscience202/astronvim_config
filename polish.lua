local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

return function()
  autocmd("VimLeave", {
    desc = "Disable Eslint_d and prettier when quitting Vim",
    group = augroup("quitWebPlugins", { clear = true }),
    callback = function()
      vim.api.nvim_command "!eslint_d stop"
      vim.api.nvim_command "!prettierd stop"
    end,
  })
end
