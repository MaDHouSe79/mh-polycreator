### mh-polycreator (dev tool)
- This script wil help you to create polyzones ingame very easy
- you are able to make the polyzones very precise where you want it.
- as big or small as you want, all the code you need for your polyzone will be saved inside `configs/zones.lua`


### Install
- create a folder `[mh]` in your `resources` folder, that place `mh-polycreator` inside `[mh]` folder
- open your server.cfg and add `ensure [mh]` then restart your server.


### How to use the commands
- To begin typ `/createzone [zonename]` 
- - you will see a white line so you can point to a location where you want to place a poly point.
- if there is already a zone with this name you get a notify and you have to,  
- - 1: delete this from the zones.lua 
- - 2: use a other zone name.
-
- Press [`E`] to create a poly point on point of view 
- - You will see a red line when you press `E`
- - - use the white line on ground point as a guideline to add your point
- 
- Press [`F`] to remove a point on point of view
- - You need to look at the point you want to remove. 
- - - use the white line on ground point as a guideline to remove your point
- 
- Press [`G`] save the polyzone in the `configs/zones.lua` file
- - this file is located in `configs` folder file name `zones.lua`
- You can now copy the code in `configs/zones.lua` and use it in other scripts that uses polyzone.



### Example Created Zone
- you only need the `Zone Block` from `(Zone Block (Start))` to `(Zone Block (End))` for other scripts that uses polyzone.
- you maby have to change the `Zone` and or `Shape` name to the needs of the script you are using, 
- cause not every script use the name `Zone` and or `Shape`. so change this if needed.
```lua

-- Zone: Testing in Street: Strawberry Ave,
-- Created by: MaDHouSe - Date: 2022/11/02 Time 11:06:17,
Config.Zones['Testing'] = {
    ['Zone'] = { -- <--- Zone Block (Start)
        ['Shape'] = {
            vector2(209.73970031738, -936.5283203125),
            vector2(206.48246765137, -941.20812988281),
            vector2(201.56884765625, -937.75714111328),
            vector2(204.84262084961, -933.10949707031),
        },
        name = 'zone_testing',
        minZ = 27.69179725647,
        maxZ = 33.69179725647,
        debugPoly = false,
    }, -- <-- Zone Block (End)
}

```

## 🐞 Any bugs issues or suggestions, let my know. 👊😎

## 🙈 Youtube & Discord
- [Youtube](https://www.youtube.com/@MaDHouSe79) for videos
- [Discord](https://discord.gg/cEMSeE9dgS)
