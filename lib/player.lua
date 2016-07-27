local win_w, win_h = love.window.getMode()
local Player
do
  local _class_0
  local _base_0 = {
    update = function(self, dt)
      if mouse_ctrl then
        local mouse_x = love.mouse.getX()
        self.x = mouse_x - self.w / 2
      else
        self.x = self.x + self.x_vel
        if love.keyboard.isDown('right') then
          self.x_vel = 10
        elseif love.keyboard.isDown('left') then
          self.x_vel = -10
        else
          self.x_vel = 0
        end
      end
      if ball.y + ball.h >= self.y and ball.y + ball.h < self.y + self.h / 2 and ball.x < self.x + self.w and ball.x + ball.w > self.x then
        ball.y_vel = ball.y_vel * -1
      elseif ball.x + ball.w >= self.x - self.x_vel and ball.x + ball.w < self.x + (self.w / 4) and ball.y + ball.h > self.y and ball.y < self.y + self.h then
        ball.x_vel = ball.x_vel * -1
      elseif ball.x <= self.x + self.w - self.x_vel and ball.x > self.x + (self.w - self.w / 4) and ball.y + ball.h > self.y and ball.y < self.y + self.h then
        ball.x_vel = ball.x_vel * -1
      end
      if self.x <= border.x then
        self.x = border.x
      elseif self.x + self.w > border.w then
        self.x = border.w - self.w
      end
    end,
    draw = function(self)
      love.graphics.rectangle('line', self.x, self.y, self.w, self.h)
      love.graphics.rectangle('line', self.x, self.y, self.w - 220, self.h)
      return love.graphics.rectangle('line', self.x, self.y, self.w - 30, self.h)
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, x, y, w, h, is_alive, x_vel)
      self.x, self.y, self.w, self.h, self.is_alive, self.x_vel = x, y, w, h, is_alive, x_vel
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
