### 
Ryan Smith
smithx.net | @byryan

###

bg = new BackgroundLayer backgroundColor: "#eaeaea"

# Setup Button Layers
buttonA = new Layer y:100, width:384, height:128, borderRadius:256, backgroundColor: "#bdbfc1"
buttonA.centerX()

buttonB = new Layer y:300, width:384, height:128, borderRadius:256, backgroundColor: "#8c8e90"
buttonB.centerX()

buttonC = new Layer y:500, width:384, height:128, borderRadius:256, backgroundColor: "#5c5d5e"
buttonC.centerX()

buttonD = new Layer y:700, width:384, height:128, borderRadius:256, backgroundColor: "#e04516"
buttonD.centerX()

buttonE = new Layer y:900, width:384, height:128, borderRadius:256, backgroundColor: "hsl(210, 4%, 16%)"
buttonE.centerX()


# ========= Button A ============ #
# On a click, animate
buttonA.on Events.Click, ->
	buttonA.scale = 1.15
	buttonA.animate
		properties:
			scale:1
		curve:'spring(1200,30,0)'


# ========= Button B ============ #
# Animation B1
animationB1 = new Animation({
	layer: buttonB,
	properties: 
		x: buttonB.x - 16
	time: 0.01
})

# Animation B2
animationB2 = new Animation({
	layer: buttonB,
	properties: 
		x: buttonB.x
	curve: "spring(6000,0,200)"
})

# Run Animation B2 when Animation B1 ends
animationB1.on(Events.AnimationEnd, animationB2.start)

# On click, run Animation B1
buttonB.on Events.Click, ->
	animationB1.start()

# ========= Button C ============ #
animationC1 = new Animation({
	layer: buttonC,
	properties:
		rotation: -8
	time: 0.02
	curve: "ease-out"
})

animationC2 = new Animation({
	layer: buttonC,
	properties:
		rotation: 8
	time: 0.02
	curve: "ease-out"
})

animationC3 = new Animation({
	layer: buttonC,
	properties:
		rotation: 0
	curve: "spring(8000,0,100)"
})

animationC1.on(Events.AnimationEnd, animationC2.start)
animationC2.on(Events.AnimationEnd, animationC3.start)

# On click, run Animation C1
buttonC.on Events.Click, ->
	animationC1.start()


# ========= Button D ============ #
# initial sate
buttonD.saturate = 0

# Animation D1
animationD1 = new Animation({
	layer: buttonD,
	properties: 
		x: buttonD.x - 16
	time: 0.01
})

# Animation D2
animationD2 = new Animation({
	layer: buttonD,
	properties: 
		x: buttonD.x
	curve: "spring(8000,0,100)"
})

# Animation D3
animationD3 = new Animation({
	layer: buttonD,
	properties: 
		saturate: 80
	time: 0
})

# Run Animation D2 when Animation D2 ends
animationD1.on(Events.AnimationEnd, animationD2.start)
animationD2.on(Events.AnimationStart, animationD3.start)

# On click, run Animation D1
buttonD.on Events.Click, ->
	animationD1.start()

	
# ========= Button E ============ #
# add highlight layer
highlightF = new Layer y:900, width:384, height:128, borderRadius:256, backgroundColor: "#b93346"
highlightF.centerX()

# initial state
highlightF.scale = 0

animationE = new Animation ({
	layer: highlightF,
	properties:
		scale: 1
	time: 0.001
})

# On a click, animate
buttonE.on Events.Click, ->
	buttonE.scale = 1.15
	buttonE.animate
		properties:
			scale:1
			opacity: 0
		curve:'spring(1200,30,0)'
	animationE.start()


