# Framer JS Examples and Snippets

*Organizing my Framer Studio examples and snippets.*

## Scrolling

```coffee
# Create a scroll component
scroller = new ScrollComponent
     width: Screen.width, height: Screen.height
scroller.scrollHorizontal = false

# Create and add a layer to a scroll component
longLayer = new Layer
	width: Screen.width, height: Screen.height * 3
	superLayer: scroller.content
```

```coffee
# listen for scroll; print Y position (test)
scroll.on Events.Scroll, ->
    print scroll.scrollY

# Prevent dragging beyond top
# listen for scroll and prevent scrolling past y = 0
scroll.on Events.Scroll, ->
    if scroll.scrollY <= 0 then scroll.scrollY = 0
```

```coffee
# mask a wrapped layer group in a scroll component
scroll = ScrollComponent.wrap sketch.group

# constrain scrolling
scroll.scrollHorizontal = false

# set padding
scroll.contentInset = 
    bottom: 90
```

### How to Scroll with Sketch (or Photoshop)

![Sketch Layers (left) and Framer Code (right)](Snippets/how_to_scroll.png)




## Arrays and Objects

```coffee
# Arrays
colors = ["#f1c40f", "#2ecc71", "#1abc9c", "#3498db", "#9b59b6"]
# Accessing an array
bg = new BackgroundLayer
	backgroundColor: colors[0]

# Array of Objects
arrayOfObjects = [
	{name: "Steve", favoriteColor: "blue"}
	{name: "Maggie", favoriteColor: "red"}
	{name: "Ryan", favoriteColor: "green"}
]
# Accessing the array of objects
print arrayOfObjects[0].name
print arrayOfObjects[0].favoriteColor
```




## Text

```coffee
layerA = new Layer
	width: Screen.width, height: 100
	backgroundColor: null
	html: "My Label"
	style:
		"font-size": "72px"
		"font-weight": "200"
		"color": "#ffffff"
		"line-height": "100px"
		"text-align": "center"
layerA.center()
```