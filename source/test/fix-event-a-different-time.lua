-- This is a test scenario for fix/event-a-different-time
--
-- It is meant to be used by entering code in the in-game console
--

--preliminary code to run
local g = GameMain:GetMod("TestMod")

g.testcase = function (title, firstValue, secondValue, verbose)
    if verbose == nil then
        verbose = false
    end
    local result = firstValue == secondValue
    local text = tostring(result).." "..title
    if verbose then
        text = text.." | "..tostring(firstValue).." | "..tostring(secondValue)
    end
    print(text)
    return result
end

-- to be used first
function test_triggerEvent41_pre()
    local g = GameMain:GetMod("TestMod")
    xlua.private_accessible(CS.XiaWorld.GameEventMgr)
    g.numWeightModifiers = GameEventMgr.Data.WeightModifiers.Count
    g.curTime= World.TolSecond
    g.hasEvent34WeightModifiers = GameEventMgr.WeightAddtion:ContainsKey(34)
    g.hasEvent35WeightModifiers = GameEventMgr.WeightAddtion:ContainsKey(35)
    g.curEvent34WeightMod = 0
    g.curEvent35WeightMod = 0
    if g.hasEvent34WeightModifiers then
        g.curEvent34WeightMod =  GameEventMgr.WeightAddtion[34]
    end
    if g.hasEvent35WeightModifiers then
        g.curEvent35WeightMod =  GameEventMgr.WeightAddtion[35]
    end
    GameEventMgr:TriggerEvent(41)
end
test_triggerEvent41_pre()


--launch to test
function test_triggerEvent41()
    local g = GameMain:GetMod("TestMod")
    local curTime = World.TolSecond
    if(g.testcase("1 new Weight modifier", GameEventMgr.Data.WeightModifiers.Count, g.numWeightModifiers + 1)) then
        local newWeightModifier = GameEventMgr.Data.WeightModifiers[g.numWeightModifiers]
        g.testcase("new weight modifier concerns event 34", newWeightModifier.IDs[0],34)
        g.testcase("new weight modifier concerns event 35", newWeightModifier.IDs[1],35)
        g.testcase("1000 added weight", newWeightModifier.Value,1000)
        g.testcase("ends in about 6 days", math.abs(newWeightModifier.EndTime - g.curTime - 3600) <= 60, true)
        if (g.hasEvent34WeightModifiers) then
            g.testcase("34:the new weight modifiers are applied as Weight Additions", GameEventMgr.WeightAddtion[34],g.curEvent34WeightMod +1000)
        else
            g.testcase("34: the new weight modifiers are applied as Weight Additions", GameEventMgr.WeightAddtion:ContainsKey(34), true)
        end
        if (g.hasEvent35WeightModifiers) then
            g.testcase("35:the new weight modifiers are applied as Weight Additions", GameEventMgr.WeightAddtion[35],g.curEvent35WeightMod +1000)
        else
            g.testcase("35: the new weight modifiers are applied as Weight Additions", GameEventMgr.WeightAddtion:ContainsKey(35), true)
        end
    end
end
test_triggerEvent41()
