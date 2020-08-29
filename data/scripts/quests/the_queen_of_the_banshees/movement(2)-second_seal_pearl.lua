local setting = {
	{position = {x = 32173, y = 31871, z = 15}, pearlId = 2143},
	{position = {x = 32180, y = 31871, z = 15}, pearlId = 2144}
}

local secondSealPearl = MoveEvent()

function secondSealPearl.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getStorageValue(Storage.Quest.TheQueenOfTheBanshees.SecondSeal) >= 1 then
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end

	local pearlItems = {}
	for i = 1, #setting do
		local pearlItem = Tile(setting[i].position):getItemById(setting[i].pearlId)
		if not pearlItem then
			player:teleportTo(fromPosition, true)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			return true
		end

		pearlItems[#pearlItems + 1] = pearlItem
	end

	for i = 1, #pearlItems do
		pearlItems[i]:remove(1)
	end

	player:teleportTo(Position(position.x, position.y - 6, position.z))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

secondSealPearl:type("stepin")
secondSealPearl:aid(35002)
secondSealPearl:register()
