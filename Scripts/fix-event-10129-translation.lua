local iguana_acs_fix = GameMain:GetMod("iguana_acs_fix")

function fixEvent10129()
    local eventData10129 = GameEventMgr:GetEventData(10129)
    eventData10129.Desc = "After much hardship, a Xiandao cultivator in your sect has survived nine Heavenly Tribulations, drawing in divine fortune to converge here, and thus your Mini Universe begins to emit strange, faint light."
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
iguana_acs_fix.submods["OnInit"]["fix event 10,129 translation"] = fixEvent10129
iguana_acs_fix.submods["OnLoad"]["fix event 10,129 translation"] = fixEvent10129