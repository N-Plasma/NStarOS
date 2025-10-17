
print("------------------------------")
print("Welcome to NSOS-Hub V-ALPHA2")
term.setTextColor(colors.yellow)
print("WARNING: This is an alpha version, expect bugs and incomplete features.")
term.setTextColor(colors.white)
print("------------------------------")

local DataSave = "NSOS-DataSave"

sleep(.5)

if not fs.exists(DataSave) then
    term.setTextColor(colors.red)
    print("First time setup / DataSave corruption detected. Setting up DataSave...")
    term.setTextColor(colors.white)
    fs.open(DataSave, "w").close()
end



