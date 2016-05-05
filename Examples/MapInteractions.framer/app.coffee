###
Map Interactions
###

map = new Layer
	width: 3639
	height: 2504
	image: "images/map-image.jpg"
map.center()
map.draggable = true
map.pinchable = true
map.pinchable.rotate = false

defaultX = map.x
defaultY = map.y
defaultScale = map.scale

map.states.add
	returnDefault:
		scale: defaultScale
		x: defaultX
		y: defaultY

map.states.animationOptions =
	curve: "spring(600,40,0)"

button = new Layer
	width: 120
	height: 120
	image: "images/centerButton.png"
button.x = 24
button.y = (Screen.height - button.height) - 12

button.onClick ->
	map.states.switch("returnDefault")
