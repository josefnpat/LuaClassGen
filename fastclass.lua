local fast = {}

fast.__dead_pool = {}
fast.__dead_pool_max = 100
fast.__live_pool = {}

function fast.new()
  local self
  if #fast.__dead_pool > 0 then
    self = table.remove(fast.__dead_pool)
  else
    self = {}
    self.draw=fast.draw
    self.update=fast.update
    self.mousepressed=fast.mousepressed
    self.mousepreleased=fast.mousepreleased
    self.keypressed=fast.keypressed
    self.keyreleased=fast.keyreleased
    table.insert(fast.__live_pool,self)
  end
  self.getX=fast.getX
  self.setX=fast.setX
  self.getY=fast.getY
  self.setY=fast.setY
  self.getW=fast.getW
  self.setW=fast.setW
  self.getH=fast.getH
  self.setH=fast.setH
  self.getColor=fast.getColor
  self.setColor=fast.setColor
  self.getText=fast.getText
  self.setText=fast.setText
  self.getSubtext=fast.getSubtext
  self.setSubtext=fast.setSubtext
  self.getHelp=fast.getHelp
  self.setHelp=fast.setHelp
  self.getZindex=fast.getZindex
  self.setZindex=fast.setZindex
  self.getData=fast.getData
  self.setData=fast.setData
  self.getImage=fast.getImage
  self.setImage=fast.setImage
  self.getMusic=fast.getMusic
  self.setMusic=fast.setMusic
  self.getDelay=fast.getDelay
  self.setDelay=fast.setDelay
  fast:reset(self)
  return self
end

function fast:reset()
  self._x=nil --init
  self._y=nil --init
  self._w=nil --init
  self._h=nil --init
  self._color=nil --init
  self._text=nil --init
  self._subtext=nil --init
  self._help=nil --init
  self._zindex=nil --init
  self._data=nil --init
  self._image=nil --init
  self._music=nil --init
  self._delay=nil --init
end

function fast:destroy()
  for index,obj in pairs(fast.__live_pool) do
    if obj == self then
      if #fast.__dead_pool < fast.__dead_pool_max then
        table.insert(fast.__dead_pool,
          table.remove(fast.__live_pool,index))
      else
        table.remove(fast.__live_pool,index)
      end
      return true -- object has been marked as dead
    end
  end
  return false -- object was not in live_pool
end

function fast:draw()
end

function fast:update()
end

function fast:mousepressed()
end

function fast:mousepreleased()
end

function fast:keypressed()
end

function fast:keyreleased()
end

function fast:getX()
  return self._x
end

function fast:setX(val)
  self._x=val
end

function fast:getY()
  return self._y
end

function fast:setY(val)
  self._y=val
end

function fast:getW()
  return self._w
end

function fast:setW(val)
  self._w=val
end

function fast:getH()
  return self._h
end

function fast:setH(val)
  self._h=val
end

function fast:getColor()
  return self._color
end

function fast:setColor(val)
  self._color=val
end

function fast:getText()
  return self._text
end

function fast:setText(val)
  self._text=val
end

function fast:getSubtext()
  return self._subtext
end

function fast:setSubtext(val)
  self._subtext=val
end

function fast:getHelp()
  return self._help
end

function fast:setHelp(val)
  self._help=val
end

function fast:getZindex()
  return self._zindex
end

function fast:setZindex(val)
  self._zindex=val
end

function fast:getData()
  return self._data
end

function fast:setData(val)
  self._data=val
end

function fast:getImage()
  return self._image
end

function fast:setImage(val)
  self._image=val
end

function fast:getMusic()
  return self._music
end

function fast:setMusic(val)
  self._music=val
end

function fast:getDelay()
  return self._delay
end

function fast:setDelay(val)
  self._delay=val
end

return fast
