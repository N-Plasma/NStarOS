print(" _____ _____ _____ _____ ")
print("│   │ │   __│     │   __│")
print("│ │ │ │__   │  │  │__   │")
print("│_│___│_____│_____│_____│")
print("")
print("--------------------------------------------------------------------------------")
print("Welcome to NSOS-Hub V-ALPHA1")
term.setTextColor(colors.yellow)
print("WARNING: This is an alpha version, expect bugs and incomplete features.")
tern.setTextColor(colors.white)
print("--------------------------------------------------------------------------------")

local DataSave = "NSOS-DataSave"

sleep(.5)

if not fs.exists(DataSave) then
    print("First time setup / DataSave corruption detected. Setting up DataSave...")
    fs.open(DataSave, "w").close()
end



