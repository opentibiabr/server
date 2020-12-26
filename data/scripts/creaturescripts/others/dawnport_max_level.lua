local dawnportMaxLevel = CreatureEvent("DawnportMaxLevel")

function dawnportMaxLevel.onAdvance(player, skill, oldLevel, newLevel)
	local town = player:getTown()
	--Dawnport limits
	if town and town:getId() == TOWNS_LIST.DAWNPORT then
		-- Level limit
		if skill == SKILL_LEVEL and newLevel == DawnportCharacterLimits.level then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have reached the limit level and have to choose your vocation and leave Dawnport.")
			-- Adds the event that teleports the player to the temple in five minutes after reaching level 20
			addEvent(teleportToDawnportTemple, 5 * 60 * 1000, player:getId())
		-- Skills limit
		elseif skill ~= SKILL_LEVEL then
			-- Notify player reached skill limit
			if isSkillGrowthLimited(player, skill) then
				if skill == SKILL_MAGLEVEL then
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You cannot train your magic level any further. If you want to improve it further, you must go to the mainland.")
				else
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You cannot train your skill level any further. If you want to improve it further, you must go to the mainland.")
				end
			end
		end
	end
	
	return true
end

dawnportMaxLevel:register()
