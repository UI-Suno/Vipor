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
    ["TeleportService"] = game:GetService("TeleportService"),
}

local LocalPlayer = Services.Players.LocalPlayer
local Humanoid = LocalPlayer.Character.Humanoid

local Bypassed = false
Bypass_AC = function()
    local reg = getreg()
 
    for i, Function in next, reg do
        if type(Function) == 'function' then
            local info = getinfo(Function)
 
            if info.name == 'kick' then
                if (hookfunction(info.func, function(...)end)) then
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

    Bypassed = true
end

local Window = Library:Window("Proj. Vipor "..tostring(readfile("Vipor\\Downloads\\Version.lua")), Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightControl)

local SystemsSettings = Window:Tab("Systems ⚙️")
local AntiCheat_Config = SystemsSettings:Label("Anti Cheat Configurations")
local DefyAC = SystemsSettings:Button("Defy Anti-Cheat", function()
    Bypass_AC()
end)
local Auto_Bypass = Systems:Toggle("Auto Bypass", false, function(Tog)
    coroutine.wrap(function()
        repeat
            task.wait()
            if Tog == true then
                Bypass_AC()
            end
        until Tog == false
    end)()
end)

local PlayerSettings = Window:Tab("Player 😎")
local Humanoid_Config = PlayerSettings:Label("Humanoid Configurations")
local PlayerSpeed = PlayerSettings:Slider("Player Speed", 0, 150, 16, function(Sli)
    if not Bypassed then
        Library:Notification("Bypass Required", "You must use bypass the anti-cheat button before using this module.", "Okay.")
    else
        Humanoid.WalkSpeed = Sli
    end
end)

local GameSettings = Window:Tab("Game 🌍")
local Session_Config = GameSettings:Label("Session Configuration")
local RejoinSession = GameSettings:Button("Rejoin Current", function()
    Services.TeleportService:Teleport(game.PlaceId, LocalPlayer)
end)
