--[[
~/repos/luaclassgen♠ ./classgen 
Lua Class Generator
Class Name: fast
Fast? (y/N): y
Dead pool max (int): 100
functions (csv): draw,update,mousepressed,mousereleased,keyreleased
collections (csv): player,bullet,badguy
variables (csv): x,y,width,height,color,text,subtext,help,zindes,data,image,music,delay
File written to `fastclass.lua`

~/repos/luaclassgen♠ ./classgen 
Lua Class Generator
Class Name: slow
Fast? (y/N): 
functions (csv): draw,update,mousepressed,mousereleased,keyreleased
collections (csv): player,bullet,badguy
variables (csv): x,y,width,height,color,text,subtext,help,zindes,data,image,music,delay
File written to `slowclass.lua`
]]--

require"socket"

fast = require("fastclass")
slow = require("slowclass")


function time(name,class,test)
  local start,stop
  start = socket.gettime()

  test(class)

  stop = socket.gettime()
  print(name..":"..((stop-start)*1000000).."us")
end

function create(class)
  local data = {}
  for i = 1,1000 do
    table.insert(data,class.new())
  end
  return data
end

time("Create Fast",fast,create)
time("Create Slow",slow,create)

function destroy(class)
  local data = create(class)
  for i,v in pairs(data) do
    table.remove(data,index)
    if v.destroy then v:destroy() end
  end
  data = nil
end

time("Destroy Fast",fast,destroy)
time("Destroy Slow",slow,destroy)

function sawtooth(class)
  local data = {}
  for i = 1,10 do
    for j = 1,100 do
      table.insert(data,class.new())
    end
    for index,v in pairs(data) do
      table.remove(data,index)
      if v.destroy then v:destroy() end
    end
  end
end

time("Sawtooth Fast",fast,sawtooth)
time("Sawtooth Slow",slow,sawtooth)
