class Border
	new: (@x, @y, @w, @h, @collide) =>

	update: =>
		@collide = false

	draw: =>
		love.graphics.rectangle 'line', @x, @y, @w, @h