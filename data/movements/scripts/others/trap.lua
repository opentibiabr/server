local traps = {
    [2145] = {transformTo = 2146, damage = {-50, -100}},
    [2148] = {damage = {-50, -100}},
    [3482] = {transformTo = 3481, damage = {-15, -30}, ignorePlayer = (Game.getWorldType() == WORLD_TYPE_NO_PVP) },
    [3944] = {transformTo = 3945, damage = {-15, -30}, type = COMBAT_EARTHDAMAGE}
}

function onStepIn(creature, item, position, fromPosition)
    local trap = traps[item.itemid]
    if not trap then
        return true
    end

    if Tile(position):hasFlag(TILESTATE_PROTECTIONZONE) then
        return true
    end

    if Tile(position):getItemCountById(3482) > 1 then
        return true
    end

    if trap.ignorePlayer and creature:isPlayer() then
        return true
    end

    if trap.transformTo then
        item:transform(trap.transformTo)
    end

    doTargetCombatHealth(0, creature, trap.type or COMBAT_PHYSICALDAMAGE, trap.damage[1], trap.damage[2], CONST_ME_NONE)
    return true
end

function onStepOut(creature, item, position, fromPosition)
    if Tile(position):hasFlag(TILESTATE_PROTECTIONZONE) then
        return true
    end

    item:transform(item.itemid - 1)
    return true
end

function onRemoveItem(item, tile, position)
    local itemPosition = item:getPosition()
    if itemPosition:getDistance(position) > 0 then
        item:transform(item.itemid - 1)
        itemPosition:sendMagicEffect(CONST_ME_POFF)
    end
    return true
end
