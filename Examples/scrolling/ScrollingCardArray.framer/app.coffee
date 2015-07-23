colors = ["#f1c40f", "#2ecc71", "#1abc9c", "#3498db", "#9b59b6"]

scroll = new ScrollComponent
	width: Screen.width, height: Screen.height

for i in [0..4]
	layer = new Layer
		x: 0
		y: i * Screen.width	
		width: Screen.width
		height: Screen.width
		backgroundColor: colors[i]
		superLayer: scroll.content

scroll.scrollHorizontal = false

scroll.contentInset =
	top:128, right:0, bottom:0, left: 0

navBar = new Layer
	x: 0
	y: 0
	width: Screen.width
	height: 128
	backgroundColor: "#eaeaea"