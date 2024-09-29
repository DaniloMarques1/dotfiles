-- Function to beautify JSON content in the current buffer
function Beautify()
  -- Get the entire buffer content
  local buf_content = vim.api.nvim_buf_get_lines(0, 0, -1, false)

  -- Join lines to form a single JSON string
  local json_content = table.concat(buf_content, "\n")

  -- Use jq to format the JSON
  local handle = io.popen('echo "' .. json_content:gsub('"', '\\"') .. '" | jq . 2>/dev/null')
  local beautified_json = handle:read("*a")
  handle:close()

  if beautified_json and #beautified_json > 0 then
    -- Replace the buffer content with beautified JSON
    vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(beautified_json, '\n'))
  else
    print("Invalid JSON or jq is not available!")
  end
end

function BeautifySelected()
  -- Get the starting and ending lines of the visual selection
  local start_line = vim.fn.getpos("'<")[2] - 1  -- Subtract 1 to adjust to 0-indexed
  local end_line = vim.fn.getpos("'>")[2]

  -- Get the selected lines
  local selected_lines = vim.api.nvim_buf_get_lines(0, start_line, end_line, false)
  local json_content = table.concat(selected_lines, "\n")

  -- Use jq to format the selected JSON
  local handle = io.popen('echo "' .. json_content:gsub('"', '\\"') .. '" | jq . 2>/dev/null')
  local beautified_json = handle:read("*a")
  handle:close()

  if beautified_json and #beautified_json > 0 then
    -- Replace the selected lines with beautified JSON
    vim.api.nvim_buf_set_lines(0, start_line, end_line, false, vim.split(beautified_json, '\n'))
    print("Selected JSON beautified!")
  else
    print("Invalid JSON or jq is not available!")
  end
end

