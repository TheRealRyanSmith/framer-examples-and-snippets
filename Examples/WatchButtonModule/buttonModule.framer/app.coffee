# button tap module
# @byryan

# add the module
buttonModule = require "buttonAnimation"

# create a new button
buttonPrimary = new Layer
	x: 2
	y: 16
	width: 308
	height: 80
	image: "images/buttonPrimary.png"

# create another button
buttonDefault= new Layer
	x: 2
	y: 16 + buttonPrimary.height + 16
	width: 308
	height: 80
	image: "images/buttonDefault.png"


# invoke the button animation function
buttonPrimary.onClick ->
	buttonModule.buttonAnimation(buttonPrimary)

buttonDefault.onClick ->
	buttonModule.buttonAnimation(buttonDefault)



