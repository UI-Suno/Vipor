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

local Cooldown = false

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt", true))()

task.wait(0.25)
local Services = {
	["Players"] = game:GetService("Players"),
	["TeleportService"] = game:GetService("TeleportService"),
	["TweenService"] = game:GetService("TweenService"),
}

local LocalPlayer = Services.Players.LocalPlayer
local Humanoid = LocalPlayer.Character.Humanoid

Bypass_AC = function()
	local reg = getreg()

	for i, Function in next, reg do
		if type(Function) == 'function' then
			local info = getinfo(Function)

			if info.name == 'kick' then
				if (hookfunction(info.func, function(...)
				end)) then
					print'succesfully hooked kick'
				else
					print'failed to hook kick'
				end
			end
		end
	end
	local playerscripts = game:GetService'Players'.LocalPlayer.PlayerScripts

	local script1 = playerscripts.LocalScript
	local script2 = playerscripts.LocalScript2

	local script1signal = script1.Changed
	local script2signal = script2.Changed

	for i, connection in next, getconnections(script1signal) do
		connection:Disable()
	end
	for i, connection in next, getconnections(script2signal) do
		connection:Disable()
	end

	script1:Destroy()
	script2:Destroy()
end

coroutine.wrap(function()
	function on_Start()
		while task.wait() do
			for i, v in pairs(workspace.tower.finishes:GetChildren()) do
				v.Material = Enum.Material.Plastic
			end
			workspace.tower.finishes.Material = Enum.Material.Plastic
			for i, v in pairs(workspace.tower.sections.start.floor:GetChildren()) do
				if v.Name == "Part" then
					for i, j in pairs(v:GetChildren()) do
						if j.Name == "rgbPart" then
							j.Parent:Destroy()
						end
					end
				end
			end
		end
	end
	on_Start()
end)()

local Window = Library:Window("Proj. Vipor "..tostring(readfile("Vipor\\Downloads\\Version.lua")), Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightControl)

local SystemsSettings = Window:Tab("⚙️ Systems")
local DefyAC = SystemsSettings:Button("Defy Anti-Cheat", function()
	Bypass_AC()
end)
local Auto_Bypass = SystemsSettings:Toggle("Auto Bypass", true, function(Tog)
	coroutine.wrap(function()
		repeat
			task.wait()
			if Tog == true then
				Bypass_AC()
			end
		until Tog == false
	end)()
end)

local ToolsSettings = Window:Tab("⚒️ Tools")
local GrabAll = ToolsSettings:Button("Take All", function()
	for _, e in pairs(LocalPlayer.Backpack:GetDescendants()) do
		if e:IsA("Tool") then
			e:Destroy()
		end
	end
	task.wait() 
	for _, v in pairs(game.ReplicatedStorage.Gear:GetDescendants()) do
		if v:IsA("Tool") then
			local CloneThings = v:Clone()
			task.wait()
			CloneThings.Parent = LocalPlayer.Backpack
		end
	end
end)
local GrabDropdown = ToolsSettings:Dropdown("Select Tools", {
	"cola",
	"bomb",
	"hourglass",
	"killpart",
	"yxterminator",
	"fusion",
	"jump",
	"speed",
	"hook",
	"gravity",
	"trowel"
}, function(Dro)
	for _, v in pairs(game.ReplicatedStorage.Gear:GetDescendants()) do
		if v:IsA("Tool") and v.Name == ""..Dro.."" then
			local CloneThings = v:Clone()
			task.wait()
			CloneThings.Parent = LocalPlayer.Backpack
		end
	end
end)
local ClearBag = ToolsSettings:Button("Clear Backpack", function()
	for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
		v:Destroy()
	end
end)

local StageSettings = Window:Tab("💨 Locations")
local Stage = {}
for _, descendant in ipairs(game:GetService("Workspace").tower.sections:GetChildren()) do
	if descendant:IsA("Model") then
		table.insert(Stage, descendant.Name)
		if descendant.Name == "start" then
			table.remove(Stage, 1)
		elseif descendant.Name == "finish" then
			table.remove(Stage, 7)
		end
	end
