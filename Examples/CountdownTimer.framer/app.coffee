###
Countdown
Ryan Smith | @byryan
One way to make a countdown timer
###

backgroundLayer = new BackgroundLayer
	backgroundColor: "rgba(30,36,43,1)"

# Create a label for the timer
timeLabel = new Layer
	height: 100
	backgroundColor: null
	html: "0:00"
	style:
		"font-family": "-apple-system"
		"font-size":"72px"
		"line-height":"100px"
		"color":"#eaeaea"
timeLabel.center()

# Set the inital value in seconds
count = 120
# Create variables for minutes and seconds
minuteLabel = 0
secondLabel = 0

# Decreases the count every second
timer = null
startTimer = () ->
	timer = Utils.interval 1, ->
		if count > 0
		
			count -= 1
			convertCount()
			updateScreen()

# Conver the count to minutes and seconds
convertCount = ->
	if count > 59
		minuteLabel = Math.floor(count / 60, 0)
		secondRemainder = count %% 60
		
		if secondRemainder < 10
			secondLabel = "0" + secondRemainder
		else
			secondLabel = secondRemainder
	
	else
		minuteLabel = 0
		if count < 10
			secondLabel = "0" + count
		else
			secondLabel = count
			if minuteLabel > 0
				minuteLabel = 0

# Update the label on the screen
updateScreen = () ->
	timeLabel.html = minuteLabel + ":" + secondLabel

# Convert count to minutes and seconds
convertCount()
# Update the label on the screen
updateScreen()
# Start the timer
startTimer()