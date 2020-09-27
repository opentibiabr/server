local mType = Game.createMonsterType("Deathbringer")
local monster = {}

monster.description = "Deathbringer"
monster.experience = 5100
monster.outfit = {
	lookType = 231,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 8440
monster.maxHealth = 8440
monster.race = "undead"
monster.corpse = 7349
monster.speed = 300
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 0,
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
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 95,
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
	{text = "YOU FOOLS WILL PAY!", yell = true},
	{text = "YOU ALL WILL DIE!!", yell = true},
	{text = "DEATH, DESTRUCTION!", yell = true},
	{text = "I will eat your soul!", yell = false}
}

monster.loot = {
}

monster.attacks = {
	{name ="combat", interval = 2000, chance = 100, minDamage = 0, maxDamage = -465, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 1000, chance = 10, minDamage = -80, maxDamage = -120, type = COMBAT_FIRE, range = 7, ShootEffect = CONST_ANI_FIRE, effect = CONST_ME_DRAWBLOOD, target = true},
	{name ="combat", interval = 3000, chance = 17, minDamage = -300, maxDamage = -450, type = COMBAT_FIRE, length = 8, spread = 3, effect = CONST_ME_FIREAREA, target = false},
	{name ="combat", interval = 2000, chance = 12, minDamage = -300, maxDamage = -450, type = COMBAT_EARTH, length = 8, spread = 3, effect = CONST_ME_POISONAREA, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -80, maxDamage = -100, type = COMBAT_LIFEDRAIN, effect = CONST_ME_POFF, target = false},
	{name ="combat", interval = 3000, chance = 25, minDamage = -80, maxDamage = -150, type = COMBAT_LIFEDRAIN, range = 7, effect = CONST_ME_MAGIC_RED, target = false}
}

monster.defenses = {
	defense = 15,
	armor = 15
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = -15},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
