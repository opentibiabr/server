local mType = Game.createMonsterType("Grave Robber")
local monster = {}

monster.description = "a grave robber"
monster.experience = 65
monster.outfit = {
	lookType = 146,
	lookHead = 114,
	lookBody = 95,
	lookLegs = 76,
	lookFeet = 38,
	lookAddons = 3,
	lookMount = 0
}

monster.health = 165
monster.maxHealth = 165
monster.race = "blood"
monster.corpse = 20411
monster.speed = 190
monster.summonCost = 435
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = true,
	rewardBoss = false,
	illusionable = false,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 15,
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
}

monster.loot = {
	{id = "gold coin", chance = 54260, maxCount = 38},
	{id = "axe", chance = 2500},
	{id = "mace", chance = 1700},
	{id = "iron helmet", chance = 500},
	{id = "brass armor", chance = 1700},
	{id = "steel shield", chance = 500},
	{id = "nomad parchment", chance = 170},
	{id = "potato", chance = 5680, maxCount = 3},
	{id = "dirty turban", chance = 1700},
	{id = "rope belt", chance = 7510}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -90, effect = CONST_ME_DRAWBLOOD},
	-- poison
	{name ="combat", type = COMBAT_EARTHDAMAGE, interval = 2000, chance = 15, minDamage = -100, maxDamage = -160, range = 7, shootEffect = CONST_ANI_POISON, target = true}
}

monster.defenses = {
	defense = 15,
	armor = 15
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -10},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = -10}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = false},
	{type = "bleed", condition = false}
}

mType:register(monster)
