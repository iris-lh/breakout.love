class Player
	new: (@x, @y, @w, @h, @is_alive, @x_vel) =>

	update: (dt) =>
		--moves player--
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
			
		--left--
		elseif ball.x + ball.w >= @x - @x_vel and ball.x + ball.w < @x + (@w / 4) and 
			ball.y + ball.h > @y and ball.y < @y + @h
			ball.x_vel *= -1

		--right--
		elseif ball.x <= @x + @w - @x_vel and ball.x > @x + (@w - @w / 4) and 
			ball.y + ball.h > @y and ball.y < @y + @h
			ball.x_vel *= -1
			
		--player and border--
		--left--
		if @x <= border.x 
			@x = border.x

		--right--
		elseif @x + @w > border.w 
			@x = border.w - @w

	draw: =>
		--draws main paddle--
		love.graphics.rectangle 'line', @x, @y, @w, @h
		--draws left section--
		love.graphics.rectangle 'line', @x, @y, @w - 220, @h
		--draws right section--
		love.graphics.rectangle 'line', @x, @y, @w - 30, @h