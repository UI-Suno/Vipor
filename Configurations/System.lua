local Services = {
    ["Players"] = game:GetService("Players"),
}

local LocalPlayer = Services.Players;

if not makefolder then
    LocalPlayer:Kick("(E: 404) Your exploit does not support `filesystem`, maybe upgrade your exploit?")
else
    makefolder("Vipor")

    makefolder("Vipor\\Configurations")
    makefolder("Vipor\\Downloads")
    makefolder("Vipor\\Scripts")
end
