task.wait(0.5)

local PlaceIDs = {
	["Tower Of Hell"] = 1962086868,
	["Tower Of Hell Appeals"] = 5253186791,
}

if game.PlaceId == PlaceIDs["Tower Of Hell"] or PlaceIDs["Tower Of Hell Appeals"] then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/UI-Suno/Vipor/main/Scripts/1962086868.lua", true))("Tower Of Hell")
end