end
coroutine.wrap(function()
	repeat
		task.wait(15)
		if game:GetService("CoreGui").ui.Main.TabFolder.Tab.Dropdown.DropdownTitle.Text == "Stages" then
			game:GetService("CoreGui").ui.Main.TabFolder.Tab.Dropdown:Destroy()
		end
	until not game:GetService("CoreGui").ui.Main.TabFolder.Tab.Dropdown

	task.wait(0.15)
	local Stages = StageSettings:Dropdown("Stages", Stage, function(Dro)
		LocalPlayer.Character.HumanoidRootPart.CFrame = Dro.CFrame
	end)
end)()
local FinishZoneTP = StageSettings:Button("Finish Zone", function()
	local Path = game:GetService("Workspace").tower.sections.finish.steps.floorCenter

	Path.Rotation = Vector3.new(0, 0, 0)
	LocalPlayer.Character.HumanoidRootPart.CFrame = Path.CFrame + Vector3.new(0, 5, 0)

	task.wait(0.15)
	Path.Rotation = Vector3.new(0, 45, 90)
end)
local BeginningTP = StageSettings:Button("Beginning Zone", function()
	game:GetService("Workspace").tower.sections.start.center.Rotation = Vector3.new(0, 0, 0)
	LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").tower.sections.start.center.CFrame

	task.wait(0.05)
	game:GetService("Workspace").tower.sections.start.center.Rotation = Vector3.new(0, 0, -90)
end)

local MapSettings = Window:Tab("🗺️ Map")
local RecolorParts = MapSettings:Colorpicker("Recolor Kill Part", Color3.fromRGB(255, 0, 0), function(Col)
	for i, v in pairs(game:GetService("Workspace").tower:GetDescendants()) do
		if v:IsA("BoolValue") and v.Name == "kills" then
			v.Parent.Color = Col
		end
	end
end)
local KillPartTransparency = MapSettings:Slider("Kill Part Transparency", 0, 100, 0, function(Sli)
	for i, v in pairs(game:GetService("Workspace").tower:GetDescendants()) do
		if v:IsA("BoolValue") and v.Name == "kills" then
			v.Parent.Transparency = Sli / 100
		end
	end
end)
local DestroyParts = MapSettings:Button("Destroy Kill Part", function()
	for i, v in pairs(game:GetService("Workspace").tower:GetDescendants()) do
		if v:IsA("BoolValue") and v.Name == "kills" then
			v.Parent:Destroy()
		end
	end
end)

local StatsSettings = Window:Tab("📈 Stats")
local GoldFarm = StatsSettings:Button("Farm Coins", function()
	for i, v in pairs(game:GetService("Workspace").tower.sections:GetChildren()) do
		if v.Name ~= "start" then
			for i, j in pairs(v:GetChildren()) do
				if j.Name == "start" then
					Value = 0
					repeat
						Value += 1
						local SavedRot = j.Rotation
						local SavedPos = LocalPlayer.Character.HumanoidRootPart.CFrame

						j.Rotation = Vector3.new(0, 0, 0)
						LocalPlayer.Character.HumanoidRootPart.CFrame = j.CFrame + Vector3.new(0, 5, 0)

						j.Rotation = SavedRot

						task.wait(0.25)
						LocalPlayer.Character.HumanoidRootPart.CFrame = SavedPos
					until Value == 5
				end
			end
		end
	end
end)
getgenv().Farming = false
local FinishTP = StatsSettings:Button("Finish", function()
	if not Cooldown then
		Cooldown = true
		local SavedPos = LocalPlayer.Character.HumanoidRootPart.CFrame
		Value = 0
		local Part = Instance.new("Part", workspace)
		Part.Name = "PlatformPart"
		Part.Anchored = true
		Part.CanCollide = true
		Part.Transparency = 1
		Part.CFrame = CFrame.new(500, 0, 500)
		LocalPlayer.Character.HumanoidRootPart.CFrame = Part.CFrame + Vector3.new(0, 5, 0)
		LocalPlayer.Character.HumanoidRootPart.Anchored = true
		task.wait(2)
		LocalPlayer.Character.HumanoidRootPart.Anchored = false
		repeat
			LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").tower.finishes.Finish.CFrame
			task.wait(0.025)
			LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").tower.finishes.Finish.CFrame + Vector3.new(-2, 0, -1)
			task.wait(0.025)
			LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").tower.finishes.Finish.CFrame + Vector3.new(0, 2, -2)
			task.wait(0.15)
			LocalPlayer.Character.HumanoidRootPart.CFrame = SavedPos
		until game:GetService("Players").LocalPlayer.PlayerGui.timer.timeLeft.TextColor3 == Color3.fromRGB(0, 255, 0)
		Part:Destroy()
		Cooldown = false
	end
end)

