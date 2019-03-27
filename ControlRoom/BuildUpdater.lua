local file_GUI = "http://danielknourek.9e.cz/.CCcode/ControlRoom/GUI.lua"
local file_name = "GUI.lua"
while true do
    event, side, xPos, yPos = os.pullEvent("monitor_touch")

    if (xPos == 1 and yPos==1) then
        break
    end

    shell.run("delete",file_name)
    shell.run("wget","http://danielknourek.9e.cz/.CCcode/ControlRoom/GUI.lua")
    shell.run("delete","disk/ControlRoom/GUI.lua")
    shell.run("copy","GUI.lua","disk/ControlRoom/GUI.lua")

    
    print(os.time())
    print("Updated!")


  end
  