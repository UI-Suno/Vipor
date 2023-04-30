local Services = {
    ["Players"] = game:GetService("Players"),
}

local LocalPlayer = Services.Players.LocalPlayer;

if not makefolder then
    LocalPlayer:Kick("(E: 404) Your exploit does not support `filesystem`, maybe upgrade your exploit?")
else
    if isfolder("Vipor\\Downloads") then
        if isfile("Vipor\\Downloads\\Developer.lua") then
            if readfile("Vipor\\Downloads\\Developer.lua") == true or readfile("Vipor\\Downloads\\Developer.lua") == "true" then
                delfolder("Vipor")
            end
        end
    end
    task.wait(0.15)

    makefolder("Vipor")

    makefolder("Vipor\\Configurations")
    makefolder("Vipor\\Downloads")
    makefolder("Vipor\\Scripts")
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/UI-Suno/Vipor/main/Configurations/Executor.lua", true))("Executor")
loadstring(game:HttpGet("https://raw.githubusercontent.com/UI-Suno/Vipor/main/Project/Downloads.lua", true))("Downloads")
loadstring(game:HttpGet("https://raw.githubusercontent.com/UI-Suno/Vipor/main/Configurations/Run.lua", true))("Run")
