-- NSOS Updater

local function UpdateNSOS()

            if fs.exists("NSOS-IveGotGames.lua") then
                fs.delete("NSOS-IveGotGames.lua")
                shell.run("wget https://raw.githubusercontent.com/N-Plasma/NStarOS/main/NSOS-IveGotGames.lua")
        end
            if fs.exists("NSOS-REDNET.lua") then
                fs.delete("NSOS-REDNET.lua")
                    shell.run("wget https://raw.githubusercontent.com/N-Plasma/NStarOS/main/NSOS-REDNET.lua")
        end
            if fs.exists("NSOS-Printer.lua") then
                fs.delete("NSOS-Printer.lua")
                shell.run("wget https://raw.githubusercontent.com/N-Plasma/NStarOS/main/NSOS-Printer.lua")
        end

    fs.delete("NSOS-Hub.lua")
    fs.delete("NSOS-Version.txt")
    shell.run("wget https://raw.githubusercontent.com/N-Plasma/NStarOS/main/NSOS-Hub.lua")
    shell.run("wget https://raw.githubusercontent.com/N-Plasma/NStarOS/main/NSOS-Version.txt")
    print("NSOS Updated, Restarting NSOS-Hub...")
    shell.run("NSOS-Hub.lua")
end

local Update = "NSOS-Version.txt"
local Check = ""
if fs.exists(Update) then
    local UpdateStatus = fs.open(Update, "r")
    if UpdateStatus then
        Check = UpdateStatus.readAll()
        UpdateStatus.close()
        -- trim leading/trailing whitespace/newlines
        Check = string.gsub(Check, "^%s*(.-)%s*$", "%1")
    end
end

if Check == "UPDATE" then
    print("Update Code Detected, Re-Installing NSOS (if data is affected there will be a warning when starting NSOS Again with a option to re-format so minimal data is lost)")
    UpdateNSOS()
end
-- NSOS Installer

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
            shell.run("wget https://raw.githubusercontent.com/N-Plasma/NStarOS/main/NSOS-REDNET.lua")
        end
        if string.find(choice, "2") then
            shell.run("wget https://raw.githubusercontent.com/N-Plasma/NStarOS/main/NSOS-Printer.lua")
        end
        if string.find(choice, "3") then
            shell.run("wget https://raw.githubusercontent.com/N-Plasma/NStarOS/main/IveGotGames.lua")
        end
    shell.run("wget https://raw.githubusercontent.com/N-Plasma/NStarOS/main//NSOS-Hub.lua")
    shell.run("wget https://raw.githubusercontent.com/N-Plasma/NStarOS/main/NSOS-Version.txt")
    print("NSOS installed.")
else
    print("Installation cancelled.")
end

shell.run("NSOS-Hub.lua")