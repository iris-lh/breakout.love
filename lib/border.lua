local Border
do
  local _class_0
  local _base_0 = {
    update = function(self)
      self.collide = false
    end,
    draw = function(self)
      return love.graphics.rectangle('line', self.x, self.y, self.w, self.h)
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, x, y, w, h, collide)
      self.x, self.y, self.w, self.h, self.collide = x, y, w, h, collide
    end,
    __base = _base_0,
    __name = "Border"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Border = _class_0
  return _class_0
end
