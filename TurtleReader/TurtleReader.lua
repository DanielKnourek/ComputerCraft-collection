local RUN = true
local facingS = nil
local values = {}
local modem = peripheral.wrap("left")

--START--funtions
function IsFaceSouth()
    local state, table = turtle.inspectDown()    
    if(table.state.facing == "south") then
        return false
    else 
        return true 
    end

end
function ReadRedstone(currStep)
        local posTable = {0,0,0}
        local C,A
        if (facingS) then
            C = 1
            A = 3
        else
            C = 3
            A = 1
        end
        posTable[2] = redstone.getAnalogInput("top") --B
        posTable[C] = redstone.getAnalogInput("left") -- C
        posTable[A] = redstone.getAnalogInput("right") --A
        if(facingS) then
            table.insert(values,posTable)
        else
            table.insert(values,1,posTable)
        end
        return posTable
end
function Restart()
    while turtle.forward() do
    end    
    turtle.turnLeft()
    turtle.turnLeft()
    StepN = 0
    if IsFaceSouth() then
        facingS = true
        print("Reseted! South")
    else
        facingS = false
        print("Reseted! North")
    end
    
end
function save(table,name)
    local file = fs.open(name,"w")
    file.write(textutils.serialize(table))
    file.close()
end
function load(name)
    local file = fs.open(name,"r")
    local data = file.readAll()
    file.close()
    return textutils.unserialize(data)
end
--END--funstions

--NEW session--
Restart()


--MAIN LOOP
while RUN do
    values = {}
    local StepN = 0
    local stepRedstone = ReadRedstone(StepN)
    write("|"..stepRedstone[1].." "..stepRedstone[2].." "..stepRedstone[3])
    while turtle.forward() do
        --write("|Step "..StepN.." ")
        StepN = StepN+1
        -----get redstoe ,make tabnle,get pos, save to file
        stepRedstone = ReadRedstone()
        write("|"..stepRedstone[1].." "..stepRedstone[2].." "..stepRedstone[3])
    end
    if IsFaceSouth() then
        facingS = true
    else
        facingS = false
    end
    turtle.turnLeft()
    turtle.turnLeft()        
    if facingS then
        print("South?")
    else
        print("north!")
    end
    save(values,"values.json")
    StepN = 0
    break
end


