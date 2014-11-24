local foo = {}

-- LuaClassGen pregenerated functions

function foo.new()
  local self={}
  self._hats={}
  self.addHat=foo.addHat
  self.removeHat=foo.removeHat
  self.getHats=foo.getHats
  return self
end

function foo:getHats()
  assert(not self._hats_dirty,"Error: collection `self._hats` is dirty.")
  return self._hats
end

function foo:removeHat(val)
  if val == nil then
    for i,v in pairs(self._hats) do
      if v._remove then
        table.remove(self._hats,i)
      end
    end
    self._hats_dirty=nil
  else
    local found = false
    for i,v in pairs(self._hats) do
      if v == val then
        found = true
        break
      end
    end
    assert(found,"Error: collection `self._hats` does not contain `val`")
    val._remove=true
    self._hats_dirty=true
  end
end

function foo:addHat(val)
  assert(type(val)=="table","Error: collection `self._hats` can only add `table`")
  table.insert(self._hats,val)
end

return foo
