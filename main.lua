local Player = require('lib.player')
local Ball = require('lib.ball')
local Block = require('lib.block')
local win_w = 800
local win_h = 600
love.window.setMode(win_w, win_h)
love.window.setTitle('Breakout')
love.mouse.setVisible(false)
love.mouse.setGrabbed(true)
love.load = function()
  elements = {
    player = Player(0, win_h - 40, 150, 20),
    ball = Ball(win_w / 2, win_h / 2, 10, 10),
    block1 = Block(50, 10),
    block2 = Block(150, 10),
    block3 = Block(250, 10),
    block4 = Block(350, 10),
    block5 = Block(450, 10),
    block6 = Block(550, 10),
    block7 = Block(650, 10)
  }
end
love.update = function(dt)
  for i, element in pairs(elements) do
    element:update()
    for i2, element_b in pairs(elements) do
      if (i ~= i2) and element.is_alive and element_b.is_alive then
        if element.x + element.w > element_b.x and element.x < element_b.x + element_b.w and element.y + element.w > element_b.y and element.y < element_b.y + element_b.h then
          element.collide = true
          element_b.collide = true
        end
      end
    end
  end
  if love.keyboard.isDown('escape') then
    return love.event.quit()
  end
end
love.draw = function()
  for i, element in pairs(elements) do
    element:draw()
  end
  love.graphics.print(elements.ball.x_vel, 10, 10)
  love.graphics.print(elements.ball.y_vel, 10, 25)
  if not (elements.ball.is_alive) then
    return love.graphics.print("you lose", win_w / 6, win_h / 1.75, 75, 10, sy, ox, oy, kx, ky)
  end
end
