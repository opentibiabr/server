local mType = Game.createMonsterType("Overcharge")
local monster = {}

monster.description = "an overcharge"
monster.experience = 0
monster.outfit = {
	lookType = 290,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 8000
monster.maxHealth = 8000
monster.race = "venom"
monster.corpse = 0
monster.speed = 360
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 15
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
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.events = {"OverchargeDeath"}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = -100, maxDamage = -500, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 15, minDamage = -200, maxDamage = -500, type = COMBAT_PHYSICAL, ShootEffect = CONST_ANI_ENERGYBALL, effect = CONST_ME_LOSEENERGY, target = true},
	{name ="combat", interval = 2000, chance = 20, minDamage = -200, maxDamage = -400, type = COMBAT_PHYSICAL, effect = CONST_ME_POFF, target = false},
	{name ="combat", interval = 2000, chance = 20, minDamage = -300, maxDamage = -670, type = COMBAT_PHYSICAL, length = 9, spread = 3, effect = CONST_ME_TELEPORT, target = false}
}

monster.defenses = {
	defense = 80,
	armor = 80
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
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
