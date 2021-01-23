local rookVillage = MoveEvent()

function rookVillage.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	player:teleportTo(Position(player:getPosition().x, player:getPosition().y-1, player:getPosition().z))
	player:sendTextMessage(MESSAGE_INFO_DESCR, "You don't have any business there anymore.")
	return true

end

rookVillage:type("stepin")
rookVillage:id(8716)
rookVillage:register()
