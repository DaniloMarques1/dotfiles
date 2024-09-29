function ExportCsv()
  -- Get the entire buffer content
  local buf_content = vim.api.nvim_buf_get_lines(0, 0, -1, false)

  -- Get the selected lines
  local content = table.concat(buf_content, "\n")
  local handle = io.popen('echo "'.. content .. '" | neovim-csv-db-exporter .')
  local output = handle:read("*a")
  handle:close()
  print(output)
end
