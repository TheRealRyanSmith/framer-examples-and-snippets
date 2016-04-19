###
Grid of Photos | 2016-04-18 | @byryan
Using arrays and loops for layout and to make every image interactive. This is basically re-engineer this prototype by Jay Stakelon for Framer: https://www.youtube.com/watch?v=kJYI4oYrHik&list=PL9p5auxyrweMB6JVO24jFvW4NZufHacjz&index=4
###

# Import file "grid-images"
sketch = Framer.Importer.load("imported/grid-images@1x")
Utils.globalLayers(sketch)
backgroundLayer = new BackgroundLayer
	backgroundColor: "rgba(41,40,47,1)"

navBar = new Layer
	width: Screen.width
	height: 128
	backgroundColor: "rgba(21,21,23,1)"
	html: "Photos"
	style:
		"font-family": "-apple-system"
		"font-size": "32px"
		"font-weight": "500"
		"color": "#ffffff"
		"line-height": "148px"
		"text-align": "center"

# ARRAYS
photos = images.children
rowOne = images.children[0..2]
rowTwo = images.children[3..5]
rowThree = images.children[6..8]

# LAYOUT
for layer, i in rowOne
	layer.x = 0 + (i * 250)
	layer.y = 128
	layer.width = 250
	layer.height = 250

for layer, i in rowTwo
	layer.x = 0 + (i * 250)
	layer.y = 128 + 250
	layer.width = 250 
	layer.height = 250

for layer, i in rowThree
	layer.x = 0 + (i * 250)
	layer.y = 128 + 500
	layer.width = 250 
	layer.height = 250

# Adding elements to hide to an array
content = [images, navBar]

# EVENTS
for photo in photos
	photo.onClick (event, photo) ->
		currentImage = photo.copy()
		photo.visible = false
		for elementsToHide in content
			elementsToHide.animate
				properties:
					opacity: 0
				time: 0.24
				curve: "ease-in-out"
		currentImage.animate
			properties:
				scale: Screen.width / currentImage.width
				midX: Screen.width / 2
				midY: Screen.height / 2
			curve: "spring(400,40,0)"
		currentImage.onAnimationEnd ->
			content.visible = false
		
		currentImage.onClick ->
			currentImage.animate
				properties:
					scale: 1
					x: photo.x
					y: photo.y
				curve: "spring(400,40,0)"
			content.visible = true
			for elementsToHide in content
				elementsToHide.animate
					properties:
						opacity: 1
					time: 0.48
					curve: "ease-in-out"
			currentImage.onAnimationEnd ->
				photo.visible = true
				currentImage.destroy()






