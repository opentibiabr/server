local mType = Game.createMonsterType("Zushuka")
local monster = {}

monster.description = "zushuka"
monster.experience = 9000
monster.outfit = {
	lookType = 149,
	lookHead = 86,
	lookBody = 12,
	lookLegs = 31,
	lookFeet = 60,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 15000
monster.maxHealth = 15000
monster.race = "blood"
monster.corpse = 20546
monster.speed = 220
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
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
	{text = "Cool down, will you?", yell = false},
	{text = "Freeze!", yell = false},
	{text = "Is this all you've got?", yell = false},
	{text = "Pay for your ignorance!", yell = false},
	{text = "And stay cool.", yell = false},
	{text = "Your cold dead body will be a marvelous ice statue.", yell = false}
}

monster.loot = {
	{id = 2148, chance = 92000, maxCount = 200},
	{id = 21400, chance = 92000},
	{id = 7290, chance = 57000},
	{id = 7449, chance = 42000},
	{id = 8472, chance = 42000, maxCount = 5},
	{id = 2396, chance = 42000},
	{id = 2168, chance = 42000},
	{id = 7443, chance = 35000},
	{id = 7892, chance = 35000},
	{id = 7440, chance = 35000},
	{id = 2152, chance = 35000},
	{id = 5909, chance = 35000, maxCount = 2},
	{id = 7439, chance = 28000},
	{id = 2158, chance = 28000},
	{id = 2663, chance = 28000},
	{id = 7888, chance = 21000},
	{id = 7590, chance = 21000, maxCount = 5},
	{id = 5912, chance = 14000},
	{id = 2445, chance = 14000},
	{id = 2201, chance = 14000},
	{id = 7896, chance = 14000},
	{id = 7897, chance = 14000},
	{id = 9971, chance = 14000},
	{id = 7591, chance = 14000, maxCount = 5},
	{id = 7459, chance = 14000},
	{id = 2436, chance = 14000},
	{id = 2195, chance = 7000},
	{id = 7902, chance = 7000},
	{id = 5911, chance = 7000},
	{id = 21699, chance = 7000},
	{id = 21700, chance = 3000},
	{id = 7410, chance = 3000}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -560, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 10, minDamage = 0, maxDamage = -100, type = COMBAT_ICE, length = 8, spread = 3, effect = CONST_ME_ICEATTACK, target = false},
	{name ="combat", interval = 2000, chance = 20, minDamage = 0, maxDamage = -110, type = COMBAT_ICE, range = 7, ShootEffect = CONST_ANI_SNOWBALL, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -300, maxDamage = -750, type = COMBAT_ICE, length = 8, spread = 3, effect = CONST_ME_ICEAREA, target = false},
	{name ="outfit", interval = 2000, chance = 10},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = -330, Duration = 20000}
}

monster.defenses = {
	defense = 20,
	armor = 20,
	{name ="combat", interval = 10000, chance = 1, minDamage = 7500, maxDamage = 7515, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="combat", interval = 3000, chance = 15, minDamage = 200, maxDamage = 500, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 40},
	{type = COMBAT_FIREDAMAGE, percent = 50},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 30},
	{type = COMBAT_DEATHDAMAGE , percent = -10}
}

monster.immunities = {
	{type = "paralyze", condition = true},
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
