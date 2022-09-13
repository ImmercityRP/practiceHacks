Config = {} -- Don't remove
-- Default Location is Lester's House on Amarillo Vista in El Burro Heights.
-- You must edit the client.lua to change the BoxZone and Animation coordinates if you wish to relocate it.

Config.Location = vector4(1276.173, -1709.981, 55.11777, 205.11) -- Location of the BoxZone. To adjust size of box edit the top of client.lua for your respective target system.

Config.Target = 'bt-target' -- 'bt-target' OR 'qtarget'

Config.Account = 'Dirty' -- Practice Hack Payment Account = 'Cash' OR 'Bank' OR 'Dirty'

Config.ShowPrice = true -- Display Hack Test Price in the Menu. True OR False - the menu will sort by the prices set below.

Config.Hacks = { -- Don't rename the Hacks, it will break functionality.
    Lockpick = {enabled = true, price = 500}, -- ModFreakz Lockpick V2 - PAID - (https://modit.store/products/mf-lockpicking-v2)
    Drilling = {enabled = true, price = 1000}, -- FiveM-Drilling - FREE - (https://github.com/meta-hub/fivem-drilling)
    Voltlab = {enabled = true, price = 2500, time = 30}, -- ultra-Voltlab - FREE - (https://forum.cfx.re/t/release-voltlab-hacking-minigame-cayo-perico-mission/3933171)
    Fallout = {enabled = true, price = 10000, wordLength = 4, tries = 6}, -- fallouthacking - FREE - (https://forum.cfx.re/t/free-fallout-hacking-minigame/4805233)
    Hacking = {enabled = true, price = 15000, length = 5, duration = 60}, -- mhacking - FREE - (https://github.com/justgreatgaming/FiveM-Scripts-2/tree/master/mhacking)
    Fingerprint = {enabled = true, price = 25000, levels = 2, tries = 6, time = 5}, -- utk-fingerprint - FREE - (https://forum.cfx.re/t/finger-print-hacking-mini-game-standalone/1185122)
    Thermite = {enabled = true, price = 50000}, -- ModFreakz Thermite - PAID - (https://modit.store/products/modfreakz-thermite-minigame)
    Keypad = {enabled = true, price = 100000, tries = 6, time = 180}, -- ultra-keypackhack - FREE - (https://forum.cfx.re/t/release-casino-keypad-hacking-minigame-memory-minigame/4800359)
}
