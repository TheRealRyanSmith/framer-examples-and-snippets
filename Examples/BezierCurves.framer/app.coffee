# Bezier Curves
# Great article on Smashinb Magazine to understand things
# https://www.smashingmagazine.com/2014/04/understanding-css-timing-functions/

Framer.Defaults.Animation =
	# point 0 & point 3 are always at 0,0 and 1,1
	# point 1 & point 2 (x, y, x, y)
	curve: "bezier-curve(0.5, -0.25, .25, 1)"
	time: 0.6

layerA = new Layer
	y: 100
	backgroundColor: "red"
	borderRadius: 400
layerA.centerX()
layerA.states.add
	b: y: 600

layerA.on Events.Click, ->
	layerA.states.next()