local win_w, win_h = love.window.getMode()
local Player
do
  local _class_0
  local _base_0 = {
    update = function(self)
      local mouse_x, mouse_y = love.mouse.getPosition()
      self.x = mouse_x - self.w / 2
      if self.x + self.w > win_w then
        self.x = win_w - self.w
      elseif self.x < 0 then
        self.x = 0
      end
    end,
    draw = function(self)
      return love.graphics.rectangle('line', self.x, self.y, self.w, self.h)
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, x, y, w, h, is_alive, collide)
      if x == nil then
        x = 0
      end
      if y == nil then
        y = 0
      end
      if w == nil then
        w = 150
      end
      if h == nil then
        h = 20
      end
      if is_alive == nil then
        is_alive = true
      end
      if collide == nil then
        collide = false
      end
      self.x, self.y, self.w, self.h, self.is_alive, self.collide = x, y, w, h, is_alive, collide
    end,
    __base = _base_0,
    __name = "Player"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Player = _class_0
  return _class_0
end
