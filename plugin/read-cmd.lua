local read_cmd = require("read-cmd")

vim.api.nvim_create_user_command("ReadCmdBefore",
  function(opts)
    read_cmd.readCmdBefore(opts.fargs[1])
  end,
  { nargs = 1 })

vim.api.nvim_create_user_command("ReadCmdAfter",
  function(opts)
    read_cmd.readCmdAfter(opts.fargs[1])
  end,
  { nargs = 1 })
