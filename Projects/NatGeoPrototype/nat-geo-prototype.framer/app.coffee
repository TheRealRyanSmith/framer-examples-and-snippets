# This imports all the layers for "nat-geo" into natGeoLayers
sk = Framer.Importer.load "imported/nat-geo"

backgroundLayer = new BackgroundLayer
	backgroundColor: "#000000"

# ==== Setup ==== #
# set default animation
Framer.Defaults.Animation = {
    curve: "ease-in-out"
    time: 0.3
}

# make Movie Detail artboard visible
sk.ArtboardA.visible = true
sk.ArtboardB.visible = true
sk.ArtboardC.visible = true

# create a master view for the Movie Detail screen
movieDetailView = new Layer
	x: Screen.width + 20
	width: Screen.width
	height: Screen.height
	backgroundColor: "#000000"

# create a ScrollComponent overlay for the Movie Detail screen
movieDetailScroll = new ScrollComponent
	width: Screen.width
	height: Screen.height
	superLayer: movieDetailView
movieDetailScroll.scrollHorizontal = false
sk.movieDetailImage.superLayer = movieDetailView
sk.movieDetailImage.sendToBack()

# setup the feature photo
sk.starWarsPhoto.originY = 0
sk.starWarsPhoto.x = -625

# setup the detail view copy
sk.movieDetailCopy.y = Screen.height
sk.movieDetailCopy.superLayer = movieDetailScroll.content

detailScrollStartY = 0

# animate the feature image when the detail view scrolls
movieDetailScroll.on Events.Move, ->
	scrollDistance = movieDetailScroll.scrollY - detailScrollStartY
	sk.starWarsPhoto.scale = Utils.modulate scrollDistance, [0, 1000], [1, 0.33], true
	sk.headline.maxY = Utils.modulate scrollDistance, [0, 1136], [1270, 128], true
	sk.headline.opacity = Utils.modulate scrollDistance, [0, 800], [1, 0], true
	sk.backBtn.opacity = Utils.modulate scrollDistance, [0, 800], [1, 0], true
	sk.starWarsPhoto.opacity = Utils.modulate scrollDistance, [0, 1500], [1, 0], true


# Wrap the content layer of the views within ScrollComponents
movieListScroll = ScrollComponent.wrap(sk.movieList)
movieListScroll.scrollHorizontal = false


# ==== Movie List View ==== #
# set a variable for the starting position of the scroll view and calculate how far the view scrolled
movieListScrollYStart = 0
movieListScroll.on Events.ScrollStart, ->
	movieListScrollYStart = movieListScroll.scrollY

# logic so tap advances to next view (not on scroll)
# I assume there's a better way to do this that I don't know about
movieListScroll.on Events.ScrollEnd, ->
	movieListScrollDistance = movieListScroll.scrollY - movieListScrollYStart
	if movieListScrollDistance < 12
		if movieListScrollDistance > -12
			movieDetailView.animate
				properties:
					x: 0
			movieListScroll.animate
				properties:
					x: -770

# tap target for the detail view back button
backBtnHitArea = new Layer
	x: 0
	y: 0
	width: 144
	height: 144
	backgroundColor: "transparent"

# return to the list view when tapping back
backBtnHitArea.on Events.Click, ->
	movieDetailView.animate
		properties:
			x: Screen.width + 20
	movieListScroll.animate
		properties:
			x: 0 