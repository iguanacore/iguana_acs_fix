-- This is a test scenario for fix/red-ginseng-treasure-hunt-using-farming-skill
--
-- It is meant to be used by entering code in the in-game console
--

--preliminary code to run
local g = GameMain:GetMod("TestMod")

function funcAsserter(descriptor, callback)
    return function (title, firstValue, secondValue, verbose)
        if verbose == nil then
            verbose = false
        end
        local result = callback(firstValue,secondValue)
        local text = tostring(result).." "..title
        if verbose then
            text = text.." | "..tostring(firstValue).." "..descriptor.." "..tostring(secondValue)
        end
        print(text)
        return result
    end
end
g.assert = funcAsserter("is equal to", function (a, b) return a == b end)
g.assertLessThan = funcAsserter("is less than", function (a, b) return a < b end)


function test_RedGinsengTreasureHuntFix()
    --setup
    local tbTable = GameMain:GetMod("MapStoryHelper")
    local numAdded = 0
    local itemAdded = ""
    local messageSent = ""
    local AddIntoStorage = function (self,item, count)
        numAdded = count
        itemAdded = item
        print("Added x"..count.." "..item.." into storage")
    end
    local mockWorldLua = {
        ["GetItemName"]=function() end,
        ["AddMsg"]=function(_, message)
            messageSent = message
        end
    }
    local enumSolve = CS.XiaWorld.OutspreadMgr.Region.SolveWay
    local mockRegion = {
        ["UnionData"]={
            ["Mining"]=10000,
            ["Farming"]=0,
            ["Intelligence"]=11,
            ["members"]={
                ["Count"]=10
            }
        },
        ["AddIntoStorage"]=AddIntoStorage,
        ["DisplayName"]="Fake region"
    }
    local mockProduct = {
        ["def"]={
            ["Products"]={
                ["Count"]=1,
                [0]="Item_RedGinseng"
            }
        }
    }
    local mocktProduct = {mockProduct}
    --test
    tbTable:AddTreasure(mocktProduct,mockRegion,mockWorldLua,enumSolve.LingStone)
    g.assert("red ginseng was added",itemAdded,"Item_RedGinseng")
    g.assertLessThan("we get a reasonably low amount of red ginseng", numAdded,50,true)
    g.assert("the messages are translated", string.find(messageSent, "找到"), nil)
end
test_RedGinsengTreasureHuntFix()