# Spring / Curve Tester

box = new Layer
	x: Align.center
	y: 100
	width: 128
	height: 128
	backgroundColor: "hsla(219,12%,48%,1.0)"
	borderRadius: 8
box.states.add
	drop: maxY: Screen.height - 100
box.onClick ->
	newLayer.states.next()


box.states.animationOptions =
	# change values to test
	curve: "spring(500, 0, 20)"
