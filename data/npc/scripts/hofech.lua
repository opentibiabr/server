local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)
    npcHandler:onCreatureAppear(cid)
end
function onCreatureDisappear(cid)
    npcHandler:onCreatureDisappear(cid)
end
function onCreatureSay(cid, type, msg)
    npcHandler:onCreatureSay(cid, type, msg)
end
function onThink()
    npcHandler:onThink()
end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'amphora'}, 2023, 4, 'amphora')
shopModule:addBuyableItem({'armor rack kit'}, 6114, 90, 'armor rack kit')
shopModule:addBuyableItem({'barrel kit'}, 3919, 12, 'barrel kit')
shopModule:addBuyableItem({'big table kit'}, 3911, 30, 'big table kit')
shopModule:addBuyableItem({'birdcage kit'}, 3922, 50, 'birdcage kit')
shopModule:addBuyableItem({'blue bed kit'}, 7907, 80, 'blue bed kit')
shopModule:addBuyableItem({'blue pillow'}, 1686, 25, 'blue pillow')
shopModule:addBuyableItem({'blue tapestry'}, 1872, 25, 'blue tapestry')
shopModule:addBuyableItem({'bookcase kit'}, 6373, 70, 'bookcase kit')
shopModule:addBuyableItem({'box'}, 1738, 10, 'box')
shopModule:addBuyableItem({'chest'}, 1740, 10, 'chest')
shopModule:addBuyableItem({'chimney kit'}, 8692, 200, 'chimney kit')
shopModule:addBuyableItem({'coal basin kit'}, 3932, 25, 'coal basin kit')
shopModule:addBuyableItem({'crate'}, 1739, 10, 'crate')
shopModule:addBuyableItem({'cuckoo clock'}, 1877, 40, 'cuckoo clock')
shopModule:addBuyableItem({'drawer kit'}, 3915, 18, 'drawer kit')
shopModule:addBuyableItem({'dresser kit'}, 3916, 25, 'dresser kit')
shopModule:addBuyableItem({'flower bowl'}, 2102, 6, 'flower bowl')
shopModule:addBuyableItem({'globe kit'}, 3926, 50, 'globe kit')
shopModule:addBuyableItem({'goblin statue kit'}, 3930, 50, 'goblin statue kit')
shopModule:addBuyableItem({'god flowers'}, 2100, 5, 'god flowers')
shopModule:addBuyableItem({'goldfish bowl'}, 5928, 50, 'goldfish bowl')
shopModule:addBuyableItem({'green bed kit'}, 7904, 80, 'green bed kit')
shopModule:addBuyableItem({'green cushioned chair kit'}, 3902, 40, 'green cushioned chair kit')
shopModule:addBuyableItem({'green pillow'}, 1688, 25, 'green pillow')
shopModule:addBuyableItem({'green tapestry'}, 1860, 25, 'green tapestry')
shopModule:addBuyableItem({'harp kit'}, 3934, 50, 'harp kit')
shopModule:addBuyableItem({'heart pillow'}, 1685, 30, 'heart pillow')
shopModule:addBuyableItem({'honey flower'}, 2103, 5, 'honey flower')
shopModule:addBuyableItem({'indoor plant kit'}, 3937, 8, 'indoor plant kit')
shopModule:addBuyableItem({'knight statue kit'}, 3928, 50, 'knight statue kit')
shopModule:addBuyableItem({'large amphora kit'}, 3931, 50, 'large amphora kit')
shopModule:addBuyableItem({'locker kit'}, 3917, 30, 'locker kit')
shopModule:addBuyableItem({'minotaur statue kit'}, 3929, 50, 'minotaur statue kit')
shopModule:addBuyableItem({'orange tapestry'}, 1866, 25, 'orange tapestry')
shopModule:addBuyableItem({'oven kit'}, 6372, 80, 'oven kit')
shopModule:addBuyableItem({'pendulum clock kit'}, 3927, 75, 'pendulum clock kit')
shopModule:addBuyableItem({'piano kit'}, 3933, 200, 'piano kit')
shopModule:addBuyableItem({'picture'}, 1852, 50, 'picture')
shopModule:addBuyableItem({'picture'}, 1854, 50, 'picture')
shopModule:addBuyableItem({'picture'}, 1853, 50, 'picture')
shopModule:addBuyableItem({'potted flower'}, 2104, 5, 'potted flower')
shopModule:addBuyableItem({'purple tapestry'}, 1857, 25, 'purple tapestry')
shopModule:addBuyableItem({'red bed kit'}, 7906, 80, 'red bed kit')
shopModule:addBuyableItem({'red cushioned chair kit'}, 3901, 40, 'red cushioned chair kit')
shopModule:addBuyableItem({'red pillow'}, 1687, 25, 'red pillow')
shopModule:addBuyableItem({'red tapestry'}, 1869, 25, 'red tapestry')
shopModule:addBuyableItem({'rocking chair kit'}, 3904, 25, 'rocking chair kit')
shopModule:addBuyableItem({'rocking horse kit'}, 3926, 30, 'rocking horse kit')
shopModule:addBuyableItem({'round blue pillow'}, 1690, 25, 'round blue pillow')
shopModule:addBuyableItem({'round purple pillow'}, 1692, 25, 'round purple pillow')
shopModule:addBuyableItem({'round red pillow'}, 1691, 25, 'round red pillow')
shopModule:addBuyableItem({'round table kit'}, 14328, 25, 'round table kit')
shopModule:addBuyableItem({'round turquoise pillow'}, 1693, 25, 'round turquoise pillow')
shopModule:addBuyableItem({'small blue pillow'}, 1681, 20, 'small blue pillow')
shopModule:addBuyableItem({'small green pillow'}, 1679, 20, 'small green pillow')
shopModule:addBuyableItem({'small orange pillow'}, 1682, 20, 'small orange pillow')
shopModule:addBuyableItem({'small purple pillow'}, 1678, 20, 'small purple pillow')
shopModule:addBuyableItem({'small red pillow'}, 1680, 20, 'small red pillow')
shopModule:addBuyableItem({'small table kit'}, 3908, 20, 'small table kit')
shopModule:addBuyableItem({'small turquoise pillow'}, 1683, 20, 'small turquoise pillow')
shopModule:addBuyableItem({'small white pillow'}, 1684, 20, 'small white pillow')
shopModule:addBuyableItem({'sofa chair kit'}, 3905, 55, 'sofa chair kit')
shopModule:addBuyableItem({'square table kit'}, 14329, 25, 'square table kit')
shopModule:addBuyableItem({'table lamp kit'}, 3924, 35, 'table lamp kit')
shopModule:addBuyableItem({'telescope kit'}, 3925, 70, 'telescope kit')
shopModule:addBuyableItem({'treasure chest'}, 1746, 1000, 'treasure chest')
shopModule:addBuyableItem({'trophy stand'}, 7936, 50, 'trophy stand')
shopModule:addBuyableItem({'trough kit'}, 3918, 7, 'trough kit')
shopModule:addBuyableItem({'trunk kit'}, 3920, 10, 'trunk kit')
shopModule:addBuyableItem({'vase'}, 2008, 3, 'vase')
shopModule:addBuyableItem({'venorean cabinet kit'}, 20254, 90, 'venorean cabinet kit')
shopModule:addBuyableItem({'venorean drawer kit'}, 20257, 40, 'venorean drawer kit')
shopModule:addBuyableItem({'venorean wardrobe kit'}, 20255, 50, 'venorean wardrobe kit')
shopModule:addBuyableItem({'wall mirror'}, 1851, 40, 'wall mirror')
shopModule:addBuyableItem({'wall mirror'}, 1848, 40, 'wall mirror')
shopModule:addBuyableItem({'wall mirror'}, 1845, 40, 'wall mirror')
shopModule:addBuyableItem({'water pipe'}, 2099, 40, 'water pipe')
shopModule:addBuyableItem({'weapon rack kit'}, 6115, 90, 'weapon rack kit')
shopModule:addBuyableItem({'white tapestry'}, 1880, 25, 'white tapestry')
shopModule:addBuyableItem({'wooden chair kit'}, 3903, 15, 'wooden chair kit')
shopModule:addBuyableItem({'yellow bed kit'}, 7905, 80, 'yellow bed kit')
shopModule:addBuyableItem({'yellow pillow'}, 1689, 25, 'yellow pillow')
shopModule:addBuyableItem({'yellow tapestry'}, 1863, 25, 'yellow tapestry')

npcHandler:addModule(FocusModule:new())
