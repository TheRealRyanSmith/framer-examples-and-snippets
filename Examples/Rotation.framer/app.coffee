# Rotation Example

# Create a background
background = new BackgroundLayer backgroundColor: "#DDD"

# Create a layer
square = new Layer
	width: 250, height: 250
	backgroundColor: "#FFF", borderRadius: 25
square.center()
square.states.add
	rotate: rotation: 720

# Set animation options
square.states.animationOptions =
	curve: "ease"
	time: 2

# On click
square.onClick ->
	square.states.next()
