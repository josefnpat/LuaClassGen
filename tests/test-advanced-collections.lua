fooadvcolclass = require "fooadvcolclass"

f = fooadvcolclass.new()

hats = {
  {name="Best Hat"},
  {name="Worst Hat",crap=true},
  {name="Blue Hat"},
  {name="Red Hat",crap=true},
}

for i,v in pairs(hats) do
  f:addHat( v )
end

assert(#f:getHats() == #hats)

for i,v in pairs(hats) do
  if v.crap then
    f:removeHat(v)
  end
end

-- Checks to ensure that an assert is thrown for a bogus value
assert(false==pcall( function() f:removeHat({}) end ))

-- Checks to ensure that an assert is thrown when dirty
assert(false==pcall( function() return f:getHats() end ))

-- Checks to ensure that assers are thrown on non-table adds
assert(false==pcall( function() return f:addHat(   ) end ))
assert(false==pcall( function() return f:addHat( 1 ) end ))
assert(false==pcall( function() return f:addHat("x") end ))

-- removes all the crap hats
f:removeHat()

-- assert the desired hat table
assert(f:getHats()[1].name == "Best Hat")
assert(f:getHats()[2].name == "Blue Hat")
assert(f:getHats()[3] == nil)

print("Sucess.")
