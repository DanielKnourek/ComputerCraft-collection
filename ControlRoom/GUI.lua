-- string def
local ColR = {"dd", "This string ", "was read from ", "a table!", "\n"}
--- var def ---
local ColL = 2
local ColM = 21

local ColR = 64
local ColRLine = 1

local Margin = 2
local term = peripheral.wrap("monitor_1")
---
term.setTextScale(1)
local Height,Width = term.getSize()

--START--funtions
function WriteRLine(Text)
    ColRLine = ColRLine + Margin
    term.setCursorPos(ColR+Margin, ColRLine)
    write(Text)
end
--END--funstions

term.setBackgroundColor(colors.gray)
term.setTextColor(colors.white)
term.clear()
term.setCursorPos(1,1)
--term.setBackgroundColor(3)
for y=1,Width do
    for x=1,Height do
        term.setCursorPos(x,y)
        if (x == 1 or x == Height or x == ColM-1 or x == ColR-1) then 
            term.setBackgroundColor(colors.gray)
            term.write("|")
        end   
        if (y == 1 or y == Width) then 
            term.setBackgroundColor(colors.gray)
            term.write("-")
        end       
        if ((x == 1 or x == Height or x == ColM-1 or x == ColR-1) and (y == 1 or y == Width)) then 
            term.setCursorPos(x,y)
            term.setBackgroundColor(colors.gray)
            term.write("+")
        end       
    end
end

term.setCursorPos(5,5)
write(Height.." "..Width)

--Left----------------------

--Main----------------------

--Right------Storage--------»
WriteRLine("Storage Control")
WriteRLine("» Fluid")
WriteRLine("dds")


