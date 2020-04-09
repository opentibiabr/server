local doorId = {}
local keyDoorLocked = {}
local keyDoorUnlocked = {}

for index, value in ipairs(keyLockedDoor) do
	if not table.contains(doorId, value.closedDoor) then
		table.insert(doorId, value.closedDoor)
	end
	if not table.contains(doorId, value.lockedDoor) then
		table.insert(doorId, value.lockedDoor)
	end
	if not table.contains(doorId, value.openDoor) then
		table.insert(doorId, value.openDoor)
	end
	if not table.contains(keyDoorLocked, value.lockedDoor) then
		table.insert(keyDoorLocked, value.lockedDoor)
	end
	if not table.contains(keyDoorUnlocked, value.closedDoor) then
		table.insert(keyDoorUnlocked, value.closedDoor)
	end
end

for index, value in pairs(keysID) do
	if not table.contains(doorId, value) then
		table.insert(doorId, value)
	end
end

local door = Action()

function door.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	local doorCreature = Tile(toPosition):getTopCreature()
	if doorCreature then
		toPosition.x = toPosition.x + 1
		local query = Tile(toPosition):queryAdd(doorCreature, bit.bor(FLAG_IGNOREBLOCKCREATURE, FLAG_PATHFINDING))
		if query ~= RETURNVALUE_NOERROR then
			toPosition.x = toPosition.x - 1
			toPosition.y = toPosition.y + 1
			query = Tile(toPosition):queryAdd(doorCreature, bit.bor(FLAG_IGNOREBLOCKCREATURE, FLAG_PATHFINDING))
		end
		if query ~= RETURNVALUE_NOERROR then
			toPosition.y = toPosition.y - 2
			query = Tile(toPosition):queryAdd(doorCreature, bit.bor(FLAG_IGNOREBLOCKCREATURE, FLAG_PATHFINDING))
		end
		if query ~= RETURNVALUE_NOERROR then
			toPosition.x = toPosition.x - 1
			toPosition.y = toPosition.y + 1
			query = Tile(toPosition):queryAdd(doorCreature, bit.bor(FLAG_IGNOREBLOCKCREATURE, FLAG_PATHFINDING))
		end
		if query ~= RETURNVALUE_NOERROR then
			player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
			return true
		end
		doorCreature:teleportTo(toPosition, true)
	end

	-- It is locked msg
	if table.contains(keyDoorLocked, item.itemid) then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "It is locked.")
		return true
	elseif table.contains(keyDoorUnlocked, item.itemid) and item.actionid == 1001 or item.actionid == 101 then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "It is locked.")
		return true
	end

	-- onUse unlocked door
	for index, value in ipairs(keyLockedDoor) do
		if value.closedDoor == item.itemid then
			item:transform(value.openDoor)
			return true
		end
	end
	for index, value in ipairs(keyLockedDoor) do
		if value.openDoor == item.itemid then
			item:transform(value.closedDoor)
			return true
		end
	end

	-- Key use on door (locked door)
	if target.actionid > 0 then
		for index, value in ipairs(keyLockedDoor) do
			if item.actionid ~= target.actionid and value.lockedDoor == target.itemid then
				player:sendCancelMessage("The key does not match.")
				return true
			end
			if item.actionid == target.actionid and value.lockedDoor == target.itemid then
				target:transform(value.openDoor)
				return true
			elseif item.actionid == target.actionid and value.openDoor == target.itemid then
				target:transform(value.lockedDoor)
				return true
			elseif item.actionid == target.actionid and value.closedDoor == target.itemid then
				target:transform(value.lockedDoor)
				return true
			end
		end
	else
		player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
	end
	return true
end

for key, value in pairs(doorId) do
	door:id(value)
end

door:register()
