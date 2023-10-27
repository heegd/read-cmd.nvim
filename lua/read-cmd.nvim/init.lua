local function executeCmd(command)
  local result = vim.fn.system(command)
  result = string.gsub(result, "[\r\n]+$", "")
  result = vim.split(result, "[\r\n]")
  return result
end

local function readCmdBefore(command)
  local result = executeCmd(command)
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, result)
  vim.api.nvim_win_set_cursor(0, { row, col })
end

local function readCmdAfter(command)
  local result = executeCmd(command)
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_buf_set_text(0, row - 1, col + 1, row - 1, col + 1, result)
  vim.api.nvim_win_set_cursor(0, { row, col })
end

vim.api.nvim_create_user_command("ReadCmdBefore",
  function(opts)
    readCmdBefore(opts.fargs[1])
  end,
  { nargs = 1 })

vim.api.nvim_create_user_command("ReadCmdAfter",
  function(opts)
    readCmdAfter(opts.fargs[1])
  end,
  { nargs = 1 })
