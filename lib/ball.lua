local win_w, win_h = love.window.getMode()
local Ball
do
  local _class_0
  local _base_0 = {
    update = function(self)
      if self.is_alive then
        self.x = self.x + self.x_vel
        self.y = self.y + self.y_vel
      end
      if self.collide then
        self.x_vel = -self.x_vel
        self.y_vel = -self.y_vel
        self.collide = false
      end
    end,
    draw = function(self)
      if self.is_alive then
        return love.graphics.rectangle('line', self.x, self.y, self.w, self.h)
      end
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, x, y, w, h, x_vel, y_vel, is_alive, collide)
      if x == nil then
        x = 0
      end
      if y == nil then
        y = 0
      end
      if w == nil then
        w = 10
      end
      if h == nil then
        h = 10
      end
      if x_vel == nil then
        x_vel = 5
      end
      if y_vel == nil then
        y_vel = -5
      end
      if is_alive == nil then
        is_alive = true
      end
      if collide == nil then
        collide = false
      end
      self.x, self.y, self.w, self.h, self.x_vel, self.y_vel, self.is_alive, self.collide = x, y, w, h, x_vel, y_vel, is_alive, collide
    end,
    __base = _base_0,
    __name = "Ball"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Ball = _class_0
  return _class_0
end
