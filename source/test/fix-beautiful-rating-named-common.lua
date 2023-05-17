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

function test_beautifulRatingName()
    local g = GameMain:GetMod("TestMod")
    g.assert("beautiful rating is named Beautiful", GameDefine.BeautyValueDesc[3], "Beautiful")
end
test_beautifulRatingName()