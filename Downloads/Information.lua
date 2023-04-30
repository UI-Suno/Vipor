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
        writefile("Vipor\\information.txt", "Vipor programmed by Suno#2182\nOpen-Sourced public project, you may use this code as you please!\n\nSkidded is allowed I guess, if you are brave enough to read all of this dogshit code, then go ahead and skid, I'm allowing you.\n\nVipor created by Suno#2182, No Rights Reserved, Open-Source\n\nAdd me on Discord if you have any questions, or just want to be friends! (Suno#2182 for the last time)")
    end
end
