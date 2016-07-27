Player = require 'lib.player'
Ball = require 'lib.ball'
Block = require 'lib.block'

win_w = 800
win_h = 600

gamestate = 'game'


love.load = ->

	export border = { x:0, y:0, w:win_w, h:win_h }
	export ball = Ball 380, 280, 20, 20, 5, 5, '', true

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

	if ball.y > border.h
		gamestate = 'loser'

	if gamestate == 'game'
		for i, element in pairs elements
			if element.is_alive == true
				element\update!	
	
		ball\update!
	
	if love.keyboard.isDown 'escape'
		love.event.quit!

love.draw = ->

	if gamestate == 'game'
		love.graphics.print ball.x_vel, 10, 10
		love.graphics.print ball.y_vel, 10, 25

		love.graphics.setBackgroundColor 255, 255, 255

		love.graphics.setColor 0,0,0
		
		ball\draw!
		for i, element in pairs elements 
			element\draw!

	elseif gamestate == 'loser'
		love.graphics.setBackgroundColor 0, 0, 0
		love.graphics.setColor 255,255,255
		love.graphics.print 'ya blew it', 350, 300