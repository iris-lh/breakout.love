local Block
do
  local _class_0
  local _base_0 = {
    update = function(self)
      if self.is_alive and self.collide then
        self.collide = false
        self.is_alive = false
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
    __init = function(self, x, y, w, h, is_alive, collide)
      if x == nil then
        x = 0
      end
      if y == nil then
        y = 0
      end
      if w == nil then
        w = 75
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
