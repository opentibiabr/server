local mType = Game.createMonsterType("Redeemed Soul")
local monster = {}

monster.description = "a redeemed soul"
monster.experience = 0
monster.outfit = {
	lookType = 714,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 250
monster.maxHealth = 250
monster.race = "undead"
monster.corpse = 24634
monster.speed = 162
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 60000,
	chance = 0
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	isConvinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 250,
	healthHidden = false,
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
	{text = "Ting-a-ling.", yell = false},
	{text = "Free ... finally.", yell = false}
}

monster.loot = {
}

monster.attacks = {
}

monster.defenses = {
	defense = 15,
	armor = 10,
	{name ="speed", interval = 2000, chance = 8, SpeedChange = 240, Duration = 20000},
	{name ="combat", interval = 2000, chance = 25, minDamage = 200, maxDamage = 250, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="invisible", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_BLUE}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 65},
	{type = COMBAT_ENERGYDAMAGE, percent = 30},
	{type = COMBAT_EARTHDAMAGE, percent = 90},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = false},
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
