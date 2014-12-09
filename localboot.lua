-- localboot.lua - a Lua script for syslinux' lua.c32 comboot module that uses
--                         DMI data to decide between localboot / chainloading
-- Copyright (C) 2014  Martin v. Wittich, IServ GmbH <martin.von.wittich@iserv.eu>
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

-- version 2014-09-26
--
-- sorting aid:
--   diff -u <(grep '^    --' localboot.lua) <(grep '^    --' localboot.lua | sort)
--
-- syntax check:
--   sudo aptitude install lua5.1
--   luac5.1 localboot.lua && rm -f luac.out && echo "OK"

if(not dmi.supported())
then
  syslinux.local_boot(0)
else
  dmitable = dmi.gettable()
  sm = dmitable["system.manufacturer"]
  sv = dmitable["system.version"]
  sp = dmitable["system.product_name"]
  bm = dmitable["base_board.manufacturer"]
  bp = dmitable["base_board.product_name"]
  -- hack so that every line that follows begins with "elseif"
  if (false) then

  -- Acer
  elseif (sm == "Acer" and sp == "Aspire 3750") then
    -- Acer Aspire 3750 (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Acer" and sp == "Aspire 3810T") then
    -- Acer Aspire 3810T (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Acer" and sp == "Aspire 5820TG") then
    -- Acer Aspire 5820TG (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Acer" and sp == "ASE571/AST671") then
    -- Acer Aspire ASE571/AST671 (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Acer" and sp == "Aspire One 753") then
    -- Acer Aspire One 753 (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Acer" and sp == "AOA150") then
    -- Acer Aspire One AOA150 (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Acer            " and sp == "AOD255          ") then
    -- Acer Aspire One D255 (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Acer" and sp == "Aspire XC600") then
    -- Acer Aspire XC600 (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Acer" and sp == "Revo 70") then
    -- Acer Revo 70 (Desktop PC)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Acer" and sp == "TravelMate 5735Z") then
    -- Acer TravelMate 5735Z (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Acer" and sp == "Calpella") then
    -- Acer TravelMate 5740-332G25Mn (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Acer            " and sp == "TravelMate 5740 ") then
    -- Acer TravelMate 5740 (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Acer" and sp == "TravelMate 5742") then
    -- Acer TravelMate 5742 (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Acer" and sp == "TravelMate 5744") then
    -- Acer TravelMate 5744 (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Acer" and sp == "TravelMate 5760G") then
    -- Acer TravelMate 5760G (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Acer" and sp == "TravelMate 5760") then
    -- Acer TravelMate 5760 (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Acer" and sp == "TravelMate 8571") then
    -- Acer TravelMate 8571 (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Acer" and sp == "TravelMate P653-M") then
    -- Acer TravelMate P653-M (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Acer" and sp == "AO531h") then
    -- Acer TravelMate P653-M (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Acer" and sp == "Veriton E430G") then
    -- Acer Veriton E430G (Desktop-PC)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Acer                  " and sp == "Veriton L460") then
    -- Acer Veriton L460 (Desktop PC)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Acer" and sp == "Veriton M2610G") then
    -- Acer Veriton M2610G (Desktop PC)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Acer" and sp == "Veriton M290") then
    -- Acer Veriton M290 (Desktop PC)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Acer" and sp == "Veriton N4620G") then
    -- Acer Veriton N4620G (Desktop PC)
    syslinux.run_command("chain.c32 hd0")

  -- ASUS
  elseif (bm == "ASUSTeK Computer INC." and bp == "A8N-VM T-System-CSM") then
    -- ASUS A8N-VM (Mainboard)
    syslinux.run_command("chain.c32 hd0")
  elseif (bm == "ASUSTeK COMPUTER INC." and bp == "B85M-E") then
    -- ASUS B85M-E (Mainboard)
    syslinux.run_command("chain.c32 hd0")
  elseif (bm == "ASUSTeK COMPUTER INC." and bp == "H81M2") then
    -- ASUS H81M2 (Mainboard)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "ASUS" and bp == "H81M-PLUS") then
    -- ASUS H81Mi+ (Mainboard)
    syslinux.run_command("chain.c32 hd0")
  elseif (bm == "ASUSTeK COMPUTER INC." and bp == "H81M-K") then
    -- ASUS H81M-K (Mainboard)
    syslinux.run_command("chain.c32 hd0")
  elseif (bm == "ASUSTeK Computer INC." and bp == "M2N-VM DVI") then
    -- ASUS M2N-VM DVI (Mainboard)
    syslinux.run_command("chain.c32 hd0")
  elseif (bm == "ASUSTeK Computer INC." and bp == "M2N-VM SE") then
    -- ASUS M2N-VM SE (Mainboard)
    syslinux.run_command("chain.c32 hd0")
  elseif (bm == "ASUSTeK Computer INC." and bp == "M4N68T-M-LE-V2") then
    -- ASUS M4N68T-M-LE-V2 (Mainboard)
    syslinux.run_command("chain.c32 hd0")
  elseif (bm == "ASUSTeK Computer INC." and bp == "M5A78L-M LX") then
    -- ASUS M5A78L-M LX (Mainboard)
    syslinux.run_command("chain.c32 hd0")

  -- Bluechip
  elseif (sm == "bluechip Computer AG" and bp == "B85M-E") then
    -- Bluechip BUSINESSline M ZT i3-4130 (Desktop PC)
    syslinux.run_command("chain.c32 hd0")

  -- Compaq
  elseif (sm == "Compaq" and sp == "Evo D510 SFF") then
    -- Compaq Evo d510 SFF (Notebook)
    syslinux.run_command("chain.c32 hd0")

  -- Dell
  elseif (sm == "Dell Inc." and sp == "Latitude E5520") then
    -- Dell Latitude E5520 (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Dell Inc." and sp == "OptiPlex 3020") then
    -- Dell OptiPlex 3020 (Desktop PC)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Dell Inc." and sp == "OptiPlex 390") then
    -- Dell OptiPlex 390 (Desktop PC)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Dell Inc." and sp == "OptiPlex 790") then
    -- Dell OptiPlex 790 (Desktop PC)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Dell Inc." and sp == "OptiPlex 990") then
    -- Dell OptiPlex 990 (Desktop PC)
    syslinux.run_command("chain.c32 hd0")

  -- eMachines
  elseif (sm == "eMachines " and sp == "eMachines E725 ") then
    -- eMachines 725 (Notebook)
    syslinux.run_command("chain.c32 hd0")

  -- Fujitsu
  elseif (sm == "FUJITSU SIEMENS" and sp == "ESPRIMO E") then
    -- Fujitsu ESPRIMO E5915 (Desktop PC)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "FUJITSU SIEMENS" and sp == "ESPRIMO Mobile D9510") then
    -- Fujitsu Esprimo Mobile D9510 (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "FUJITSU SIEMENS" and sp == "ESPRIMO Mobile V5535") then
    -- Fujitsu Esprimo Mobile V5535 (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "FUJITSU                         " and sp == "ESPRIMO P5731                 ") then
    -- Fujitsu Esprimo P5731 (Desktop PC)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "FUJITSU" and sp == "ESPRIMO P910") then
    -- Fujitsu Esprimo P910 (Desktop PC)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "FUJITSU" and sp == "ESPRIMO Q510") then
    -- Fujitsu Esprimo Q510 (Desktop PC)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "FUJITSU" and sp == "LIFEBOOK A512") then
    -- Fujitsu LifeBook A512 (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "FUJITSU" and sp == "LIFEBOOK A530") then
    -- Fujitsu LifeBook A530 (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "FUJITSU" and sp == "LIFEBOOK A531") then
    -- Fujitsu LifeBook A531 (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "FUJITSU" and sp == "LIFEBOOK A532") then
    -- Fujitsu LifeBook A532 (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "FUJITSU" and sp == "LIFEBOOK P702") then
    -- Fujitsu LifeBook P702 (Notebook)
    syslinux.run_command("chain.c32 hd0")

  -- Gigabyte Technology
  elseif (bm == "Gigabyte Technology Co., Ltd." and bp == "B75M-D3H") then
    -- Gigabyte B75M-D3H (Mainboard)
    syslinux.run_command("chain.c32 hd0")
  elseif (bm == "Gigabyte Technology Co., Ltd." and bp == "EP31-DS3L") then
    -- Gigabyte EP31-DS3L (Mainboard)
    syslinux.run_command("chain.c32 hd0")
  elseif (bm == "Gigabyte Technology Co., Ltd." and bp == "H81M-D2W") then
    -- Gigabyte Technology H81M-D2W (Mainboard)
    syslinux.run_command("chain.c32 hd0")

  -- HP
  elseif (sm == "Hewlett-Packard" and sp == "HP 630 Notebook PC              ") then
    -- HP 630 (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Hewlett-Packard" and sp == "HP 635 Notebook PC              ") then
    -- HP 635 (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Hewlett-Packard" and sp == "HP 650 Notebook PC") then
    -- HP 650 (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Hewlett-Packard" and sp == "HP 655 Notebook PC") then
    -- HP 655 (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Hewlett-Packard" and sp == "Compaq 610") then
    -- HP Compaq 610 (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Hewlett-Packard" and sp == "HP d530 SFF(DC578AV)") then
    -- HP d530 (Desktop PC)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Hewlett-Packard" and sp == "HP d530 SFF(DG781A)") then
    -- HP d530 (Desktop PC)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Hewlett-Packard" and sp == "HP EliteBook 6930p") then
    -- HP EliteBook 6930p (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "Hewlett-Packard" and sp == "HP Pavilion g6 Notebook PC      ") then
    -- HP Pavilion g6 (Notebook)
    syslinux.run_command("chain.c32 hd0")

  -- Lenovo
  elseif (sm == "LENOVO" and sv == "Lenovo B580") then
    -- Lenovo B580 (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "LENOVO" and sv == "Lenovo IdeaPad S10-2            ") then
    -- Lenovo Ideapad S10-2 (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "LENOVO" and sv == "ThinkCentre E73") then
    -- Lenovo ThinkCentre E73 (Desktop PC)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "LENOVO" and sv == "ThinkCentre Edge72") then
    -- Lenovo ThinkCentre Edge72 (Desktop PC)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "LENOVO" and sv == "ThinkCentre M57") then
    -- Lenovo ThinkCentre M57 (Desktop PC)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "LENOVO" and sv == "ThinkCentre M72e") then
    -- Lenovo ThinkCentre M72e (Desktop PC)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "LENOVO" and sv == "ThinkCentre M73") then
    -- Lenovo ThinkCentre M73 (Desktop PC)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "LENOVO" and sv == "ThinkCentre M82") then
    -- Lenovo ThinkCentre M82 (Desktop PC)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "LENOVO" and sp == "2697") then
    -- Lenovo ThinkCentre M82 (Desktop PC)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "LENOVO" and sp == "2697B63") then
    -- Lenovo ThinkCentre M82 (Desktop PC)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "LENOVO" and sv == "ThinkCentre M92") then
    -- Lenovo ThinkCentre M92 (Desktop PC)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "LENOVO" and sv == "ThinkCentre M93") then
    -- Lenovo ThinkCentre M93 (Desktop PC)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "LENOVO" and sv == "ThinkPad E520") then
    -- Lenovo ThinkPad Edge E520 (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "LENOVO" and sv == "ThinkPad T520") then
    -- Lenovo ThinkPad T520 (Notebook)
    syslinux.run_command("chain.c32 hd0")

  -- Samsung
  elseif (sm == "SAMSUNG ELECTRONICS CO., LTD." and
      sp == "300E4A/300E5A/300E7A/3430EA/3530EA") then
    -- Samsung 300E7A-S08 (Notebook)
    syslinux.run_command("chain.c32 hd0")

  -- Toshiba
  elseif (sm == "TOSHIBA" and sp == "Satellite L300D") then
    -- Toshiba Satellite L300D (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "TOSHIBA" and sp == "Satellite Pro C660") then
    -- Toshiba Satellite Pro C660 (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "TOSHIBA" and sp == "SATELLITE PRO C850-1HL") then
    -- Toshiba Satellite Pro C850-1HL (Notebook)
    syslinux.run_command("chain.c32 hd0")
  elseif (sm == "TOSHIBA" and sp == "Satellite Pro C850-1K0") then
    -- Toshiba Satellite Pro C850-1K0 (Notebook)
    syslinux.run_command("chain.c32 hd0")

  end
  syslinux.local_boot(0)
end

-- vim: ft=lua
