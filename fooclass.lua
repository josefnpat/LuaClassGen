local foo = {}

function foo:draw()
  love.graphics.print("hello world",
    0,love.graphics.getWidth()/2,
    love.graphics.getHeight()/2,"center")
end

function foo:update()
  -- TODO (fooclass.update.lcg.lua)
end

-- LuaClassGen pregenerated functions

function foo.new()
  local self={}
  self.draw=foo.draw
  self.update=foo.update
  self._s={}
  self.add=foo.add
  self.remove=foo.remove
  self.gets=foo.gets
  return self
end

function foo:gets()
  assert(not self._s_dirty,"Error: collection `self._s` is dirty.")
  return self._s
end

function foo:remove(val)
  if val == nil then
    for i,v in pairs(self._s) do
      if v._remove then
        table.remove(self._s,i)
      end
    end
    self._s_dirty=nil
  else
    local found = false
    for i,v in pairs(self._s) do
      if v == val then
        found = true
        break
      end
    end
    assert(found,"Error: collection `self._s` does not contain `val`")
    val._remove=true
    self._s_dirty=true
  end
end

function foo:add(val)
  assert(type(val)=="table","Error: collection `self._s` can only add `table`")
  table.insert(self._s,val)
end

return foo
