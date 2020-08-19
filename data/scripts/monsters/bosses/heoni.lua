local mType = Game.createMonsterType("Heoni")
local monster = {}

monster.description = "Heoni"
monster.experience = 515
monster.outfit = {
	lookType = 239,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 900
monster.maxHealth = 900
monster.race = "blood"
monster.corpse = 12546
monster.speed = 300
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 10
}

monster.flags = {
	isSummonable = false,
	isAttackable = true,
	isHostile = true,
	isConvinceable = false,
	isPushable = false,
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetdistance = 1,
	runHealth = 300,
	isHealthHidden = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Shriiiek", yell = false}
}

monster.loot = {
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, skill = 50, attack = 40, effect = CONST_ME_DRAWBLOOD, condition = {type = CONDITION_POISON, startDamage = 480, interval = 4000}},
	-- poison
	{name ="combat", type = COMBAT_EARTHDAMAGE, interval = 2000, chance = 15, minDamage = -20, maxDamage = -240, length = 8, spread = 3, effect = CONST_ME_POISONAREA, target = false},
	{name ="drunk", interval = 2000, chance = 13, length = 8, spread = 3, effect = CONST_ME_SOUND_WHITE, target = false}
}

monster.defenses = {
	defense = 18,
	armor = 25,
	{name ="combat", interval = 2000, chance = 11, minDamage = 76, maxDamage = 84, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 10, SpeedChange = 290, Duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType.onThink = function(monster, interval)
end

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType.onDisappear = function(monster, creature)
end

mType.onMove = function(monster, creature, fromPosition, toPosition)
end

mType.onSay = function(monster, creature, type, message)
end

mType:register(monster)
