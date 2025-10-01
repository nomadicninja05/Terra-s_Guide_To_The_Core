
function PrintTableByName_Smelting()
    dofile("SmeltingTables.lua")
    local validTables = {}
    for k, v in pairs(_G) do
        if type(v) == "table" and v.DC ~= nil then
            table.insert(validTables, {name = k, DC = v.DC})
        end
    end
    table.sort(validTables, function(a, b) return a.DC < b.DC end)

    local page = 1
    local pageSize = 10
    local totalPages = math.ceil(#validTables / pageSize)
    while true do
        print("-----Known ores that can be smelted-----: Page " .. page .. " of " .. totalPages)
        local startIdx = (page - 1) * pageSize + 1
        local endIdx = math.min(page * pageSize, #validTables)
        for i = startIdx, endIdx do
            local tbl = validTables[i]
            print((i - startIdx + 1) .. ". " .. tbl.name .. " (DC: " .. tbl.DC .. ")")
        end
        local selectionCount = endIdx - startIdx + 1
        local prevPageOption, nextPageOption, exitOption
        prevPageOption = selectionCount + 1
        nextPageOption = selectionCount + 2
        exitOption = selectionCount + 3
        if page > 1 then print(prevPageOption .. ". Previous page") end
        if page < totalPages then print(nextPageOption .. ". Next page") end
        print(exitOption .. ". Exit")
        io.write("Enter page number: ")
        local input = tonumber(io.read())
        if input == prevPageOption and page > 1 then
            page = page - 1
        elseif input == nextPageOption and page < totalPages then
            page = page + 1
        elseif input == exitOption then
            print("Returning to .")
            return
        elseif input and input >= 1 and input <= selectionCount then
            local selected = validTables[startIdx + input - 1]
            local tbl = _G[selected.name]
            print('"' .. (tbl.Name or selected.name) .. '"')
            print("DC:" .. tbl.DC)
            print('Ingredients:')
            for i = 1, 10 do
                local ing = tbl["Ingredient" .. i]
                if ing and ing ~= "null" and ing ~= "Null" then
                    print('  ' .. ing)
                end
            end
            io.write("Press Enter to return to Table of Contents ...")
            io.read()
        else
            print("There is page for this number in the chapter.")
        end
    end
end