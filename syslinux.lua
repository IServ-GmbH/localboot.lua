-- Only for debugging; this library ensures that you can run localboot.lua with
-- a normal Lua interpreter. Change the data below to simulate a different
-- syslinux derivative.

local M = {}

function M.run_command(cmd)
  print("syslinux.run_command(\""..cmd.."\")")
end

function M.local_boot(arg)
  print("syslinux.local_boot("..arg..")")
end

function M.derivative()
  return "PXELINUX"
end

return M
