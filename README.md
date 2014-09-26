localboot.lua
=============

A Lua script for syslinux' lua.c32 comboot module that uses DMI data to decide
between localboot / chainloading.

Introduction
------------
We use PXELINUX in our product to show a boot menu on client computers, with
options like "Boot from local hard disk", "Install Windows", etc.
Unfortunately, a lot of computers seem to have broken BIOSes and won't boot
with the LOCALBOOT command, and need to be booted with chain.c32 instead. We
also have encountered some computers where it works only the other way -
chainloading does not work, while LOCALBOOT works fine.

To solve this issue, we have written this Lua script that uses the DMI data of 
the computer to decide whether it should be booted with LOCALBOOT or chain.c32. 
The scripts defaults to LOCALBOOT, but has a list of exceptions for computers 
that require chainloading.

Syslinux compatibility
----------------------
We're still using Syslinux 4.05 in our company because this is the version
provided by Debian wheezy, and the script probably won't work out of the box
with newer Syslinux versions. It should be pretty simple to adapt though - I'll
look into that if I find the time. Patches/pull requests welcome :)

Setup
-----
- Copy `localboot.lua` to your `tftpboot` folder.
- Edit your `pxelinux.cfg`, and change the existing `LOCALBOOT` command to the following:

        kernel lua.c32
        append localboot.lua

debug.lua
---
You can optionally use the provided `debug.lua` script to collect the necessary
data for new exceptions. It will print the most relevant DMI data:

![debug.lua screenshot](https://raw.githubusercontent.com/martinvonwittich/localboot.lua/master/debug.png)

When one of your users encounters a computer that won't boot, you can instruct
them to boot `debug.lua` and send you a photo of the output.

Add an exception
---
To add the exception to the script, duplicate one of the `elseif` blocks and
modify the string matches and the descriptive comment. Note that string matches
are case sensitive and have to be exact. Look out for trailing spaces too -
some manufacturers use fixed string lengths and pad their strings with spaces,
e.g. "Acer            ". If you're copying the data from a `debug.lua`
screenshot, be sure to count these spaces carefully.

Usually what you want to match is either `system.manufacturer` and
`system.product_name` for OEM computers:

    sm == "Acer" and sp == "Aspire 3750"

Or `base_board.manufacturer` and `base_board.product_name` for custom built
computers:

    bm == "Gigabyte Technology Co., Ltd." and bp == "B75M-D3H"

After you have confirmed that the exception works, please consider to [file a
bug](https://github.com/martinvonwittich/localboot.lua/issues) or to send a
pull request so that everyone benefits of your improvement.
