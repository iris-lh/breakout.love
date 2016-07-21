win_w, win_h = love.window.getMode!

class Player
	new: (@x=0, @y=0, @w=150, @h=20, @is_alive=true, @collide=false) =>

	update: =>
		mouse_x, mouse_y = love.mouse.getPosition()

		
		@x = mouse_x - @w/2

		if @x + @w > win_w
			@x = win_w - @w
		elseif @x < 0
			@x = 0

	draw: =>
		love.graphics.rectangle 'line', @x, @y, @w, @h