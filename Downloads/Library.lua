task.wait(0.25)

local Services = {
    ["Players"] = game:GetService("Players"),
}

local LocalPlayer = Services.Players.LocalPlayer;

if not makefolder then
    LocalPlayer:Kick("Your exploit does not support `filesystem`, maybe upgrade your exploit?")
else
    if not isfolder("Vipor") then
        LocalPlayer:Kick("(E: 404) Vipor does not appear to exist within our database!")
    else
        if not isfolder("Vipor\\Downloads") then
            LocalPlayer:Kick("(E: 404) Vipor/Configurations does not appear to exist within our database!")
        else
            writefile("Vapor\\Downloads\\Library.lua", "loadstring(game:HttpGet'https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt')()")
        end
    end
end
