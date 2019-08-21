local destination = {
	[64010] = Position(33327, 31351, 7),
	[64011] = Position(33201, 31765, 1),
	[64012] = Position(33327, 31351, 7)
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local teleport = destination[item.actionid]
	if teleport then
		player:teleportTo(teleport)
		fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
		teleport:sendMagicEffect(CONST_ME_TELEPORT)
	end

	return true
end
