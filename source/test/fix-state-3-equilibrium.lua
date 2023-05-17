-- This is a test scenario for fix/state-3-equilibrium
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


function test_State3Equilibrium()
    --setup
    xlua.private_accessible(CS.Panel_ThingInfo)
    --test
    g.assert("food equilibrium is 0",CS.Panel_ThingInfo.FoodF2[3],0)

end
test_State3Equilibrium()