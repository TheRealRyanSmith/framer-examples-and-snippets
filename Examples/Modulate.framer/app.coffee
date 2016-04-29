backgroundLayer = new BackgroundLayer backgroundColor: "rgba(24,20,27,1)"
colors = ["#e65088", "#faa057", "#4caad9"]

container = new Layer
	y: Screen.height * 0.1
	width: Screen.width * 0.92
	height: Screen.height * 0.92
	backgroundColor: null
container.center()

boxA = new Layer
	width: 150, height: 150
	backgroundColor: colors[0]
	parent: container
	html: "Drag Me"
	style:
		"font-family": "-apple-system"
		"font-size": "24px"
		"color": "#ffffff"
		"font-weight": "400"
		"line-height": "150px"
		"text-align": "center"
boxA.draggable.enabled = true
boxA.draggable.horizontal = false

boxB = new Layer
	x: boxA.width * 1.5
	width: 150, height: 150
	backgroundColor: colors[1]
	parent: container

boxC = new Layer
	x: boxA.width * 3
	width: 150, height: 150
	backgroundColor: colors[2]
	parent: container

boxA.onMove ->
	boxB.y = Utils.modulate(boxA.y, [0, 1], [0, 1.5])
	boxC.y = Utils.modulate(boxA.y, [0, 1], [0, 0.5])
