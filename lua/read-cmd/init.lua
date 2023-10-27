local M = {}

local function executeCmd(command)
  local result = vim.fn.system(command)
  result = string.gsub(result, "[\r\n]+$", "")
  result = vim.split(result, "[\r\n]")
  return result
end

M.readCmdBefore = function(command)
  local result = executeCmd(command)
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, result)
  vim.api.nvim_win_set_cursor(0, { row, col })
end

M.readCmdAfter = function(command)
  local result = executeCmd(command)
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_buf_set_text(0, row - 1, col + 1, row - 1, col + 1, result)
  vim.api.nvim_win_set_cursor(0, { row, col })
end

return M
