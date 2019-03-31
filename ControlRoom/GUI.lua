	
local term = peripheral.wrap("monitor_1")
term.setTextScale(1)
local Height,Width = term.getSize()

term.setBackgroundColor(colors.gray)
term.setTextColor(colors.white)

term.clear()
term.setCursorPos(1,1)
--term.setBackgroundColor(3)
for y=1,Width do
    for x=1,Height do
        term.setCursorPos(x,y)
        if (x == 1 or x == Height or x == 20 or x == 60) then 
            term.setBackgroundColor(colors.gray)
            term.write("|")
        end   
        if (y == 1 or y == Width) then 
            term.setBackgroundColor(colors.gray)
            term.write("-")
        end       
        if ((x == 1 or x == Height or x == 20 or x == 60) and (y == 1 or y == Width)) then 
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

--Right------Storage--------
