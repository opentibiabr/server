local mType = Game.createMonsterType("Rage Squid")
local monster = {}

monster.description = "a rage squid"
monster.experience = 14820
monster.outfit = {
	lookType = 1059,
	lookHead = 94,
	lookBody = 78,
	lookLegs = 78,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 17000
monster.maxHealth = 17000
monster.race = "undead"
monster.corpse = 32482
monster.speed = 430
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	isConvinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
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
}

monster.loot = {
	{id = 33317, chance = 10000},
	{id = "great spirit potion", chance = 10000, maxCount = 3},
	{id = "fire mushroom", chance = 10000, maxCount = 6},
	{id = "small amethyst", chance = 90000, maxCount = 5},
	{id = "slime heart", chance = 3000},
	{id = "piece of dead brain", chance = 4900},
	{id = "platinum coin", chance = 100000, maxCount = 6},
	{id = "ultimate health potion", chance = 10000, maxCount = 3},
	{id = "small topaz", chance = 90000, maxCount = 5},
	{id = "small emerald", chance = 90000, maxCount = 5},
	{id = "red gem", chance = 9800, maxCount = 5},
	{id = "orb", chance = 66000, maxCount = 5},
	{id = "purple tome", chance = 6333},
	{id = "great mana potion", chance = 10000, maxCount = 3},
	{id = "demonic essence", chance = 4300},
	{id = 33315, chance = 10000},
	{id = "small ruby", chance = 90000, maxCount = 5},
	{id = "talon", chance = 8990},
	{id = "might ring", chance = 4990},
	{id = "devil helmet", chance = 6990},
	{id = "demonrage sword", chance = 400},
	{id = 7393, chance = 390},
	{id = "giant sword", chance = 250},
	{id = "demon shield", chance = 250},
	{id = "magic plate armor", chance = 150},
	{id = "platinum amulet", chance = 350},
	{id = "wand of everblazing", chance = 300},
	{id = "fire axe", chance = 500}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -500, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 1000, chance = 15, minDamage = -200, maxDamage = -280, type = COMBAT_FIRE, range = 7, ShootEffect = CONST_ANI_FLAMMINGARROW, effect = CONST_ME_HITBYFIRE, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -200, maxDamage = -380, type = COMBAT_FIRE, range = 7, ShootEffect = CONST_ANI_FIRE, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -175, maxDamage = -200, type = COMBAT_LIFEDRAIN, length = 5, spread = 3, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="combat", interval = 2000, chance = 12, minDamage = -200, maxDamage = -475, type = COMBAT_FIRE, effect = CONST_ME_HITBYFIRE, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -200, maxDamage = -475, type = COMBAT_FIRE, effect = CONST_ME_FIREAREA, target = false}
}

monster.defenses = {
	defense = 78,
	armor = 78
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -15},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
