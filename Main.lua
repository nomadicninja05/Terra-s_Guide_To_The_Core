
dofile("Smelting.lua")

function Intro()
    print("-----(Terra's Guide to the Core Beta0.001 please report any bugs to Nom0811 on Discord or to the github page.)-----")
    print ("-----(This info can be obtained In character by Talking to Terraphina Irongrove and asking for her book.)-----")
    print("-----(Thanks to the creater of the POTM Wiki for making this possible and all you players for helping record everything.)-----")
    print("The Pages Have been opened and you begin to read...")
    print ("This Book was made for the Craftsmen and Women of the Core.")
    print("All info has been recoreded By Terraphana Irongrove with the Help of many people, Thank you everyone who came before.")
    print("Turn to the chapter of your choosing:")
    PrintMainCraftsAndSubtables()
end

CraftDisciplines = {
    Smithing = WIP,
    Smelting = PrintTableByName_Smelting,
    Tailoring = WIP,
    Woodworking = WIP,
    Leatherworking = WIP,
    Alchemy = WIP,
    Herbalism = WIP,
    Enchanting = WIP
}

Crafts = {
    Smithing = {"Smithing", "Gilding", "Smelting"},
    Tailoring = {"Weaving", "Tailoring"},
    Woodworking = {"Woodworking", "Carpentry"},
    Leatherworking = {"Leatherworking", "Tanning","Boiling"},
    Alchemy = {Alchemy},
    Herbalism = {Herbalism},
    Enchanting = {Enchanting}
}


function PrintMainCraftsAndSubtables()
    local function list_menu(items, exit_label)
        for i, item in ipairs(items) do
            print(i .. ". " .. tostring(item))
        end
        print(#items + 1 .. ". " .. exit_label)
    end

    while true do
        print("Table of Contents:")
        local mainCrafts = {}
        for k in pairs(Crafts) do
            table.insert(mainCrafts, k)
        end
        table.sort(mainCrafts)
        list_menu(mainCrafts, "Close Book.")
    io.write("Turn to Page of Desired Craft: ")
    local inputStr = io.read()
    local input = tonumber((inputStr or ""):match("^%s*(.-)%s*$"))
        if input == #mainCrafts + 1 then
            print("Closing Book.")
            return
        end
        local selected = mainCrafts[input]
        if not selected then
            print("Chapter does not exist.")
        else
            while true do
                print("Chapters for " .. selected .. ":")
                local subtables = Crafts[selected]
                list_menu(subtables, "Return to Table of Contents.")
                io.write("Turn to page for Desired Craft: ")
                local subInputStr = io.read()
                local subInput = tonumber((subInputStr or ""):match("^%s*(.-)%s*$"))
                if subInput == #subtables + 1 then
                    break
                end
                local finalSelected = subtables[subInput]
                if not finalSelected then
                    print("Page does not exist.")
                else
                    print("Choosen chapter: " .. tostring(finalSelected))
                    local discipline = CraftDisciplines[finalSelected]
                    if discipline ~= nil then
                        if type(discipline) == "function" then
                            discipline()
                        else
                            print("Value of CraftDisciplines['" .. finalSelected .. "']: " .. tostring(discipline))
                        end
                    else
                        print("This page does not exist.")
                    end
                end
            end
        end
    end
end

function WIP()
    print("(This section is a work in progress. Please check back later.)")
    PrintMainCraftsAndSubtables()
end






Intro()