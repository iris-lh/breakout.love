Player = require 'lib.player'
Ball = require 'lib.ball'
Block = require 'lib.block'

win_w = 800
win_h = 600
love.window.setMode win_w, win_h
love.window.setTitle('Breakout')

love.mouse.setVisible false 
love.mouse.setGrabbed true



love.load = ->

	export elements = {

		player: 	Player 0, win_h-40, 150, 20
		ball: 		Ball win_w/2, win_h/2, 10, 10
		
		block1:		Block 50, 10
		block2:		Block 150, 10
		block3:		Block 250, 10
		block4:		Block 350, 10
		block5:		Block 450, 10
		block6:		Block 550, 10
		block7:		Block 650, 10
		
	}

love.update = (dt) ->
	for i,element in pairs elements
		element\update!

		-- collision detection
		for i2, element_b in pairs elements
			if (i != i2) and element.is_alive and element_b.is_alive

				if element.x + element.w > element_b.x and
					element.x < element_b.x + element_b.w and 
					element.y + element.w > element_b.y and 
					element.y < element_b.y + element_b.h

					element.collide = true
					element_b.collide = true



	if love.keyboard.isDown 'escape'
		love.event.quit!

love.draw = ->
	for i,element in pairs elements
		element\draw!



	love.graphics.print elements.ball.x_vel, 10, 10
	love.graphics.print elements.ball.y_vel, 10, 25

	unless elements.ball.is_alive
		love.graphics.print "you lose", win_w/6, win_h/1.75, 75, 10, sy, ox, oy, kx, ky