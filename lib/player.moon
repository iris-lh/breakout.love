win_w, win_h = love.window.getMode()

--some fancy phi math
--a = @w*0.2764
--b = a*1.618



class Player
	new: (@x, @y, @w, @h, @is_alive, @x_vel) =>

	update: (dt) =>
		a = @w*0.2764
		b = a*1.618
		--moves player--

		if mouse_ctrl
			mouse_x = love.mouse.getX!
			
			@x = mouse_x - @w/2

		else
			@x = @x + @x_vel

			if love.keyboard.isDown 'right'
				@x_vel = 10

			elseif love.keyboard.isDown 'left'
				@x_vel = -10

			else 
				@x_vel = 0

		--player collisions--

		--player and ball--
		--top--
		if ball.y + ball.h >= @y and ball.y + ball.h < @y + @h / 2 and
			ball.x < @x + @w and ball.x + ball.w > @x  
			ball.y_vel *= -1

			if (ball.x+ball.w/2 >= @x) and (ball.x+ball.w/2 <= @x+a)
				if ball.x_vel > 0
					ball.x_vel *= -1
					
				ball.x_vel *= 1.3
				ball.y_vel *= 1.1

				

			elseif (ball.x+ball.w/2 > @x+a) and (ball.x+ball.w/2 < @x+a+b)
				ball.x_vel *= 0.6
				ball.y_vel *= 0.9
				

			elseif (ball.x+ball.w/2 >= @x+a+b) and (ball.x+ball.w/2 <= @x+a+a+b)

				if ball.x_vel < 0
					ball.x_vel *= -1

				ball.x_vel *= 1.3
				ball.y_vel *= 1.1
				

			
		--left--
		elseif ball.x + ball.w >= @x - @x_vel and ball.x + ball.w < @x + (@w / 4) and 
			ball.y + ball.h > @y and ball.y < @y + @h
			ball.x_vel *= -1
			ball.y -= 15

		--right--
		elseif ball.x <= @x + @w - @x_vel and ball.x > @x + (@w - @w / 4) and 
			ball.y + ball.h > @y and ball.y < @y + @h
			ball.x_vel *= -1
			ball.y -= 15
			
		--player and border--
		--left--
		if @x <= border.x 
			@x = border.x

		--right--
		elseif @x + @w > border.w 
			@x = border.w - @w

	draw: =>

		a = @w*0.2764
		b = a*1.618

		--draws left segment--
		love.graphics.rectangle 'line', @x, @y, a, @h

		--draws middle segment--
		love.graphics.rectangle 'line', @x+a, @y, b, @h

		--draws right segment--
		love.graphics.rectangle 'line', @x+a+b, @y, a, @h


		--guidelines for paddle dimensions

		--left edge
		--love.graphics.line @x, @y-5, @x, @y-@h

		--center
		--love.graphics.line @x+@w/2, @y-5, @x+@w/2, @y-@h

		--right edge
		--love.graphics.line @x+@w, @y-5, @x+@w, @y-@h
