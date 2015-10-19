-- Only for debugging; this library ensures that you can run localboot.lua with
-- a normal Lua interpreter. Change the data below to simulate different
-- hardware.

local M = {}

local table = {
  system = {
    manufacturer = "LENOVO",
    version = "Lenovo B580",
  },
  base_board = {
    manufacturer = "",
    product_name = "",
  },
}

function M.gettable()
  return table
end

function M.supported()
  return true
end

return M
