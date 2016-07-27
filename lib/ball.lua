local Ball
do
  local _class_0
  local _base_0 = {
    update = function(self)
      self.x = self.x + self.x_vel
      self.y = self.y + self.y_vel
      if self.x + self.w >= border.w or self.x <= border.x then
        self.x_vel = self.x_vel * -1
      end
      if self.y <= border.y then
        self.y_vel = self.y_vel * -1
      end
    end,
    draw = function(self)
      if self.is_alive == true then
        return love.graphics.rectangle('line', self.x, self.y, self.w, self.h)
      end
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, x, y, w, h, x_vel, y_vel, collide, is_alive)
      self.x, self.y, self.w, self.h, self.x_vel, self.y_vel, self.collide, self.is_alive = x, y, w, h, x_vel, y_vel, collide, is_alive
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
