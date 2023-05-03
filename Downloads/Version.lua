task.wait(0.5)

local Version = "1.0.1"

local Services = {
    ["Players"] = game:GetService("Players")
}

local LocalPlayer = Services.Players.LocalPlayer

if not writefile then
    LocalPlayer:Kick("Your exploit does not support `filesystem`, maybe upgrade your exploit?")
else
    if not isfolder("Vipor") then
        LocalPlayer:Kick("(E: 404) Vipor does not appear to exist within our database!")
    else
        if not isfolder("Vipor\\Downloads") then
            LocalPlayer:Kick("(E: 404) Vipor/Configurations does not appear to exist within our database!")
        else
            writefile("Vipor\\Downloads\\Version.lua", tostring(Version))
        end
    end
end
