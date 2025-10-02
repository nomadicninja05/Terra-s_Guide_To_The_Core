function clear_terminal()
    if package.config:sub(1,1) == '\\' then
        os.execute('cls')
    else
        os.execute('clear')
    end
end

function PrintTableByName_Carpentry()
    dofile("CarpentryTables.lua")
    local validTables = {}
    for k, v in pairs(_G) do
        if type(v) == "table" and v.Recipes ~= nil then
            table.insert(validTables, {name = k, Name = v.Name, Recipes = v.Recipes})
        end
    end
    table.sort(validTables, function(a, b)
        local dcA = (a.Recipes[1] and a.Recipes[1].DC) or 0
        local dcB = (b.Recipes[1] and b.Recipes[1].DC) or 0
        return dcA < dcB
    end)

    local page = 1
    local pageSize = 10
    local totalPages = math.ceil(#validTables / pageSize)
    while true do
        clear_terminal()
        print("-----Known Woods And How To Handle Them-----: Page " .. page .. " of " .. totalPages)
        local startIdx = (page - 1) * pageSize + 1
        local endIdx = math.min(page * pageSize, #validTables)
        for i = startIdx, endIdx do
            local tbl = validTables[i]
            print((i - startIdx + 1) .. ". " .. (tbl.Name or tbl.name))
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
        clear_terminal()
        if input == prevPageOption and page > 1 then
            page = page - 1
        elseif input == nextPageOption and page < totalPages then
            page = page + 1
        elseif input == exitOption then
            print("Returning to last page.")
            return
        elseif input and input >= 1 and input <= selectionCount then
            clear_terminal()
            local selected = validTables[startIdx + input - 1]
            print('"' .. (selected.Name or selected.name) .. '"')
            print('Recipes:')
            for i, recipe in ipairs(selected.Recipes) do
                local line = "  DC: " .. (recipe.DC or "?") .. ", Output: " .. (recipe.Output or "?")
                if recipe.Ingredient then
                    line = line .. ", Ingredient: " .. recipe.Ingredient
                end
                for n = 1, 10 do
                    local ing = recipe["Ingredient" .. n]
                    if ing then
                        line = line .. ", Ingredient" .. n .. ": " .. ing
                    end
                end
                print(line)
            end
            io.write("Press Enter to return to Table of Contents ...")
            io.read()
            clear_terminal()
        else
            print("There is no page for this number in the chapter.")
        end
    end
end

function PrintTableByName_Boiling()
    dofile("BoilingTables.lua")
    local validTables = {}
    for k, v in pairs(_G) do
        if type(v) == "table" and v.Recipes ~= nil then
            table.insert(validTables, {name = k, Name = v.Name, Recipes = v.Recipes})
        end
    end
    table.sort(validTables, function(a, b)
        local dcA = (a.Recipes[1] and a.Recipes[1].DC) or 0
        local dcB = (b.Recipes[1] and b.Recipes[1].DC) or 0
        return dcA < dcB
    end)

    local page = 1
    local pageSize = 10
    local totalPages = math.ceil(#validTables / pageSize)
    while true do
        clear_terminal()
        print("-----Known Leathers And How To Boil Them-----: Page " .. page .. " of " .. totalPages)
        local startIdx = (page - 1) * pageSize + 1
        local endIdx = math.min(page * pageSize, #validTables)
        for i = startIdx, endIdx do
            local tbl = validTables[i]
            print((i - startIdx + 1) .. ". " .. (tbl.Name or tbl.name))
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
        clear_terminal()
        if input == prevPageOption and page > 1 then
            page = page - 1
        elseif input == nextPageOption and page < totalPages then
            page = page + 1
        elseif input == exitOption then
            print("Returning to last page.")
            return
        elseif input and input >= 1 and input <= selectionCount then
            local selected = validTables[startIdx + input - 1]
            clear_terminal()
            print('"' .. (selected.Name or selected.name) .. '"')
            print('Recipes:')
            for i, recipe in ipairs(selected.Recipes) do
                print("  DC: " .. (recipe.DC or "?") .. ", Output: " .. (recipe.Output or "?") .. ", Ingredient: " .. (recipe.Ingredient or "?"))
            end
            io.write("Press Enter to return to Table of Contents ...")
            io.read()
            clear_terminal()
        else
            print("There is no page for this number in the chapter.")
        end
    end
end

function PrintTableByName_Tanning()
    dofile("TanningTables.lua")
    local validTables = {}
    for k, v in pairs(_G) do
        if type(v) == "table" and v.Recipes ~= nil then
            table.insert(validTables, {name = k, Name = v.Name, Recipes = v.Recipes})
        end
    end
    table.sort(validTables, function(a, b)
        local dcA = (a.Recipes[1] and a.Recipes[1].DC) or 0
        local dcB = (b.Recipes[1] and b.Recipes[1].DC) or 0
        return dcA < dcB
    end)

    local page = 1
    local pageSize = 10
    local totalPages = math.ceil(#validTables / pageSize)
    while true do
        clear_terminal()
        print("-----Known Leathers And How To Cure Them-----: Page " .. page .. " of " .. totalPages)
        local startIdx = (page - 1) * pageSize + 1
        local endIdx = math.min(page * pageSize, #validTables)
        for i = startIdx, endIdx do
            local tbl = validTables[i]
            print((i - startIdx + 1) .. ". " .. (tbl.Name or tbl.name))
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
        clear_terminal()
        if input == prevPageOption and page > 1 then
            page = page - 1
        elseif input == nextPageOption and page < totalPages then
            page = page + 1
        elseif input == exitOption then
            clear_terminal()
            print("Returning to last page.")
            return
        elseif input and input >= 1 and input <= selectionCount then
            clear_terminal()
            local selected = validTables[startIdx + input - 1]
            print('"' .. (selected.Name or selected.name) .. '"')
            print('Recipes:')
            for i, recipe in ipairs(selected.Recipes) do
                print("  DC: " .. (recipe.DC or "?") .. ", Output: " .. (recipe.Output or "?") .. ", Ingredient: " .. (recipe.Ingredient or "?"))
            end
            io.write("Press Enter to return to Table of Contents ...")
            io.read()
            clear_terminal()
        else
            clear_terminal()
            print("There is no page for this number in the chapter.")
        end
    end
end

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
        clear_terminal()
        if input == prevPageOption and page > 1 then
            page = page - 1
        elseif input == nextPageOption and page < totalPages then
            page = page + 1
        elseif input == exitOption then
            print("Returning to Last page.")
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
            clear_terminal()
        else
            print("There is page for this number in the chapter.")
        end
    end
end

function PrintTableByName_Alchemy()
    dofile("AlchemyTables.lua")
    local validTables = {}
    for k, v in pairs(_G) do
        if type(v) == "table" and v.Recipes ~= nil then
            table.insert(validTables, {name = k, Name = v.Name, Recipes = v.Recipes})
        end
    end
    table.sort(validTables, function(a, b)
        local dcA = (a.Recipes[1] and a.Recipes[1].DC) or 0
        local dcB = (b.Recipes[1] and b.Recipes[1].DC) or 0
        return dcA < dcB
    end)

    local page = 1
    local pageSize = 10
    local totalPages = math.ceil(#validTables / pageSize)
    while true do
        clear_terminal()
        print("-----Known essences and how to make them-----: Page " .. page .. " of " .. totalPages)
        local startIdx = (page - 1) * pageSize + 1
        local endIdx = math.min(page * pageSize, #validTables)
        for i = startIdx, endIdx do
            local tbl = validTables[i]
            print((i - startIdx + 1) .. ". " .. (tbl.Name or tbl.name))
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
        clear_terminal()
        if input == prevPageOption and page > 1 then
            page = page - 1
        elseif input == nextPageOption and page < totalPages then
            page = page + 1
        elseif input == exitOption then
            print("Returning to last page.")
            return
        elseif input and input >= 1 and input <= selectionCount then
            local selected = validTables[startIdx + input - 1]
            clear_terminal()
            print('"' .. (selected.Name or selected.name) .. '"')
            print('Recipes:')
            for i, recipe in ipairs(selected.Recipes) do
                print("  DC: " .. recipe.DC .. ", Ingredient: " .. recipe.Ingredient)
            end
            io.write("Press Enter to return to Table of Contents ...")
            io.read()
        else
            print("There is no page for this number in the chapter.")
        end
    end
end

function PrintTableByName_Gilding()
    dofile("GildingTables.lua")
    local validTables = {}
    for k, v in pairs(_G) do
        if type(v) == "table" and v.DC ~= nil then
            table.insert(validTables, {name = k, table = v})
        end
    end
    table.sort(validTables, function(a, b)
        return a.table.DC < b.table.DC
    end)

    local page = 1
    local pageSize = 10
    local totalPages = math.ceil(#validTables / pageSize)
    while true do
        clear_terminal()
        print("-----Known Gildable Metals And How To Gild Them-----: Page " .. page .. " of " .. totalPages)
        local startIdx = (page - 1) * pageSize + 1
        local endIdx = math.min(page * pageSize, #validTables)
        for i = startIdx, endIdx do
            local tbl = validTables[i]
            print((i - startIdx + 1) .. ". " .. (tbl.table.Name or tbl.name))
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
        clear_terminal()
        if input == prevPageOption and page > 1 then
            page = page - 1
        elseif input == nextPageOption and page < totalPages then
            page = page + 1
        elseif input == exitOption then
            print("Returning to last page.")
            return
        elseif input and input >= 1 and input <= selectionCount then
            local selected = validTables[startIdx + input - 1].table
            clear_terminal()
            print('"' .. (selected.Name or selected.name) .. '"')
            print('DC: ' .. (selected.DC or '?'))
            print('Ingredients:')
            for i = 1, 10 do
                local ing = selected["Ingredient" .. i]
                if ing and ing ~= "null" and ing ~= "Null" then
                    print('  ' .. ing)
                end
            end
            io.write("Press Enter to return to Table of Contents ...")
            io.read()
            clear_terminal()
        else
            print("There is no page for this number in the chapter.")
        end
    end
end

function PrintTableByName_Herbalism()
    dofile("HerbalismTables.lua")
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
        print("-----Known potions that can be Brewed-----: Page " .. page .. " of " .. totalPages)
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
        clear_terminal()
        if input == prevPageOption and page > 1 then
            page = page - 1
        elseif input == nextPageOption and page < totalPages then
            page = page + 1
        elseif input == exitOption then
            print("Returning to Tables of contents.")
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
            clear_terminal()
        else
            print("There no is page for this number in the chapter.")
        end
    end
end