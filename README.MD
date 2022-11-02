### mh-polycreator
- This script wil help you to create polyzones very easy
- this create a polyzone in game, so you are able to make the polyzones very precise where you want it.
- as big or small as you want, all the code you need for your polyzone will be saved inside `configs/zones.lua`


### Commands
- To begin typ `/create-zone [zonename]` 
- - you will see a white line so you can point to a location where you want to place a poly point.
- if there is already a zone with this name you get a notify and you have to,  
- - 1: delete this from the zones.lua 
- - 2: use a other zone name.

- Press [`E`] to create a poly point on point of view 
- - You will see a red line when you press `E`
- Press [`F`] to remove a point on point of view
- - You need to look at the point you want to remove.
- Prees [`G`] save the polyzone in the `configs/zones.lua` file
- - this file is located in `configs` folder file name `zones.lua`
- You can now copy the code in `configs/zones.lua` and use it in other scripts that uses polyzone.



### Example Created Zone
- you only need the `Zone Block` from `start` to `end` for other scripts that uses polyzone.
```lua
Config.Zones['MaDHouSe'] = {
    ['Zone'] = { -- <--- Zone Block (Start)
        ['Shape'] = {
            vector2(239.43424987793, -753.51196289062),
            vector2(245.28369140625, -755.63293457031),
            vector2(243.78074645996, -759.85168457031),
            vector2(237.9564666748, -757.67700195312),
        },
        name = 'zone_madhouse',
        minZ = 27.826507568359,
        maxZ = 33.826507568359,
        debugPoly = false,
    }, -- <-- Zone Block (End)
}
```
