local Player = require('lib.player')
local Ball = require('lib.ball')
local Block = require('lib.block')
local win_w = 800
local win_h = 600
local playing = true
local black = {
  0,
  0,
  0
}
local white = {
  255,
  255,
  255
}
local fg_color = white
local bg_color = black
love.load = function()
  border = {
    x = 0,
    y = 0,
    w = win_w,
    h = win_h
  }
  ball = Ball(380, 280, 20, 20, 5, -5, '', true)
  elements = {
    player = Player(300, 585, 250, 15, true, 0),
    block = Block(0, 0, 100, 20, true),
    block1 = Block(120, 0, 100, 20, true),
    block2 = Block(240, 0, 100, 20, true),
    block3 = Block(360, 0, 100, 20, true),
    block4 = Block(480, 0, 100, 20, true),
    block5 = Block(600, 0, 100, 20, true),
    block6 = Block(720, 0, 80, 20, true)
  }
end
love.update = function(dt)
  if ball.y > border.h then
    playing = false
  end
  if playing == true then
    for i, element in pairs(elements) do
      if element.is_alive == true then
        element:update()
      end
    end
    ball:update()
  end
  if love.keyboard.isDown('escape') then
    return love.event.quit()
  end
end
love.draw = function()
  if playing == true then
    love.graphics.print(ball.x_vel, 10, 10)
    love.graphics.print(ball.y_vel, 10, 25)
    love.graphics.setBackgroundColor(bg_color)
    love.graphics.setColor(fg_color)
    ball:draw()
    for i, element in pairs(elements) do
      element:draw()
    end
  elseif playing == false then
    love.graphics.setBackgroundColor(0, 0, 0)
    love.graphics.setColor(255, 255, 255)
    return love.graphics.print('ya blew it', 350, 300)
  end
end
