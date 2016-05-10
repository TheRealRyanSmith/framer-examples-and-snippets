### 
Spring / Curve Tester
###

###
TODO:
- add html and style for curve var to each object
- add loop delta
- could you enter a base value, say first number 400, and have the program derive two other values from that, such as 200 and 800 (half and double)
###

# Adjust values to compare here
curveA = "spring(400, 0, 0)"
curveB = "spring(400, 40, 0)"
curveC = "spring(400, 100, 0)"


# Layers, states, events
boxA = new Layer
	x: 100
	y: 150
	width: 128
	height: 128
	backgroundColor: "hsla(219,12%,48%,1.0)"
	borderRadius: 8
boxA.states.add
	drop: maxY: Screen.height - 150
boxA.states.animationOptions =
	curve: curveA

boxB = new Layer
	x: 300
	y: 150
	width: 128
	height: 128
	backgroundColor: "hsla(219,12%,48%,1.0)"
	borderRadius: 8
boxB.states.add
	drop: maxY: Screen.height - 150
boxB.states.animationOptions =
	curve: curveB

boxC = new Layer
	x: 500
	y: 150
	width: 128
	height: 128
	backgroundColor: "hsla(219,12%,48%,1.0)"
	borderRadius: 8
boxC.states.add
	drop: maxY: Screen.height - 150
boxC.states.animationOptions =
	curve: curveC

runAnimation = () ->
	boxA.states.next()
	boxB.states.next()
	boxC.states.next()

Utils.delay 0.4, ->
	runAnimation()
Utils.interval 1.2, ->
	runAnimation()