local PlayerSettings = Window:Tab("😎 Player")
local JP = PlayerSettings:Textbox("Jumping Power", true, function(Tex)
	LocalPlayer.Character.Humanoid.JumpPower = Tex
end)
local WS = PlayerSettings:Textbox("Walking Speed", true, function(Tex)
	LocalPlayer.Character.Humanoid.WalkSpeed = Tex
end)
local ResetInfo = PlayerSettings:Button("Reset Characteristics", function()
	LocalPlayer.Character.Humanoid.WalkSpeed = 16
	LocalPlayer.Character.Humanoid.JumpPower = 50
end)
local Godmode = PlayerSettings:Button("Godmode", function()
	for i, v in pairs(game:GetService("Workspace").tower:GetDescendants()) do
		if v:IsA("BoolValue") and v.Name == "kills" then
			v:Destroy()
		end
	end
end)
local ResetChar = PlayerSettings:Button("Reset Character", function()
	local SavedPos = LocalPlayer.Character.HumanoidRootPart.CFrame
	LocalPlayer.Character.Head:Destroy()

	task.wait(2.5)
	LocalPlayer.Character.HumanoidRootPart.CFrame = SavedPos
end)
local GetBanned = PlayerSettings:Button("Get Banned", function()
	local character = LocalPlayer.Character
	local bodyForce = Instance.new("BodyForce")
	bodyForce.Force = Vector3.new(0, 0, 0)
	bodyForce.Parent = character.HumanoidRootPart
end)

local GameSettings = Window:Tab("🌍 Game")
local Quit = GameSettings:Button("Quit Game", function()
	LocalPlayer:Kick("You have left the game, Roblox will shut down in approximately 3 seconds.")
	task.wait(2.75)
	game:Shutdown()
end)
local RejoinSession = GameSettings:Button("Rejoin Current", function()
	Services.TeleportService:Teleport(game.PlaceId, LocalPlayer)
end)
local ServerHop = GameSettings:Button("Server Swap", function()
	local PlaceID = game.PlaceId
	local AllIDs = {}
	local foundAnything = ""
	local actualHour = os.date("!*t").hour
	local Deleted = false
	local File = pcall(function()
		AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
	end)
	if not File then
		table.insert(AllIDs, actualHour)
		writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
	end
	function TPReturner()
		local Site;
		if foundAnything == "" then
			Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/'..PlaceID..'/servers/Public?sortOrder=Asc&limit=100'))
		else
			Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/'..PlaceID..'/servers/Public?sortOrder=Asc&limit=100&cursor='..foundAnything))
		end
		local ID = ""
		if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
			foundAnything = Site.nextPageCursor
		end
		local num = 0;
		for i, v in pairs(Site.data) do
			local Possible = true
			ID = tostring(v.id)
			if tonumber(v.maxPlayers) > tonumber(v.playing) then
				for _, Existing in pairs(AllIDs) do
					if num ~= 0 then
						if ID == tostring(Existing) then
							Possible = false
						end
					else
						if tonumber(actualHour) ~= tonumber(Existing) then
							local delFile = pcall(function()
								delfile("NotSameServers.json")
								AllIDs = {}
								table.insert(AllIDs, actualHour)
							end)
						end
					end
					num = num + 1
				end
				if Possible == true then
					table.insert(AllIDs, ID)
					wait()
					pcall(function()
						writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
						wait()
						game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, LocalPlayer)
					end)
					wait(4)
				end
			end
		end
	end

	function Teleport()
		while wait() do
			pcall(function()
				TPReturner()
				if foundAnything ~= "" then
					TPReturner()
				end
			end)
		end
	end

	Teleport()
end)

local Appeals = Window:Tab("📜 Appeal")
local Signature = Appeals:Button("Copy Appeal Letter", function()
	setclipboard("I acknowledge that i have been banned justly for exploiting and hereby agree that i will not do so again. Furthermore i agree to have all my progress in the game deleted and wait 7 more days until i am unbanned")
end)
local AutoAppeal = Appeals:Button("Automatically Appeal", function()
	game:GetService("Players").LocalPlayer.PlayerGui.shop2.shop.items.appeal.agreementBox.Text = "I acknowledge that i have been banned justly for exploiting and hereby agree that i will not do so again. Furthermore i agree to have all my progress in the game deleted and wait 7 more days until i am unbanned"
	local button = game:GetService("Players").LocalPlayer.PlayerGui.shop2.shop.items.appeal.appeal
	local VirtualUser = game:GetService("VirtualUser")
	VirtualUser:CaptureController()
	wait(1)
	button.AutoButtonColor = false
	VirtualUser:SetMouseButtonState(Enum.UserInputType.MouseButton1, true)
	wait(0.1)
	VirtualUser:SetMouseButtonState(Enum.UserInputType.MouseButton1, false)
	button.AutoButtonColor = true
end)