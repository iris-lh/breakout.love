win_w, win_h = love.window.getMode!



class Ball
	new: (@x=0, @y=0, @w=10, @h=10, @x_vel=5, @y_vel=-5, @is_alive=true, @collide=false) =>

	update: =>

		if @is_alive
			nil

	draw: =>
		if @is_alive
			love.graphics.rectangle 'line', @x, @y, @w, @h