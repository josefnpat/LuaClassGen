local slow = {}

function slow.new()
  local self={}
  self.draw=slow.draw
  self.update=slow.update
  self.mousepressed=slow.mousepressed
  self.mousereleased=slow.mousereleased
  self.keypressed=slow.keypressed
  self.keyreleased=slow.keyreleased
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
  self._zindex=nil --init
  self.getZindex=slow.getZindex
  self.setZindex=slow.setZindex
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

function slow:draw()
end

function slow:update()
end

function slow:mousepressed()
end

function slow:mousereleased()
end

function slow:keypressed()
end

function slow:keyreleased()
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

function slow:getZindex()
  return self._zindex
end

function slow:setZindex(val)
  self._zindex=val
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

return slow
