local conform = require("conform")
conform.setup({
  formatters_by_ft = {
    -- lua = { "stylua" }, -- may configure this one later
    -- Conform will run multiple formatters sequentially
    -- You can customize some of the format options for the filetype (:help conform.format)
    rust = { "rustfmt", lsp_format = "fallback" },
    -- Conform will run the first available formatter
    javascript = { "prettier", stop_after_first = true, lsp_format = "fallack" },
    go = { "gofmt" },
    kotlin = { "ktlint" },
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    conform.format({ bufnr = args.buf })
  end,
})
