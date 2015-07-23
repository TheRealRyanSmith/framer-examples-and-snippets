# Using cards with PageComponent
# ryan@smithx.net

backgroundLayer = new BackgroundLayer
	backgroundColor: "#eaeaea"

colors = ["#f1c40f", "#2ecc71", "#1abc9c", "#3498db", "#9b59b6"]

navbar = new Layer
	width: Screen.width
	height: 128
	backgroundColor: "hsla(212,100%,98%,1.0)"

cardWidth = 512

careArea = new PageComponent
	x: 64
	y: 128+64
	width: cardWidth
	height: 296
	backgroundColor: "transparent"
	scrollVertical: false

careArea.clip = false

pageA = new Layer
	x: 0
	y: 0
	width: cardWidth
	height: 296
	borderRadius: 12
# 	backgroundColor: colors[0]
	image: "images/pageA.png"
	superLayer: careArea.content

pageB = new Layer
	x: cardWidth + 32
	y: 0
	width: cardWidth
	height: 296
	borderRadius: 12
# 	backgroundColor: colors[1]
	image: "images/pageB.png"
	superLayer: careArea.content

pageC = new Layer
	x: (cardWidth + 32) * 2
	y: 0
	width: cardWidth
	height: 296
	borderRadius: 12
# 	backgroundColor: colors[2]
	image: "images/pageC.png"
	superLayer: careArea.content

pageC = new Layer
	x: (cardWidth + 32) * 3
	y: 0
	width: cardWidth
	height: 296
	borderRadius: 12
# 	backgroundColor: colors[3]
	image: "images/pageD.png"
	superLayer: careArea.content
	
	