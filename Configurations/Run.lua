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
        end
    end
end

writefile("Vipor\\Scripts\\9346039031.lua", "loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Suno/Vipor/main/Scripts/9346039031.lua', true))('9346039031')")

if not loadfile then
    return
end

task.wait(0.5)
do
    if game.PlaceId == 9346039031 then
        loadfile("Vipor\\Scripts\\9346039031.lua")
    end
end
