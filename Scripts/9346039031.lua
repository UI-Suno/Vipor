local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/UI-Suno/Vipor/main/Downloads/Library.lua", true))("Library")

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
