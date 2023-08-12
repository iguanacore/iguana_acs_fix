local iguana_acs_fix = GameMain:GetMod("iguana_acs_fix")

function CorrectCagedAnimalsPerception()
    xlua.private_accessible(CS.XiaWorld.TradeMgr)
    for itemPoolID, itemPool in pairs(TradeMgr.m_dicGoodPool) do
        for _, tradeItem in pairs(itemPool.Items) do
            if tradeItem.Animal then
                tradeItem.Animal.fivebase = ""
            end
        end
    end
end

if iguana_acs_fix.submods == nil then
    iguana_acs_fix.submods = {}
end
if iguana_acs_fix.submods["OnInit"] == nil then
    iguana_acs_fix.submods["OnInit"] = {}
end
if iguana_acs_fix.submods["OnLoad"] == nil then
    iguana_acs_fix.submods["OnLoad"] = {}
end
iguana_acs_fix.submods["OnInit"]["Correct Caged Animals Perception"] = CorrectCagedAnimalsPerception
iguana_acs_fix.submods["OnLoad"]["Correct Caged Animals Perception"] = CorrectCagedAnimalsPerception