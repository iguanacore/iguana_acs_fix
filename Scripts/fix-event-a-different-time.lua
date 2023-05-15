local iguana_acs_fix = GameMain:GetMod("iguana_acs_fix")

function fixEventADifferentTime()
    local eventData41 = GameEventMgr:GetEventData(41)
    eventData41.sParam1 = "34|35"
    eventData41.fParam2 = 6 * 600
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
iguana_acs_fix.submods["OnInit"]["fix event 'a different time'"] = fixEventADifferentTime
iguana_acs_fix.submods["OnLoad"]["fix event 'a different time'"] = fixEventADifferentTime