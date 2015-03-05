-- localboot.lua - a Lua script for syslinux' lua.c32 comboot module that uses
--                         DMI data to decide between localboot / chainloading
-- Copyright (C) 2015  Martin v. Wittich, IServ GmbH <martin.von.wittich@iserv.eu>
--
-- This program is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License
-- as published by the Free Software Foundation; either version 2
-- of the License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

-- version 2015-02-19
--
-- syntax check:
--   sudo aptitude install lua5.1
--   luac5.1 localboot.lua && rm -f luac.out && echo "OK"

local dmi = require "dmi"
local syslinux = require "syslinux"

function localboot()
  print("localboot.lua: localboot")
  syslinux.local_boot(0)
end

function chain()
  print("localboot.lua: chainloading")
  if (syslinux.derivative() == "PXELINUX") then
    -- PXELINUX; assume the first hard disk is hd0.
    syslinux.run_command("chain.c32 hd0")
  else
    -- ISOLINUX/SYSLIUNX; assume we're running from a USB stick hd0, and hd1 is
    -- the first hard disk.
    -- This may not be necessarily correct; ISOLINUX can run both from USB
    -- sticks and CDs, so we can't know for sure whether the first hard disk is
    -- hd0 or hd1. There's no chance to fix this though until we have a disk
    -- API in lua.c32.
    syslinux.run_command("chain.c32 hd1 swap")
  end
end

