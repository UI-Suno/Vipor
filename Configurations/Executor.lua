task.wait(0.25)

local Services = {
    ["Players"] = game:GetService("Players"),
}

local LocalPlayer = Services.Players.LocalPlayer;

local Identified_Executor = nil;

if Identified_Executor == nil then
    if identifyexecutor() == "ScriptWare" or identifyexecutor() == "Script-Ware" then
        Identified_Executor = "Script-Ware"
    elseif syn then
        Identified_Executor = "Synapse-X"
    elseif not syn or not identifyexecutor() == "ScriptWare" or identifyexecutor() == "Script-Ware" then
        LocalPlayer:Kick("Your exploit does not seem to be supported with Vipor.")
    end
else
    return print("Vipor | Identified_Executor has already been Identified! | File: Configurations\\executor.lua")
end

if not writefile then
    LocalPlayer:Kick("Your exploit does not support `filesystem`, maybe upgrade your exploit?")
else
    if not isfolder("Vipor") then
        LocalPlayer:Kick("(E: 404) Vipor does not appear to exist within our database!")
    else
        if not isfolder("Vipor\\Configurations") then
            LocalPlayer:Kick("(E: 404) Vipor/Configurations does not appear to exist within our database!")
        else
            if Identified_Executor ~= nil then
                writefile("Vipor\\Configurations\\Executor.lua", tostring(Identified_Executor))
            else
                LocalPlayer:Kick("(E: 404) Identified_Executor does not seem to detect your executor.")
            end
        end
    end
end
