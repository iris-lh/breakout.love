


class Block
	new: (@x=0, @y=0, @w=75, @h=20, @is_alive=true, @collide=false) =>

	update: =>
		if @is_alive and @collide
			@collide = false
			@is_alive = false

	draw: =>
		if @is_alive
			love.graphics.rectangle 'line', @x, @y, @w, @h