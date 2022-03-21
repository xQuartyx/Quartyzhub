--[[
    Credit : Shouko#0302
    FB : Mix Yasinthon
]]

-- Function Check CFrameQuest NPCName Mob
local function CheckLevel(lvl) -- function can put Level
    local Level = lvl or game:GetService("Players").LocalPlayer.PlayerStats.lvl.Value
    local QuestManager = require(game:GetService("ReplicatedStorage").Modules.QuestManager)
	if Level >= 1 and Level <= 9 then
		Lv = 1
		Mob = "Soldier [Lv. 1]"
	end
    for i,v in pairs(QuestManager) do
		if i:split(" ")[1] == "Kill" then
			if Level >= 2200 and game.PlaceId == 4520749081 then
				Lv = 2200
				Mob = "Seasoned Fishman [Lv. 2200]"
		    elseif Level >= v.Level then
				if not Lv then
					Lv = v.Level
				end
				if v.Level > Lv then
					Lv = v.Level
					Mob = v.Mob
				end
			end
		end
    end
    if game:GetService("Workspace").AntiTPNPC:FindFirstChild("QuestLvl"..Lv) then
        CFrameQuest = game:GetService("Workspace").AntiTPNPC:FindFirstChild("QuestLvl"..Lv).HumanoidRootPart.CFrame
    elseif game:GetService("ReplicatedStorage").MAP:FindFirstChild("QuestLvl"..Lv) then
        CFrameQuest = game:GetService("ReplicatedStorage").MAP:FindFirstChild("QuestLvl"..Lv).HumanoidRootPart.CFrame
    end
	return {["NPC/Quest"] = "QuestLvl"..Lv, ["Mob"] = Mob, ["CFrameQuest"] = CFrameQuest}
end

table.foreach(CheckLevel(), print)
-- Example
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CheckLevel()["CFrameQuest"]
