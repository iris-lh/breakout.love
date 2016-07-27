
class Block 
	new: (@x, @y, @w, @h, @is_alive = true, @collide) =>

	update: =>

		--block's collisions--
		if @is_alive == true

			--top side--
			if ball.y + ball.h >= @y and ball.y + ball.h < @y + @h / 2 and
				ball.x < @x + @w and ball.x + ball.w > @x 
				ball.y_vel *= -1
				@is_alive = false
	
			--bottom side--
			if ball.y <= @y + @h and ball.y + ball.h > @y + @h / 2 and
				ball.x < @x + @w and ball.x + ball.w > @x
				ball.y_vel *= -1
				@is_alive = false		
	
			--left side--
			if ball.x + ball.w > @x and ball.x + ball.w < @x + (@w / 10) and 
				ball.y + ball.h > @y and ball.y < @y + @h 
				ball.x_vel *= -1
				@is_alive = false
	
			--right side
			if ball.x < @x + @w and ball.x > @x + (@w - @w / 10) and 
				ball.y + ball.h > @y and ball.y < @y + @h
				ball.x_vel *= -1
				@is_alive = false

	draw: =>
		--draw's block--
		if @is_alive == true
			love.graphics.rectangle 'line', @x, @y, @w, @h
			