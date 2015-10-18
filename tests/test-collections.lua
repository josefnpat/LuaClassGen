foocolclass = require "foocolclass"

f = foocolclass.new()

hats = {
  {name="Best Hat"},
  {name="Worst Hat",crap=true},
  {name="Blue Hat"},
  {name="Red Hat",crap=true},
}

for i,v in pairs(hats) do
  f:addHat( v )
end

f:addHat( hats[1], hats[2] )

print("Sucess.")
