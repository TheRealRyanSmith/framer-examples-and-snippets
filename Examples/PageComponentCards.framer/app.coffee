# PageComponent with cards

backgroundLayer = new BackgroundLayer
	backgroundColor: "rgba(32,32,32,1)"

colors = ["#f1c40f", "#2ecc71", "#1abc9c", "#3498db", "#9b59b6"]

cardWidth = 622
cardHeight = 1078

cardArea = new PageComponent
	x: 64
	y: 128+64
	width: cardWidth
	height: cardHeight
	backgroundColor: null
	scrollVertical: false
cardArea.clip = false

pageA = new Layer
	x: 0
	y: 0
	width: cardWidth
	height: cardHeight
	borderRadius: 12
# 	backgroundColor: colors[0]
	image: "images/pageA.png"
	superLayer: cardArea.content

pageB = new Layer
	x: cardWidth + 32
	y: 0
	width: cardWidth
	height: cardHeight
	borderRadius: 12
# 	backgroundColor: colors[1]
	image: "images/pageB.png"
	superLayer: cardArea.content

pageC = new Layer
	x: (cardWidth + 32) * 2
	y: 0
	width: cardWidth
	height: cardHeight
	borderRadius: 12
# 	backgroundColor: colors[2]
	image: "images/pageC.png"
	superLayer: cardArea.content

pageC = new Layer
	x: (cardWidth + 32) * 3
	y: 0
	width: cardWidth
	height: cardHeight
	borderRadius: 12
# 	backgroundColor: colors[3]
	image: "images/pageD.png"
	superLayer: cardArea.content
	
navBar = new Layer
	width: Screen.width
	height: 128
	backgroundColor: "rgba(21,21,23,1)"
	html: "PageComponent"
	style:
		"font-family": "-apple-system"
		"font-size": "32px"
		"font-weight": "500"
		"color": "#ffffff"
		"line-height": "148px"
		"text-align": "center"