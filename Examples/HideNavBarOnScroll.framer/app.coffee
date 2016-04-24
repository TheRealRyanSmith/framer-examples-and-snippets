###
Hide navBar on scroll
###

bg = new BackgroundLayer
	backgroundColor: "#f5f5f5"

scroller = new ScrollComponent
	width: Screen.width
	height: Screen.height
	scrollHorizontal: false
scroller.contentInset =
	top: 128 + 48
	bottom: 48

content = new Layer
	width: 750, height: 4538
	image: "images/content.png"
	superLayer: scroller.content

navBar = new Layer
	width: Screen.width
	height: 128
	backgroundColor: "rgba(44,153,211,1)"
	html: "Hide on Scroll"
	style:
		"font-family": "-apple-system"
		"font-size": "34px"
		"color": "#ffffff"
		"font-weight": "500"
		"line-height": "148px"
		"text-align": "center"

navBar.states.add
 	show: y: 0
 	hide: y: -navBar.height
navBar.states.animationOptions =
 	curve: "spring(400, 40, 0)"

scroller.on Events.Scroll, ->
# 	print scroller.direction
	if scroller.direction == "up"
		navBar.states.switch("show")
	if scroller.direction == "down"
		navBar.states.switch("hide")

