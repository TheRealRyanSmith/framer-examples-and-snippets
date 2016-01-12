# Mail.app Compose New Mail Transition
# Ryan Smith | Smithx.net | @byryan

# Set Default Animation
Framer.Defaults.Animation =
	curve: "spring(150, 22, 0)"
	time: 0.4
# Target color
targetColor = null
# targetColor = "hsla(192, 100%, 80%, 0.72)"




###
Layers
###

# Set Blured Background Layer
backgroundLayer = new Layer
	width: Screen.width, height: Screen.height
	image: "images/background.png"

# Inbox View
inboxView = new Layer
	width: Screen.width, height: Screen.height
	image: "images/inboxView.png"

# Status Bars
statusBarBlack = new Layer
	width: Screen.width
	height: 40
	image: "images/statusBarBlack.png"
statusBarWhite = new Layer
	width: Screen.width
	height: 40
	image: "images/statusBarWhite.png"
	opacity: 0

# Tap Area for Compose Icon
composeTapArea = new Layer
	maxX: Screen.width, maxY: Screen.height
	width: 112,	height: 96
	backgroundColor: targetColor
	superLayer: inboxView

# Compose View
composeView = new Layer
	y: Screen.height
	width: Screen.width, height: 1254
	image: "images/composeView.png"

# Tap Area for Cancel Icon
cancelTapArea = new Layer
	width: 200, height: 100
	backgroundColor: targetColor
	superLayer: composeView




###
States
###

# toggle black status bar
statusBarBlack.states.add
	on: opacity: 1 
	off: opacity: 0 

# toggle white status bar
statusBarWhite.states.add
	on: opacity: 1
	off: opacity: 0

# scale inbox view
inboxView.states.add
	default: scale: 1
	scaled: scale: 0.92, maxY: Screen.height

# reposition compose view
composeView.states.add
	default: y: Screen.height
	active: y: 72




###
Events
###

# Tap Compose Icon
composeTapArea.on Events.Click, ->
	inboxView.states.switch("scaled")
	composeView.states.switch("active")
	statusBarBlack.states.switch("off")
	statusBarWhite.states.switch("on")

# Tap Cancel Button
cancelTapArea.on Events.Click, ->
	inboxView.states.switch("default")
	composeView.states.switch("default")
	statusBarBlack.states.switch("on")
	statusBarWhite.states.switch("off")

