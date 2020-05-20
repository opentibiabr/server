local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local condition = Condition(CONDITION_HASTE)
condition:setParameter(CONDITION_PARAM_SUBID, 3)
condition:setParameter(CONDITION_PARAM_TICKS, 5000)
condition:setFormula(0.9, -72, 0.9, -72)
combat:addCondition(condition)

function onCastSpell(creature, variant)
local summon = creature:getSummons()
	for i = 1, #summon do
		if summon[i]:getType():isPet() then
			local deltaSpeed = math.max(creature:getBaseSpeed() - summon[i]:getBaseSpeed(), 0)
			local PetSpeed = ((summon[i]:getBaseSpeed() + deltaSpeed) * 0.9) - 72
			local PetHaste = createConditionObject(CONDITION_HASTE)
			setConditionParam(PetHaste, CONDITION_PARAM_TICKS, 5000)
			setConditionParam(PetHaste, CONDITION_PARAM_SPEED, PetSpeed)
			summon[i]:addCondition(PetHaste)
		end
	end
	return combat:execute(creature, variant)
end
