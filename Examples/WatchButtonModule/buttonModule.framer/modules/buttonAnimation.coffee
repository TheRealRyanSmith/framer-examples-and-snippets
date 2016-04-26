# Add the following line to your project in Framer Studio.
# myModule = require "myModule"
# Reference the contents by name, like myModule.myFunction() or myModule.myVar

# Button Animation Function
# function name; take a layer as input
exports.buttonAnimation = (button) ->
	# create a new animation; take the funtion input as the layer
    buttonAni = new Animation
        layer: button,
				properties: {scale: 0.94, opacity: 0.72},
				time: 0.2
    # create the reverse of the animation
    buttonAniReverse = buttonAni.reverse()
    # start the animation; when it ends, start the reverse of the animation
    buttonAni.start()
    button.on Events.AnimationEnd, ->
        buttonAniReverse.start()
