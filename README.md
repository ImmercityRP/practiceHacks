# practiceHacks
FiveM Script to Practice Hacking Mini-Games

Very simple script - adds a Hacker Computer to Lester's House on Amarillo Vista in El Burro Heights.

Uses either bt-target or qtarget to access the computer.

The computer pops up an ESX Menu with each Hack that is enabled in the Config. 

Players pay a Config Set Price per practice run, which comes out of a Config Set Account (Cash/Bank/Dirty)

Difficulty can be adjusted in the Config for the minigames that support it.

Price Display can be enabled or disabled via Config.

After the hack is over, an ESX Notification of Success or Failed is displayed.

# Installation
- Download and extract the folder to your [resources]
- Add `ensure practiceHacks` to your _**server.cfg**_
- Configure _**config.lua**_ to your preference

# Requirements
- **es_extended** (Tested on 1.3.5 Legacy - Should work on 1.2+/Any Legacy Branch)

- **bt-target** - https://github.com/brentN5/bt-target 

    **OR**

- **qtarget** - https://github.com/overextended/qtarget

### If using bt-target:
  - Requires the `AddBoxZone` export 
  - If you use any of Kallock's scripts, you should already have this
  - If not, add the following to your client/main.lua inside of bt-target
    ```
    function AddEntityZone(name, entity, options, targetoptions)
        Zones[name] = EntityZone:Create(entity, options) 
        Zones[name].targetoptions = targetoptions 
    end 
    
    exports('AddEntityZone', AddEntityZone)
    ```
    
# Optional:
[fallouthacking](https://forum.cfx.re/t/free-fallout-hacking-minigame/4805233)

[fivem-drilling](https://github.com/meta-hub/fivem-drilling)

[mhacking](https://github.com/justgreatgaming/FiveM-Scripts-2/tree/master/mhacking)

[ModFreakz Lockpicking V2](https://modit.store/products/mf-lockpicking-v2)

[ModFreakz Thermite](https://modit.store/products/modfreakz-thermite-minigame)

[utk-fingerprint](https://forum.cfx.re/t/finger-print-hacking-mini-game-standalone/1185122)

[ultra-voltlab](https://forum.cfx.re/t/release-voltlab-hacking-minigame-cayo-perico-mission/3933171)

[ultra-keypackhack](https://forum.cfx.re/t/release-casino-keypad-hacking-minigame-memory-minigame/4800359)
