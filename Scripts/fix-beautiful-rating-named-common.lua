function fixBeautifulRatingName()
    GameDefine.BeautyValueDesc[3] = XT("精美")
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
iguana_acs_fix.submods["OnInit"]["fix Beautiful rating named Common"] = fixBeautifulRatingName
iguana_acs_fix.submods["OnLoad"]["fix Beautiful rating named Common"] = fixBeautifulRatingName