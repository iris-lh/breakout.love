Player = require 'lib.player'
Ball = require 'lib.ball'
Block = require 'lib.block'

win_w = 800
win_h = 600

export mouse_ctrl = true

playing = true

black = {0, 0, 0}
white = {255, 255, 255}

fg_color = white
bg_color = black

love.load = ->

	export border = { x:0, y:0, w:win_w, h:win_h }
	export ball = Ball 380, 280, 20, 20, 10, -10, '', true

	export elements = {

		player:		Player 300, 585, 250, 15, true, 0

		block: 		Block 0, 0, 100, 20, true
		block1: 	Block 120, 0, 100, 20, true
		block2: 	Block 240, 0, 100, 20, true
		block3: 	Block 360, 0, 100, 20, true
		block4: 	Block 480, 0, 100, 20, true
		block5: 	Block 600, 0, 100, 20, true
		block6: 	Block 720, 0, 80, 20, true
	}



love.update = (dt) ->

	export mouse_x = love.mouse.getX!

	if ball.y > border.h
		playing = false

	if playing == true
		for i, element in pairs elements
			if element.is_alive == true
				element\update!	
	
		ball\update!
	
	if love.keyboard.isDown 'escape'
		love.event.quit!



love.draw = ->

	if playing == true
		love.graphics.print ball.x_vel, 10, 25
		love.graphics.print ball.y_vel, 10, 40

		love.graphics.print mouse_x, 10, 60

		love.graphics.setBackgroundColor bg_color

		love.graphics.setColor fg_color
		
		ball\draw!
		for i, element in pairs elements 
			element\draw!

	elseif playing == false
		love.graphics.setBackgroundColor 0, 0, 0
		love.graphics.setColor 255,255,255
		love.graphics.print 'ya blew it', 350, 300