require "nvchad.options"

-- add yours here!
local conform = require "conform"

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp", { clear = true }),
  callback = function(args)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = args.buf,
      callback = function()
        conform.format {
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        }
      end,
    })
  end,
})

vim.opt.wrap = false

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
