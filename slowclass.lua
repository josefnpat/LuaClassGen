local slow = {}

-- TODO
function slow:draw()
end

-- TODO
function slow:update()
end

-- TODO
function slow:mousepressed()
end

-- TODO
function slow:mousereleased()
end

-- TODO
function slow:keyreleased()
end

-- LuaClassGen pregenerated functions

function slow.new()
  local self={}
  self.draw=slow.draw
  self.update=slow.update
  self.mousepressed=slow.mousepressed
  self.mousereleased=slow.mousereleased
  self.keyreleased=slow.keyreleased
  self._players={}
  self.addPlayer=slow.addPlayer
  self.removePlayer=slow.removePlayer
  self.getPlayers=slow.getPlayers
  self._bullets={}
  self.addBullet=slow.addBullet
  self.removeBullet=slow.removeBullet
  self.getBullets=slow.getBullets
  self._badguys={}
  self.addBadguy=slow.addBadguy
  self.removeBadguy=slow.removeBadguy
  self.getBadguys=slow.getBadguys
  self._x=nil --init
  self.getX=slow.getX
  self.setX=slow.setX
  self._y=nil --init
  self.getY=slow.getY
  self.setY=slow.setY
  self._w=nil --init
  self.getW=slow.getW
  self.setW=slow.setW
  self._h=nil --init
  self.getH=slow.getH
  self.setH=slow.setH
  self._color=nil --init
  self.getColor=slow.getColor
  self.setColor=slow.setColor
  self._text=nil --init
  self.getText=slow.getText
  self.setText=slow.setText
  self._subtext=nil --init
  self.getSubtext=slow.getSubtext
  self.setSubtext=slow.setSubtext
  self._help=nil --init
  self.getHelp=slow.getHelp
  self.setHelp=slow.setHelp
  self._zindes=nil --init
  self.getZindes=slow.getZindes
  self.setZindes=slow.setZindes
  self._data=nil --init
  self.getData=slow.getData
  self.setData=slow.setData
  self._image=nil --init
  self.getImage=slow.getImage
  self.setImage=slow.setImage
  self._music=nil --init
  self.getMusic=slow.getMusic
  self.setMusic=slow.setMusic
  self._delay=nil --init
  self.getDelay=slow.getDelay
  self.setDelay=slow.setDelay
  return self
end

function slow:getX()
  return self._x
end

function slow:setX(val)
  self._x=val
end

function slow:getY()
  return self._y
end

function slow:setY(val)
  self._y=val
end

function slow:getW()
  return self._w
end

function slow:setW(val)
  self._w=val
end

function slow:getH()
  return self._h
end

function slow:setH(val)
  self._h=val
end

function slow:getColor()
  return self._color
end

function slow:setColor(val)
  self._color=val
end

function slow:getText()
  return self._text
end

function slow:setText(val)
  self._text=val
end

function slow:getSubtext()
  return self._subtext
end

function slow:setSubtext(val)
  self._subtext=val
end

function slow:getHelp()
  return self._help
end

function slow:setHelp(val)
  self._help=val
end

function slow:getZindes()
  return self._zindes
end

function slow:setZindes(val)
  self._zindes=val
end

function slow:getData()
  return self._data
end

function slow:setData(val)
  self._data=val
end

function slow:getImage()
  return self._image
end

function slow:setImage(val)
  self._image=val
end

function slow:getMusic()
  return self._music
end

function slow:setMusic(val)
  self._music=val
end

function slow:getDelay()
  return self._delay
end

function slow:setDelay(val)
  self._delay=val
end

function slow:getPlayers()
  assert(not self._players_dirty,"Error: collection `self._players` is dirty.")
  return self._players
end

function slow:removePlayer(val)
  if val == nil then
    for i,v in pairs(self._players) do
      if v._remove then
        table.remove(self._players,i)
      end
    end
    self._players_dirty=nil
  else
    local found = false
    for i,v in pairs(self._players) do
      if v == val then
        found = true
        break
      end
    end
    assert(found,"Error: collection `self._players` does not contain `val`")
    val._remove=true
    self._players_dirty=true
  end
end

function slow:addPlayer(val)
  assert(type(val)=="table","Error: collection `self._players` can only add `table`")
  table.insert(self._players,val)
end

function slow:getBullets()
  assert(not self._bullets_dirty,"Error: collection `self._bullets` is dirty.")
  return self._bullets
end

function slow:removeBullet(val)
  if val == nil then
    for i,v in pairs(self._bullets) do
      if v._remove then
        table.remove(self._bullets,i)
      end
    end
    self._bullets_dirty=nil
  else
    local found = false
    for i,v in pairs(self._bullets) do
      if v == val then
        found = true
        break
      end
    end
    assert(found,"Error: collection `self._bullets` does not contain `val`")
    val._remove=true
    self._bullets_dirty=true
  end
end

function slow:addBullet(val)
  assert(type(val)=="table","Error: collection `self._bullets` can only add `table`")
  table.insert(self._bullets,val)
end

function slow:getBadguys()
  assert(not self._badguys_dirty,"Error: collection `self._badguys` is dirty.")
  return self._badguys
end

function slow:removeBadguy(val)
  if val == nil then
    for i,v in pairs(self._badguys) do
      if v._remove then
        table.remove(self._badguys,i)
      end
    end
    self._badguys_dirty=nil
  else
    local found = false
    for i,v in pairs(self._badguys) do
      if v == val then
        found = true
        break
      end
    end
    assert(found,"Error: collection `self._badguys` does not contain `val`")
    val._remove=true
    self._badguys_dirty=true
  end
end

function slow:addBadguy(val)
  assert(type(val)=="table","Error: collection `self._badguys` can only add `table`")
  table.insert(self._badguys,val)
end

return slow
