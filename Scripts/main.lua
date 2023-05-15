local iguana_acs_fix = GameMain:GetMod("iguana_acs_fix")
local events = GameMain:GetMod("_Event");

function functorAddSubmodInitializer(event)
    return function ()
        if iguana_acs_fix.submods == nil then
            iguana_acs_fix.submods = {}
        end
        if iguana_acs_fix.submods[event] == nil then
            iguana_acs_fix.submods[event] = {}
        end
        for title, submodFunc in pairs( iguana_acs_fix.submods[event]) do
            print("iguana_acs_fix:"..event..": calling submod func "..title)
            submodFunc()
        end
    end
end

iguana_acs_fix.OnInit = functorAddSubmodInitializer("OnInit")
iguana_acs_fix.OnLoad = functorAddSubmodInitializer("OnLoad")
