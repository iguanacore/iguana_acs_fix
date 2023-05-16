local iguana_acs_fix = GameMain:GetMod("iguana_acs_fix")

function correctedAddTreasure(self, tProduct, region, WorldLua, solve)
    local tbTable = GameMain:GetMod("MapStoryHelper")
	local unionData = region.UnionData;
	local tMembers = unionData.members;
	local countOfMember = 10;
	local enumSolve = CS.XiaWorld.OutspreadMgr.Region.SolveWay;
	if tMembers then
		countOfMember = countOfMember + tMembers.Count;
	end
	t = {
		["Item_IronRock"] = {self:Rand(50), tbTable:SPP(unionData.Mining), 0, tbTable:MPL(0), enumSolve.Member, XT("啥都没有拿到。"), XT("代理人让弟子一起努力")},
		["Item_StoneEssence"] = {self:Rand(50), tbTable:SPP(unionData.Mining), 0, tbTable:MPL(1), enumSolve.Fight, XT("代理人和弟子并没有那么高的体力，啥都没找到。"), XT("代理人凭借力量挖掘，并仔细辨认")},
		["Item_RedGinseng"] = {self:Rand(20), tbTable:SPP(unionData.Farming), 0, tbTable:MPL(1), enumSolve.LingStone, XT("代理人虽用灵石作引，但无法辨认宝物在何方。啥都没找到。"), XT("代理人使用灵石作引")},
		["Item_Cinnabar"] = {self:Rand(50), tbTable:SPP(unionData.Mining), 0, tbTable:MPL(1), enumSolve.Wood, XT("代理人使用木头开凿，但无法辨认出宝物"), XT("代理人使用木头轻轻开凿")},
		["Item_SkyStone"] = {self:Rand(1), tbTable:SPP(unionData.Mining), 0, tbTable:MPL(2), enumSolve.LingStone, XT("代理人虽用灵石作引，但无法辨认宝物在何方。啥都没找到。"), XT("代理人使用灵石作引，并仔细辨认")},
		["Item_PurpleGanodermaLucidum"] = {self:Rand(10), tbTable:SPP(unionData.Farming), 0, tbTable:MPL(1), enumSolve.LingStone, XT("代理人虽用灵石作引，但无法辨认宝物在何方。啥都没找到。"), XT("代理人使用灵石作引")},
		["Item_SilverRock"] = {self:Rand(50), tbTable:SPP(unionData.Mining), 0, tbTable:MPL(0), enumSolve.Member, XT("啥都没有拿到。"), XT("代理人让弟子一起努力")},
		["Item_JadeEssence"] = {self:Rand(50), tbTable:SPP(unionData.Mining), 0, tbTable:MPL(1), enumSolve.Rock, XT("代理人虽用石头开凿，但无法辨认宝物。"), XT("代理人使用石头开凿，仔细辨认")},
		["Item_EarthEssence1"] = {self:Rand(1), tbTable:SPP(unionData.Mining), 0, tbTable:MPL(2), enumSolve.LingStone, XT("代理人虽用灵石作引，但无法辨认宝物在何方。啥都没找到。"), XT("代理人使用灵石作引，并仔细辨认")},
		["Item_MonsterBlood"] = {self:Rand(10), tbTable:SMP(countOfMember), 0, tbTable:MPL(0), enumSolve.Fight, XT("代理人想要击杀一些小妖兽，但力量不足，无法抗衡"), XT("代理人杀了一些小妖兽")}, 
		["Item_LingWood"] = {self:Rand(50), tbTable:SMP(countOfMember), 0, tbTable:MPL(0), enumSolve.Member, XT("啥都没有拿到。"), XT("代理人让弟子一起努力")},
		["Item_CopperRock"] = {self:Rand(50), tbTable:SPP(unionData.Mining), 0, tbTable:MPL(0), enumSolve.Member, XT("啥都没有拿到。"), XT("代理人让弟子一起努力")}
	}
	--必须保证所有点每级寻宝只有一种
	for k, v in pairs(tProduct) do
		if v.def.Products ~= nil and v.def.Products.Count > 0 then
			local item = v.def.Products[0];
			if t[item] then
				if solve == t[item][5] then
					if unionData.Intelligence >= t[item][4] then
						local count = math.ceil(t[item][1] * math.max(t[item][2], 1));
						region:AddIntoStorage(item, count);
						WorldLua:AddMsg(XT("{0}，找到了{1}个{2}。"), t[item][7], count, WorldLua:GetItemName(item));
						return;
					else
						WorldLua:AddMsg(XT(t[item][6]));
						return;
					end
				end
			end
		end
	end
	WorldLua:AddMsg(XT("代理人在{0}忙活半天，啥都没找到。"), region.def.DisplayName);
	return;
end

function switchAddTreasureFunctions()
    local tbTable = GameMain:GetMod("MapStoryHelper")
    tbTable.AddTreasure = correctedAddTreasure
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
iguana_acs_fix.submods["OnInit"]["correct treasure hunt for red ginseng"] = switchAddTreasureFunctions
iguana_acs_fix.submods["OnLoad"]["correct treasure hunt for red ginseng"] = switchAddTreasureFunctions
