# Using .lighten and .darken in a loop

# 1. define a new color
blue = new Color("#1d61f0")

scroller = new ScrollComponent
	width: Screen.width, height: Screen.height
scroller.scrollHorizontal = false

for i in [0..16]
	layer = new Layer
		y: 150 * i
		width: Screen.width
		height: 150
		# 2. call the color with .lighten(value)
		backgroundColor: blue.lighten(2)
		parent: scroller.content
		
		# 3. also works with .darken(value)

