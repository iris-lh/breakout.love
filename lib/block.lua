local Block
do
  local _class_0
  local _base_0 = {
    update = function(self, dt)
      if self.is_alive == true then
        if ball.y + ball.h >= self.y and ball.y + ball.h < self.y + self.h / 2 and ball.x < self.x + self.w and ball.x + ball.w > self.x then
          ball.y_vel = ball.y_vel * -1
          self.is_alive = false
        end
        if ball.y <= self.y + self.h and ball.y + ball.h > self.y + self.h / 2 and ball.x < self.x + self.w and ball.x + ball.w > self.x then
          ball.y_vel = ball.y_vel * -1
          self.is_alive = false
        end
        if ball.x + ball.w > self.x and ball.x + ball.w < self.x + (self.w / 10) and ball.y + ball.h > self.y and ball.y < self.y + self.h then
          ball.x_vel = ball.x_vel * -1
          self.is_alive = false
        end
        if ball.x < self.x + self.w and ball.x > self.x + (self.w - self.w / 10) and ball.y + ball.h > self.y and ball.y < self.y + self.h then
          ball.x_vel = ball.x_vel * -1
          self.is_alive = false
        end
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
    __init = function(self, x, y, w, h, is_alive, collide)
      if is_alive == nil then
        is_alive = true
      end
      self.x, self.y, self.w, self.h, self.is_alive, self.collide = x, y, w, h, is_alive, collide
    end,
    __base = _base_0,
    __name = "Block"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Block = _class_0
  return _class_0
end
