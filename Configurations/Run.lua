task.wait(0.25)

local Services = {
    ["Players"] = game:GetService("Players"),
}

local LocalPlayer = Services.Players.LocalPlayer;

if not writefile then
    LocalPlayer:Kick("Your exploit does not support `filesystem`, maybe upgrade your exploit?")
else
    if not isfolder("Vipor") then
        LocalPlayer:Kick("(E: 404) Vipor does not appear to exist within our database!")
    else
        if not isfolder("Vipor\\Scripts") then
            LocalPlayer:Kick("(E: 404) Vipor/Configurations does not appear to exist within our database!")
        else
            writefile("Vipor\\Scripts\\9346039031.lua", [[
task.wait(0.25)

local Library
if not readfile then
    LocalPlayer:Kick("Your exploit does not support `filesystem`, maybe upgrade your exploit?")
else
    if not isfolder("Vipor") then
        LocalPlayer:Kick("(E: 404) Vipor does not appear to exist within our database!")
    else
        if not isfolder("Vipor\\Downloads") then
            LocalPlayer:Kick("(E: 404) Vipor/Configurations does not appear to exist within our database!")
        else
            Library = readfile("Vapor\\Downloads\\Library.lua")
        end
    end
end

local Services = {
	["Players"] = game:GetService("Players"),
}

local LocalPlayer = Services.Players.LocalPlayer

local Window = Library:Window("My Hello Kitty Cafe (9346039031) 🐱", Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightControl)

local Discovery = Window:Tab("Discovery 🔎")
Discovery:Label("Diamonds")
Discovery:Button("Collect Diamond Chests", function()
	coroutine.wrap(function()
		for i, v in pairs(game:GetService("Workspace").TreasureEntity["SB BaoXiang 001"]:GetChildren()) do
			if v.ClassName == "MeshPart" then
				v.CanCollide = false

				for i, j in pairs(game:GetService("Workspace").TreasureEntity["SB BaoXiang 001"]["Meshes/SB BaoXiang 002 (2)"]:GetChildren()) do
					if j.ClassName == "Part" then
						j.CanCollide = false

						LocalPlayer.Character.HumanoidRootPart.CFrame = j.CFrame
					end
				end
			end
		end
	end)()
end)
            ]])
        end
    end
end

task.wait(0.25)
coroutine.wrap(function()
    if game.PlaceId == 9346039031 then
        dofile("Vipor\\Scripts\\9346039031.lua")
    end
end)()
