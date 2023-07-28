local iguana_acs_fix = GameMain:GetMod("iguana_acs_fix")

function CorrectRockYield()
    local plantList = ThingMgr:GetThingList(g_emThingType.Plant)
    if (plantList == nil) then
        return
    end
    for i=0,plantList.Count-1 do
        local plant = plantList[i]
        if plant.IsValid and (plant.def.Plant == null or plant.def.GrowAble <= 0) then
            plant:OnInit(plant.def)
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
iguana_acs_fix.submods["OnInit"]["Correct Rock Yield"] = CorrectRockYield
iguana_acs_fix.submods["OnLoad"]["Correct Rock Yield"] = CorrectRockYield