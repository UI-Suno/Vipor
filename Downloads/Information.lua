task.wait(0.5)

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
		writefile("Vipor\\Information.txt", [[
* Vipor
Programmed by Suno!
Created as an Open-Sourced project!

* Media
https://linktr.ee/sunoui
Discord: Suno#2182

* Explanation
Vipor uses Synapse's, or Script-Ware's FileSystem function to upload the files to your computer, and GitHub to actually store, and load the files between each other.
I know Vipor's system could possibly be upgraded, but this is the best I could come up with.
Since Lua is not my strongsuit when it comes to programming, please don't make fun of me for the bad coding, and no comments.

* Use
You may use this code freely, and you may look, or use the code.
If you were to use the code, try to give me credits in any way, shape, or form.
The code is 100% public, so there is no need to worry about copyright.
        ]])
	end
end