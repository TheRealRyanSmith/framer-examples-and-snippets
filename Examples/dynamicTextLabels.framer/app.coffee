# Using HTML in Projects
backgroundLayer = new BackgroundLayer
	backgroundColor: "#eaeaea"

# Dynamic Label
label = "My Label"
myLabel = new Layer
	width: 750, height: 128
# 	backgroundColor: "transparent"
	backgroundColor: "#fff"
myLabel.html = label
myLabel.style =
	"font-family": "SF UI Text" 
	"font-size": "36px"
	"color": "#48494a"
	"font-weight": "600"
	"text-align": "center"
	"padding-top": "64px"


card = new Layer
	x: 0, y: 128+24
	width: 702, height: 1158
	backgroundColor: "#ffffff"
	borderRadius: 12
card.centerX()