task.wait(0.25)

if not readfile then
    LocalPlayer:Kick("Your exploit does not support `filesystem`, maybe upgrade your exploit?")
else
    if not isfolder("Vipor") then
        LocalPlayer:Kick("(E: 404) Vipor does not appear to exist within our database!")
    else
        if not isfolder("Vipor\\Downloads") then
            LocalPlayer:Kick("(E: 404) Vipor/Configurations does not appear to exist within our database!")
        end
    end
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt", true))()

task.wait(0.25)
local Services = {
	["Players"] = game:GetService("Players"),
}

local LocalPlayer = Services.Players.LocalPlayer

local Window = Library:Window("Proj. Vipor "..tostring(readfile("Vipor\\Downloads\\Version.lua")), Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightControl)

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
