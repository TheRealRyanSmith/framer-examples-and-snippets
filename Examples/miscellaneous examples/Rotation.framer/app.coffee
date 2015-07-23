# Rotation

# Create a background
background = new BackgroundLayer backgroundColor: "#DDD"

# Create a layer
square = new Layer
	width: 250, height: 250
	backgroundColor: "#FFF", borderRadius: 25
square.center()

# Create a spring animation
square.states.animationOptions =
	curve: "spring(250,25,0)"
	
Utils.delay 0.5, ->
	square.animate
		properties:
			scale: 1.4
		time: 0.3
Utils.delay 0.8, ->
	square.animate
		properties:
			scale: 1
		time: 0.2
Utils.delay 1, ->
	square.animate
		properties:
			rotation: 720