if(dmi.supported())
then
  -- DMI supported
  dmitable = dmi.gettable()
  if (dmitable.system) then
    --[[ PXELINUX 6 ]]--
    sm = dmitable.system.manufacturer
    sv = dmitable.system.version
    sp = dmitable.system.product_name
    bm = dmitable.base_board.manufacturer
    bp = dmitable.base_board.product_name
  else
    --[[ PXELINUX 4 ]]--
    sm = dmitable["system.manufacturer"]
    sv = dmitable["system.version"]
    sp = dmitable["system.product_name"]
    bm = dmitable["base_board.manufacturer"]
    bp = dmitable["base_board.product_name"]
  end

  -- hack so that every line that follows begins with "elseif"
  if (false) then

  -- Acer
  elseif (sm == "Acer") then
    if (false) then
    -- Acer Aspire 3750 (Notebook)
    elseif (sp == "Aspire 3750") then chain()
    -- Acer Aspire 3810T (Notebook)
    elseif (sp == "Aspire 3810T") then chain()
    -- Acer Aspire 5820TG (Notebook)
    elseif (sp == "Aspire 5820TG") then chain()
    -- Acer Aspire ASE571/AST671 (Notebook)
    elseif (sp == "ASE571/AST671") then chain()
    -- Acer Aspire One 753 (Notebook)
    elseif (sp == "Aspire One 753") then chain()
    -- Acer Aspire One AOA150 (Notebook)
    elseif (sp == "AOA150") then chain()
    -- Acer Aspire XC600 (Notebook)
    elseif (sp == "Aspire XC600") then chain()
    -- Acer Revo 70 (Desktop PC)
    elseif (sp == "Revo 70") then chain()
    -- Acer TravelMate 5735Z (Notebook)
    elseif (sp == "TravelMate 5735Z") then chain()
    -- Acer TravelMate 5740-332G25Mn (Notebook)
    elseif (sp == "Calpella") then chain()
    -- Acer TravelMate 5742 (Notebook)
    elseif (sp == "TravelMate 5742") then chain()
    -- Acer TravelMate 5744 (Notebook)
    elseif (sp == "TravelMate 5744") then chain()
    -- Acer TravelMate 5760G (Notebook)
    elseif (sp == "TravelMate 5760G") then chain()
    -- Acer TravelMate 5760 (Notebook)
    elseif (sp == "TravelMate 5760") then chain()
    -- Acer TravelMate 8571 (Notebook)
    elseif (sp == "TravelMate 8571") then chain()
    -- Acer TravelMate P653-M (Notebook)
    elseif (sp == "TravelMate P653-M") then chain()
    -- Acer TravelMate P653-M (Notebook)
    elseif (sp == "AO531h") then chain()
    -- Acer Veriton E430G (Desktop-PC)
    elseif (sp == "Veriton E430G") then chain()
    -- Acer Veriton M2610G (Desktop PC)
    elseif (sp == "Veriton M2610G") then chain()
    -- Acer Veriton M290 (Desktop PC)
    elseif (sp == "Veriton M290") then chain()
    -- Acer Veriton N4620G (Desktop PC)
    elseif (sp == "Veriton N4620G") then chain()
    end
  elseif (sm == "Acer            ") then
    if (false) then
    -- Acer Aspire One D255 (Notebook)
    elseif (sp == "AOD255          ") then chain()
    -- Acer TravelMate 5740 (Notebook)
    elseif (sp == "TravelMate 5740 ") then chain()
    end
  elseif (sm == "Acer                  ") then
    if (false) then
    -- Acer Veriton L460 (Desktop PC)
    elseif (sp == "Veriton L460") then chain()
    end

  -- ASUS
  elseif (bm == "ASUSTeK Computer INC.") then
    if (false) then
    -- ASUS A8N-VM (Mainboard)
    elseif (bp == "A8N-VM T-System-CSM") then chain()
    -- ASUS M2N-VM DVI (Mainboard)
    elseif (bp == "M2N-VM DVI") then chain()
    -- ASUS M2N-VM SE (Mainboard)
    elseif (bp == "M2N-VM SE") then chain()
    -- ASUS M4N68T-M-LE-V2 (Mainboard)
    elseif (bp == "M4N68T-M-LE-V2") then chain()
    -- ASUS M5A78L-M LX (Mainboard)
    elseif (bp == "M5A78L-M LX") then chain()
    end
  elseif (bm == "ASUSTeK COMPUTER INC.") then
    if (false) then
    -- ASUS B85M-E (Mainboard)
    elseif (bp == "B85M-E") then chain()
    -- ASUS B85M-G (Mainboard)
    elseif (bp == "B85M-G") then chain()
    -- ASUS H81M2 (Mainboard)
    elseif (bp == "H81M2") then chain()
    -- ASUS H81M-K (Mainboard)
    elseif (bp == "H81M-K") then chain()
    end
  elseif (sm == "ASUS") then
    if (false) then
    -- ASUS H81Mi+ (Mainboard)
    elseif (bp == "H81M-PLUS") then chain()
    end

  -- Bluechip
  elseif (sm == "bluechip Computer AG") then
    if (false) then
    -- Bluechip BUSINESSline M ZT i3-4130 (Desktop PC)
    elseif (bp == "B85M-E") then chain()
    end

  -- Compaq
  elseif (sm == "Compaq") then
    if (false) then
    -- Compaq Evo d510 SFF (Notebook)
    elseif (sp == "Evo D510 SFF") then chain()
    end

  -- Dell
  elseif (sm == "Dell Inc.") then
    if (false) then
    -- Dell Latitude E5520 (Notebook)
    elseif (sp == "Latitude E5520") then chain()
    -- Dell OptiPlex 3020 (Desktop PC)
    elseif (sp == "OptiPlex 3020") then chain()
    -- Dell OptiPlex 390 (Desktop PC)
    elseif (sp == "OptiPlex 390") then chain()
    -- Dell OptiPlex 790 (Desktop PC)
    elseif (sp == "OptiPlex 790") then chain()
    -- Dell OptiPlex 990 (Desktop PC)
    elseif (sp == "OptiPlex 990") then chain()
    end

  -- eMachines
  elseif (sm == "eMachines ") then
    if (false) then
    -- eMachines 725 (Notebook)
    elseif (sp == "eMachines E725 ") then chain()
    end

  -- Fujitsu
  elseif (sm == "FUJITSU SIEMENS") then
    if (false) then
    -- Fujitsu ESPRIMO E5915 (Desktop PC)
    elseif (sp == "ESPRIMO E") then chain()
    -- Fujitsu Esprimo Mobile D9510 (Notebook)
    elseif (sp == "ESPRIMO Mobile D9510") then chain()
    -- Fujitsu Esprimo Mobile V5535 (Notebook)
    elseif (sp == "ESPRIMO Mobile V5535") then chain()
    end
  elseif (sm == "FUJITSU                         ") then
    if (false) then
    -- Fujitsu Esprimo P5731 (Desktop PC)
    elseif (sp == "ESPRIMO P5731                 ") then chain()
    end
  elseif (sm == "FUJITSU") then
    if (false) then
    -- Fujitsu Esprimo P910 (Desktop PC)
    elseif (sp == "ESPRIMO P910") then chain()
    -- Fujitsu Esprimo Q510 (Desktop PC)
    elseif (sp == "ESPRIMO Q510") then chain()
    -- Fujitsu LifeBook A512 (Notebook)
    elseif (sp == "LIFEBOOK A512") then chain()
    -- Fujitsu LifeBook A530 (Notebook)
    elseif (sp == "LIFEBOOK A530") then chain()
    -- Fujitsu LifeBook A531 (Notebook)
    elseif (sp == "LIFEBOOK A531") then chain()
    -- Fujitsu LifeBook A532 (Notebook)
    elseif (sp == "LIFEBOOK A532") then chain()
    -- Fujitsu LifeBook P702 (Notebook)
    elseif (sp == "LIFEBOOK P702") then chain()
    end

  -- Gigabyte Technology
  elseif (bm == "Gigabyte Technology Co., Ltd.") then
    if (false) then
    -- Gigabyte B75M-D3H (Mainboard)
    elseif (bp == "B75M-D3H") then chain()
    -- Gigabyte EP31-DS3L (Mainboard)
    elseif (bp == "EP31-DS3L") then chain()
    -- Gigabyte Technology H81M-D2W (Mainboard)
    elseif (bp == "H81M-D2W") then chain()
    end

  -- HP
  elseif (sm == "Hewlett-Packard") then
    if (false) then
    -- HP 630 (Notebook)
    elseif (sp == "HP 630 Notebook PC              ") then chain()
    -- HP 635 (Notebook)
    elseif (sp == "HP 635 Notebook PC              ") then chain()
    -- HP 650 (Notebook)
    elseif (sp == "HP 650 Notebook PC") then chain()
    -- HP 655 (Notebook)
    elseif (sp == "HP 655 Notebook PC") then chain()
    -- HP Compaq 610 (Notebook)
    elseif (sp == "Compaq 610") then chain()
    -- HP d530 (Desktop PC)
    elseif (sp == "HP d530 SFF(DC578AV)") then chain()
    -- HP d530 (Desktop PC)
    elseif (sp == "HP d530 SFF(DG781A)") then chain()
    -- HP EliteBook 6930p (Notebook)
    elseif (sp == "HP EliteBook 6930p") then chain()
    -- HP Pavilion g6 (Notebook)
    elseif (sp == "HP Pavilion g6 Notebook PC      ") then chain()
    end

  -- Lenovo
  elseif (sm == "LENOVO") then
    if (false) then
    -- Lenovo B580 (Notebook)
    elseif (sv == "Lenovo B580") then chain()
    -- Lenovo Ideapad S10-2 (Notebook)
    elseif (sv == "Lenovo IdeaPad S10-2            ") then chain()
    -- Lenovo ThinkCentre E73 (Desktop PC)
    elseif (sv == "ThinkCentre E73") then chain()
    -- Lenovo ThinkCentre Edge72 (Desktop PC)
    elseif (sv == "ThinkCentre Edge72") then chain()
    -- Lenovo ThinkCentre M57 (Desktop PC)
    elseif (sv == "ThinkCentre M57") then chain()
    -- Lenovo ThinkCentre M72e (Desktop PC)
    elseif (sv == "ThinkCentre M72e") then chain()
    -- Lenovo ThinkCentre M73 (Desktop PC)
    elseif (sv == "ThinkCentre M73") then chain()
    -- Lenovo ThinkCentre M82 (Desktop PC)
    elseif (sv == "ThinkCentre M82") then chain()
    -- Lenovo ThinkCentre M82 (Desktop PC)
    elseif (sp == "2697") then chain()
    -- Lenovo ThinkCentre M82 (Desktop PC)
    elseif (sp == "2697B63") then chain()
    -- Lenovo ThinkCentre M92 (Desktop PC)
    elseif (sv == "ThinkCentre M92") then chain()
    -- Lenovo ThinkCentre M93 (Desktop PC)
    elseif (sv == "ThinkCentre M93") then chain()
    -- Lenovo ThinkPad Edge E520 (Notebook)
    elseif (sv == "ThinkPad E520") then chain()
    -- Lenovo ThinkPad T520 (Notebook)
    elseif (sv == "ThinkPad T520") then chain()
    end

  -- Oracle
  elseif (sm == "innotek GmbH") then
    if (false) then
    -- Oracle VirtualBox
    --[[
       This is a special case - VirtualBox usually works fine with LOCALBOOT,
       but it won't work when a CD image is mounted ("Boot failed: press a key
       to retry...." or "FATAL: INT18: BOOT FAILURE"). This usually implies
       that we're running from ISOLINUX installed on a CD, so this exception
       only occurs on ISOLINUX and not on PXELINUX.
    ]]--
    elseif (sp == "VirtualBox" and
      string.find(syslinux.version(), "ISOLINUX")) then chain()
    end

  -- Samsung
  elseif (sm == "SAMSUNG ELECTRONICS CO., LTD.") then
    -- Samsung 300E7A-S08 (Notebook)
    if (sp == "300E4A/300E5A/300E7A/3430EA/3530EA") then chain()
    end

  -- Toshiba
  elseif (sm == "TOSHIBA") then
    if (false) then
      -- Toshiba Satellite L300D (Notebook)
    elseif (sp == "Satellite L300D") then chain()
      -- Toshiba Satellite Pro C660 (Notebook)
    elseif (sp == "Satellite Pro C660") then chain()
      -- Toshiba Satellite Pro C850-1HL (Notebook)
    elseif (sp == "SATELLITE PRO C850-1HL") then chain()
      -- Toshiba Satellite Pro C850-1K0 (Notebook)
    elseif (sp == "Satellite Pro C850-1K0") then chain()
    end

  end
end

localboot()

-- vim: ft=lua
