colors = require "colors"

for i in [0..9]
	layer = new Layer
		x: Align.center
		y: i * 100
		width: Screen.height / colors.appleColors.length
		height: Screen.height / colors.appleColors.length
		backgroundColor: colors.appleColors[i]
		borderRadius: 1000
	layer.y = layer.height * i