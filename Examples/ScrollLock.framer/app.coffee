keyColor = new Color("#1d61f0")

scroller = new ScrollComponent
	width: Screen.width
	height: Screen.height
scroller.scrollHorizontal = false

for layer in [0..10]
	layer = new Layer
		y: (Screen.height / 4) * layer
		width: Screen.width
		height: Screen.height / 4
		backgroundColor: keyColor.lighten(layer * 5)
		parent: scroller.content

# Lock scroll content to top of screen i.e. can't pull down
scroller.onMove ->
	if scroller.scrollY <= 0 then scroller.scrollY = 0