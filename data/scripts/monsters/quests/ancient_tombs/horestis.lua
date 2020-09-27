local mType = Game.createMonsterType("Horestis")
local monster = {}

monster.description = "Horestis"
monster.experience = 3500
monster.outfit = {
	lookType = 88,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 6000
monster.maxHealth = 6000
monster.race = "undead"
monster.corpse = 6031
monster.speed = 340
monster.summonCost = 0
monster.maxSummons = 2

monster.changeTarget = {
	interval = 5000,
	chance = 8
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

monster.summons = {
	{name = "Sandstone Scorpion", chance = 12, interval = 1000}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "I might be dead but I'm not gone!", yell = false}
}

monster.loot = {
	{id = 13498, chance = 100000},
	{id = 2148, chance = 95000, maxCount = 243},
	{id = 2152, chance = 36000, maxCount = 5},
	{id = 13472, chance = 17000},
	{id = 2159, chance = 14000, maxCount = 5},
	{id = 13739, chance = 12000},
	{id = 2134, chance = 12000},
	{id = 7590, chance = 10000, maxCount = 3},
	{id = 7591, chance = 5000, maxCount = 4},
	{id = 2446, chance = 5000},
	{id = 11207, chance = 2500},
	{id = 9811, chance = 2500},
	{id = 2447, chance = 2500}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -450, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 1000, chance = 12, minDamage = -200, maxDamage = -750, type = COMBAT_DEATH, range = 7, ShootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 3000, chance = 17, minDamage = -400, maxDamage = -500, type = COMBAT_LIFEDRAIN, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="drunk", interval = 3000, chance = 11, effect = CONST_ME_POISONAREA, target = false},
	{name ="speed", interval = 1000, chance = 25, SpeedChange = -350, Duration = 30000},
	-- poison
	{name ="combat", type = COMBAT_EARTHDAMAGE, interval = 2000, chance = 30, minDamage = -35, maxDamage = -35, target = false}
}

monster.defenses = {
	defense = 30,
	armor = 25,
	{name ="combat", interval = 2000, chance = 15, minDamage = 200, maxDamage = 400, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -5},
	{type = COMBAT_ENERGYDAMAGE, percent = 5},
	{type = COMBAT_EARTHDAMAGE, percent = 50},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
