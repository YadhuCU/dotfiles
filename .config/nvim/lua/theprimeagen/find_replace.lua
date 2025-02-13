local ns_id = vim.api.nvim_create_namespace("LiveSubHighlight")

local function highlight_matches(find)
  vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)

  if find and find ~= "" then
    local search_pattern = find
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

    for line_idx, line in ipairs(lines) do
      local col_start, col_end = string.find(line, search_pattern)
      if col_start and col_end then
        vim.api.nvim_buf_add_highlight(0, ns_id, "Search", line_idx -1 , col_start, col_end)
      end
    end
  end
  vim.cmd("redraw")
end

local function cmdline_highlight()
  local cmd = vim.fn.getcmdline()

  local match = cmd:match("^%%S/([^/]+)/$") -- Ensures `/` comes at the end (invalid case, returns nil)
      or cmd:match("^%%S/([^/]+)$")         -- Match `%S/` with text but no trailing `/`
      or cmd:match("^'<,'>S/([^/]+)$")      -- Match `'<,'>S/` with text but no trailing `/`
      or cmd:match("^S/([^/]+)$")           -- Match `S/` with text but no trailing `/`

  if match then
    highlight_matches(match)
  else
    vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)
  end
end

vim.api.nvim_create_autocmd("CmdlineLeave", {
  pattern = ":",
  callback = function()
    vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)
  end
})

vim.api.nvim_create_autocmd("CmdlineChanged", {
  pattern = ":",
  callback = function()
    if vim.fn.getcmdtype() == ":" then
      local cmd = vim.fn.getcmdline()
      if cmd:match("^%%S/") or cmd:match("^'<,'>S/") or cmd:match("^S/") then
        cmdline_highlight()
      else
        vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)
      end
    end
  end
})


vim.api.nvim_create_user_command("S", function(opts)
  local input = opts.args
  local parts = vim.split(input, "/", { plain = true })

  if #parts <= 2 then
    print("Usage :[range]S/find/replace/flag")
    return
  end

  local find = parts[2]
  local replace = parts[3]
  local flag = parts[4] or ""
  local start_line = opts.line1
  local end_line = opts.line2
  local range = opts.range == 0 and "." or string.format("%d,%d", start_line, end_line)

  find = vim.fn.escape(find, "/")

  local cmd = string.format(
    [[%s s/\c%s/\=submatch(0)[0] ==# toupper(submatch(0)[0]) ? '%s' : '%s'/%s]],
    range,
    find,
    replace:sub(1, 1):upper() .. replace:sub(2),
    replace:lower(),
    flag
  )

  vim.cmd(cmd)
  vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)
end, { nargs = "+", range = true })
