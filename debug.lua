local dmi = require "dmi"
local syslinux = require "syslinux"

function printdmi(cat, var)
  if (current_cat ~= cat)
  then
    current_cat = cat
    io.write(string.format("%-20s", cat .. "." .. var .. ": "))
  else
    io.write(string.format("%-20s", "  ." .. var .. ": "))
  end

  if (dmitable[cat]) then
    -- PXELINUX 6
    val = dmitable[cat][var]
  else
    -- PXELINUX 4
    val = dmitable[cat .. "." .. var]
  end
  if (val) then
    print(string.format('(%2d)"%s"', #val, val))
  else
    print('<undefined>')
  end
end

print("===============================================================================")
print("You are seeing this screen because you selected the \"Debug\" menu entry in the")
print("boot menu. To leave this screen, press CTRL+ALT+DEL.")
print("===============================================================================")
print()

if(not dmi.supported()) then
  print("This computer doesn't support DMI; if it doesn't boot, ")
  print("you will probably have to disable PXE in the BIOS :(")
else
  dmitable = dmi.gettable()

  printdmi("system", "uuid")
  printdmi("system", "manufacturer")
  printdmi("system", "product_name")
  printdmi("system", "version")
  printdmi("system", "serial")
  printdmi("system", "family")
  printdmi("system", "sku_number")
  printdmi("chassis", "type")
  printdmi("chassis", "manufacturer")
  printdmi("chassis", "version")
  printdmi("chassis", "serial")
  printdmi("base_board", "type")
  printdmi("base_board", "manufacturer")
  printdmi("base_board", "product_name")
  printdmi("base_board", "version")
  printdmi("base_board", "serial")
  printdmi("base_board", "asset_tag")
  printdmi("base_board", "location")
  io.write("PXELINUX version: " .. syslinux.version())
end

-- lua has io.read(), but lua.c32 doesn't seem to implement it
syslinux.sleep(600)

-- vim: ft=lua
