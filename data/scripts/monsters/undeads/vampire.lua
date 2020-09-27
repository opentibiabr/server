local mType = Game.createMonsterType("Vampire")
local monster = {}

monster.description = "a vampire"
monster.experience = 305
monster.outfit = {
	lookType = 68,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 475
monster.maxHealth = 475
monster.race = "blood"
monster.corpse = 6006
monster.speed = 238
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 70,
	health = 30,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	isConvinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 30,
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
	{text = "BLOOD!", yell = true},
	{text = "Let me kiss your neck", yell = false},
	{text = "I smell warm blood!", yell = false},
	{text = "I call you, my bats! Come!", yell = false}
}

monster.loot = {
	{id = "emerald bangle", chance = 230},
	{id = "black pearl", chance = 1800},
	{id = "gold coin", chance = 90230, maxCount = 60},
	{id = "bronze amulet", chance = 220},
	{id = 2229, chance = 1000},
	{id = "spike sword", chance = 1000},
	{id = "ice rapier", chance = 420},
	{id = "katana", chance = 1560},
	{id = "strange helmet", chance = 420},
	{id = "vampire shield", chance = 230},
	{id = "grave flower", chance = 1910},
	{id = "strong health potion", chance = 1500},
	{id = "vampire teeth", chance = 7600},
	{id = "blood preservation", chance = 5100}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -150, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 20, minDamage = -50, maxDamage = -200, type = COMBAT_LIFEDRAIN, range = 1, effect = CONST_ME_SMALLCLOUDS, target = true},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = -400, Duration = 60000}
}

monster.defenses = {
	defense = 30,
	armor = 30,
	{name ="outfit", interval = 4000, chance = 10},
	{name ="speed", interval = 2000, chance = 15, SpeedChange = 300, Duration = 3000},
	{name ="combat", interval = 2000, chance = 15, minDamage = 15, maxDamage = 25, type = COMBAT_HEALING, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 35},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -25},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
