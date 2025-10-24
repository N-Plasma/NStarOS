shell.run("clear")

-- Setup

print("------------------------------")
print("Welcome to NSOS-Hub V-Beta-1.5")
term.setTextColor(colors.yellow)
print("WARNING: This is an alpha version, expect bugs and incomplete features.")
term.setTextColor(colors.white)
print("------------------------------")

local DataSave = "NSOS-DataSave.txt"

sleep(.5)

if not fs.exists(DataSave) then
    term.setTextColor(colors.red)
    print("First time setup / DataSave corruption detected. Setting up DataSave...")
    term.setTextColor(colors.white)
    fs.open(DataSave, "w").close()
end

-- Update Checker

local function checkForUpdates()
    local success, response = pcall(function()
        return http.get("https://raw.githubusercontent.com/N-Plasma/NStarOS/main/NSOS-Version.txt")
end)

    if success and response then
        local latestVersion = response.readAll()
        response.close()

        local currentVersionFile = fs.open("NSOS-Version.txt", "r")
        local currentVersion = currentVersionFile.readAll()
        currentVersionFile.close()

        if latestVersion ~= currentVersion then
            term.setTextColor(colors.yellow)
            print("Update available, would you like to update now? (y/n)")
            term.setTextColor(colors.white)
            local updatewant = read()
                if updatewant == "Y" or updatewant == "y" then
                shell.run("NSOS-Installer-Updater.lua")
                fs.open("NSOS-Version.txt", "w").write(UPDATE)
                else
                print("Continuing without update...")
            end
        end
    end
end