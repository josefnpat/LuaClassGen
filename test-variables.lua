--[[
~/repos/luaclassgen♠ ./classgen 
Lua Class Generator
Class Name: foovar
Fast? (y/N): <y&n>
functions (csv): 
collections (csv): 
variables (csv): x
File written to `foovarclass.lua`
--]]

foovarclass = require "foovarclass"

-- Valid override
f = foovarclass.new{x="potato"}
assert(f:getX()=="potato")

-- Invalid override
f = foovarclass.new{y="potato"}
assert(f._y==nil)

-- Empty override
f = foovarclass.new()
assert(f:getX()==nil)

f:setX("frog")
assert(f:getX() =="frog")

print("Sucess.")
