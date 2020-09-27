local mType = Game.createMonsterType("Rupture")
local monster = {}

monster.description = "Rupture"
monster.experience = 112000
monster.outfit = {
	lookType = 875,
	lookHead = 77,
	lookBody = 98,
	lookLegs = 3,
	lookFeet = 85,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 290000
monster.maxHealth = 290000
monster.race = "venom"
monster.corpse = 26220
monster.speed = 450
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 25
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

monster.events = {
	"RuptureResonance",
	"RuptureHeal",
	"HeartBossDeath"
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
	{id = 2148, chance = 100000, maxCount = 200},
	{id = 2152, chance = 100000, maxCount = 10},
	{id = 8473, chance = 8000, maxCount = 5},
	{id = 18413, chance = 8000, maxCount = 3},
	{id = 18415, chance = 8000, maxCount = 3},
	{id = 2150, chance = 8000, maxCount = 10},
	{id = 2146, chance = 8000, maxCount = 5},
	{id = 18414, chance = 8000, maxCount = 3},
	{id = 26191, chance = 8000, maxCount = 5},
	{id = 26162, chance = 8000},
	{id = 26166, chance = 100000},
	{id = 25377, chance = 100000},
	{id = 26165, chance = 100000},
	{id = 2155, chance = 6000},
	{id = 7427, chance = 6000},
	{id = 26187, chance = 4000},
	{id = 26189, chance = 4000},
	{id = 26130, chance = 2000},
	{id = 26133, chance = 2000}
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = -250, maxDamage = -1000, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 25, minDamage = -350, maxDamage = -800, type = COMBAT_ENERGY, length = 10, spread = 3, effect = CONST_ME_LOSEENERGY, target = false},
	{name ="combat", interval = 2000, chance = 25, minDamage = -150, maxDamage = -300, type = COMBAT_DEATH, ShootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_SMALLCLOUDS, target = true},
	{name ="combat", interval = 2000, chance = 20, minDamage = -700, maxDamage = -1100, target = false},
	{name ="combat", interval = 2000, chance = 25, minDamage = -300, maxDamage = -600, type = COMBAT_LIFEDRAIN, length = 9, spread = 3, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="combat", interval = 2000, chance = 40, target = false}
}

monster.defenses = {
	defense = 100,
	armor = 100,
	{name ="combat", interval = 2000, chance = 15, minDamage = 150, maxDamage = 400, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = -10},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
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
