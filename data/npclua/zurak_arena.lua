local npcType = Game.createNpcType("Zurak")
local npcConfig = {}

npcConfig.description = "Zurak (Arena)"

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 0
npcConfig.walkRadius = 0

npcConfig.outfit = {
    lookType = 114
}

npcConfig.flags = {
    floorchange = false
}

npcType.onThink = function(npc, interval)
end

npcType.onAppear = function(npc, creature)
end

npcType.onDisappear = function(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
    return npc:processOnSay(
        message,
        creature:getPlayer(),
        {
            NpcInteraction:createTravelInteraction({
                ["keywords"] = {"trip", "passage", "back"},
                ["position"] = Position(33158, 31228, 7),
                ["topic"] = 1,
                ["message"] = "You want to go back?",
                ["acceptedMessage"] = "It'zz your doom you travel to.",
                ["declinedMessage"] = "Zzoftzzkinzz zzo full of fear."
            }),
            NpcInteraction:new({"job", "hurry"}, "Me zzimple ferryman. I arrange {trip} to Zao."),
        }
    )
end

npcType:register(npcConfig)
