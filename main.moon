Player = require 'lib.player'
Ball = require 'lib.ball'
Block = require 'lib.block'

require 'settings'

export win_w, win_h = love.window.getMode!


love.mouse.setGrabbed true
love.mouse.setVisible false


blocks_w = 100
blocks_h = 35


love.load = ->

	mouse_x, mouse_y = love.mouse.getPosition!

	export gamestate = 'playing'

	export border = { x:0, y:0, w:win_w, h:win_h }
	export ball = Ball 380, 500, 20, 20, ball_x_vel, ball_y_vel, '', true

	export elements = {

		player:		Player mouse_x-125, 585, 200, 15, true, 0

		block1: 	Block 0, 0, 100, blocks_h, true
		block2: 	Block 100, 0, 100, blocks_h, true
		block3: 	Block 200, 0, 100, blocks_h, true
		block4: 	Block 300, 0, 100, blocks_h, true
		block5: 	Block 400, 0, 100, blocks_h, true
		block6: 	Block 500, 0, 100, blocks_h, true
		block7: 	Block 600, 0, 100, blocks_h, true
		block8: 	Block 700, 0, 100, blocks_h, true

		block9: 	Block 0, 0, 100, blocks_h*2, true
		block10: 	Block 100, 0, 100, blocks_h*2, true
		block11: 	Block 200, 0, 100, blocks_h*2, true
		block12: 	Block 300, 0, 100, blocks_h*2, true
		block13: 	Block 400, 0, 100, blocks_h*2, true
		block14: 	Block 500, 0, 100, blocks_h*2, true
		block15: 	Block 600, 0, 100, blocks_h*2, true
		block16: 	Block 700, 0, 100, blocks_h*2, true

		block17: 	Block 0, 0, 100, blocks_h*3, true
		block18: 	Block 100, 0, 100, blocks_h*3, true
		block19: 	Block 200, 0, 100, blocks_h*3, true
		block20: 	Block 300, 0, 100, blocks_h*3, true
		block21: 	Block 400, 0, 100, blocks_h*3, true
		block22: 	Block 500, 0, 100, blocks_h*3, true
		block23: 	Block 600, 0, 100, blocks_h*3, true
		block24: 	Block 700, 0, 100, blocks_h*3, true

		block25: 	Block 0, 0, 100, blocks_h*4, true
		block26: 	Block 100, 0, 100, blocks_h*4, true
		block27: 	Block 200, 0, 100, blocks_h*4, true
		block28: 	Block 300, 0, 100, blocks_h*4, true
		block29: 	Block 400, 0, 100, blocks_h*4, true
		block30: 	Block 500, 0, 100, blocks_h*4, true
		block31: 	Block 600, 0, 100, blocks_h*4, true
		block32: 	Block 700, 0, 100, blocks_h*4, true

		block33: 	Block 0, 0, 100, blocks_h*5, true
		block34: 	Block 100, 0, 100, blocks_h*5, true
		block35: 	Block 200, 0, 100, blocks_h*5, true
		block36: 	Block 300, 0, 100, blocks_h*5, true
		block37: 	Block 400, 0, 100, blocks_h*5, true
		block38: 	Block 500, 0, 100, blocks_h*5, true
		block39: 	Block 600, 0, 100, blocks_h*5, true
		block40: 	Block 700, 0, 100, blocks_h*5, true
	}

	export blocks_left = 7


love.update = (dt) ->
	export fps = love.timer.getFPS!

	export mouse_x, mouse_y = love.mouse.getPosition!

	if ball.y > border.h
		export gamestate = 'lost'

	if gamestate == 'playing'
		for i, element in pairs elements
			if element.is_alive == true
				element\update!	
	
		ball\update!
	
	if love.keyboard.isDown 'escape'
		love.event.quit!

	if love.keyboard.isDown 'r'
		love.load!



love.draw = ->

	

	if gamestate == 'playing'
		love.graphics.print ('mouse_x: '..mouse_x), (10), win_h-60
		love.graphics.print ('fps: '..fps), (10), win_h-75

		--camera
		if camera_enabled
			love.graphics.translate (mouse_x*-1)+win_w/2, 0 --(mouse_y*-1)+win_h/2
		

		love.graphics.setBackgroundColor bg_color
		love.graphics.setColor fg_color


		ball\draw!
		for i, element in pairs elements 
			element\draw!

	elseif gamestate == 'lost'
		love.graphics.setBackgroundColor 0, 0, 0
		love.graphics.setColor 255,255,255
		love.graphics.print 'ya blew it', 350, 300