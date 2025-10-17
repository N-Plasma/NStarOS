print("This will install NSOS in the current directory.")
print("Proceed? (y/n)")
local input = read()
if input == "Y" or input == "y" then
    print("Choose Install options (NSOS-Hub will be installed with all options, type in any order any options multiple options allowed type None to only get NSOS-Hub):")
    print("")
    print("1. NSOS-REDNET (Requires modem)")
    print("")
    print("2. NSOS-Printer (Requires printer)")
    print("")
    print("3. NSOS-IveGotGames (Requires Speaker & Monitor)")
    print("")
    local choice = read()
        if string.find(choice, "1") then
            shell.run("https://github.com/N-Plasma/NStarOS/blob/main/NSOS-REDNET.lua")
        end
        if string.find(choice, "2") then
            shell.run("https://github.com/N-Plasma/NStarOS/blob/main/NSOS-Printer.lua")
        end
        if string.find(choice, "3") then
            shell.run("https://github.com/N-Plasma/NStarOS/blob/main/NSOS-IveGotGames.lua")
        end
    shell.run("https://github.com/N-Plasma/NStarOS/blob/main/NSOS-Hub.lua")
    print("NSOS installed.")
else
    print("Installation cancelled.")
end