local iguana_acs_fix = GameMain:GetMod("iguana_acs_fix")

function fixState3Equilibrium()
    xlua.private_accessible(CS.Panel_ThingInfo)
    CS.Panel_ThingInfo.FoodF2[3] = 0
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
iguana_acs_fix.submods["OnInit"]["fix state 3 equilibrium"] = fixState3Equilibrium
iguana_acs_fix.submods["OnLoad"]["fix state 3 equilibrium"] = fixState3Equilibrium