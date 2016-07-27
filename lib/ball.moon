
class Ball
	new: (@x, @y, @w, @h, @x_vel, @y_vel,@collide, @is_alive) =>

	update: => 
		--ball trajectory--
		@x += @x_vel
		@y += @y_vel

		--ball right and left--
		if @x + @w >= border.w or
			@x <= border.x 
			@x_vel *= -1
		--@top--
		if @y <= border.y 
			@y_vel *= -1


	draw: =>
		--draws ball--
		if @is_alive == true
			love.graphics.rectangle 'line', @x, @y, @w, @h
			