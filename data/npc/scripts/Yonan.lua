local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local playerTopic = {}
local function greetCallback(cid)

	local player = Player(cid)

	if player:getStorageValue(Storage.KilmareshQuest.Primeira.Acesso) < 1 then
		npcHandler:setMessage(MESSAGE_GREET, "Como eu poderia lhe ajudar?")
		playerTopic[cid] = 1
	elseif (player:getStorageValue(Storage.KilmareshQuest.Primeira.jamesfrancisTask) >= 0 and player:getStorageValue(Storage.KilmareshQuest.Primeira.jamesfrancisTask) <= 50)
	and player:getStorageValue(Storage.KilmareshQuest.Primeira.Mission) < 3 then
		npcHandler:setMessage(MESSAGE_GREET, "Como eu poderia lhe ajudar?")
		playerTopic[cid] = 15
	elseif player:getStorageValue(Storage.KilmareshQuest.Primeira.Mission) == 4 then
		npcHandler:setMessage(MESSAGE_GREET, {"Como eu poderia lhe ajudar?"})
		player:setStorageValue(Storage.KilmareshQuest.Primeira.Mission, 5)
		playerTopic[cid] = 20
	end
	npcHandler:addFocus(cid)
	return true
end


local voices = {
	{ text = 'Falas do Npc' }
}
npcHandler:addModule(VoiceModule:new(voices))


local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	npcHandler.topic[cid] = playerTopic[cid]
	local player = Player(cid)





-- MISSAO 3 ROUBAR ANEL DO EMBAIXADOR

if msgcontains(msg, "mission") and player:getStorageValue(Storage.KilmareshQuest.Oito.Yonan) == 1 then

	if player:getStorageValue(Storage.KilmareshQuest.Oito.Yonan) == 1 then
		npcHandler:say({"Voce poderia me ajudar a fazer um ritual?"}, cid)
		npcHandler.topic[cid] = 1
		playerTopic[cid] = 1
	end

	elseif msgcontains(msg, "yes") and playerTopic[cid] == 1 and player:getStorageValue(Storage.KilmareshQuest.Oito.Yonan) == 1 then
		if player:getStorageValue(Storage.KilmareshQuest.Oito.Yonan) == 1 then
			
			player:addItem(36552, 1) -- Yonans List
			player:addItem(36448, 1) -- Pick Enchanted
			npcHandler:say({"Aqui esta a lista com os ingredientes que faltam para completar o ritual."}, cid)
			player:setStorageValue(Storage.KilmareshQuest.Oito.Yonan, 2)
			npcHandler.topic[cid] = 2
			playerTopic[cid] = 2
		else
			npcHandler:say({"Sorry."}, cid)
		end
end



-- MISSAO 3 ROUBAR ANEL DO EMBAIXADOR

if msgcontains(msg, "mission") and player:getStorageValue(Storage.KilmareshQuest.Oito.Yonan) == 2 then

	if player:getStorageValue(Storage.KilmareshQuest.Oito.Yonan) == 2 then
		npcHandler:say({"Voce trouxe todos os materiais que lhe informei?"}, cid)
		npcHandler.topic[cid] = 3
		playerTopic[cid] = 3
	end
		
		
	elseif msgcontains(msg, "yes") and playerTopic[cid] == 3 and player:getStorageValue(Storage.KilmareshQuest.Oito.Yonan) == 2 then
		if player:getStorageValue(Storage.KilmareshQuest.Oito.Yonan) == 2 and player:getItemById(10568, 3) and player:getItemById(36160, 12) and player:getItemById(36168, 10) then
			player:removeItem(10568, 3)
			player:removeItem(36160, 12)
			player:removeItem(36168, 10)
			npcHandler:say({"Obrigado essa etapa do ritual esta completa."}, cid)
			player:setStorageValue(Storage.KilmareshQuest.Oito.Yonan, 3)
			npcHandler.topic[cid] = 4
			playerTopic[cid] = 4
		else
			npcHandler:say({"Sorry."}, cid)
		end
end






	
	
	return true
end



npcHandler:setMessage(MESSAGE_WALKAWAY, 'Well, bye then.')

npcHandler:setCallback(CALLBACK_ONADDFOCUS, onAddFocus)
npcHandler:setCallback(CALLBACK_ONRELEASEFOCUS, onReleaseFocus)

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
