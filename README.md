# Framer JS Examples and Snippets

*Organizing my Framer Studio examples and snippets.*

## Global Layers

Remove the need to preceded the layer name with the file name when importing Sketch of Photoshop files by adding 'Utils.globalLayers(mySketchFile)' below the importer line. For example:

```coffee
# Import file "mySketchFile"
mySketchFile = Framer.Importer.load("imported/grid-images@1x")

Utils.globalLayers(mySketchFile)
```




## Backgrounds

### Solid

```coffee
bg = new BackgroundLayer backgroundColor: "#eaeaea"
```

### Gradient

```coffee
bg = new BackgroundLayer
bg.style.background = "-webkit-linear-gradient(top, #FFFFFF 0%, #E0E3E8 100%)"
```

### Canvas Background

```coffee
Canvas.backgroundColor = "B3E3FF"
```




## Lighten

How to use .lighten and .darken:

```coffee
keyColor = new Color("#1d61f0")

layers = []
for i in [0..3]
	layer = new Layer
		width: 250, height: 250
		x: 250 * i
		backgroundColor: keyColor.lighten(5)
```




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
# Adding a label to a layer and styling text
navBar = new Layer
	width: Screen.width
	height: 128
	backgroundColor: "rgba(21,21,23,1)"
	html: "My Label"
	style:
		"font-family": "-apple-system"
		"font-size": "34px"
		"color": "#ffffff"
		"font-weight": "500"
		"line-height": "148px"
		"text-align": "center"
```




## Loop.delta

`Framer.Loop.delta = 1 / 1000`

Slows down animations to make fine tuning easier. Adjust the last number (1000) to control amount. For example:

```coffee
layerA = new Layer
layerA.animate
	properties: { x: 400, y: 400 }
	curve: "spring(600, 40, 0)"

# Slow down animations
Framer.Loop.delta = 1 / 1000
```




## Math.abs

Returns the absolute value of a number. This is useful when you don't care if the number is positive or negative. For example, in a scrolling layer you might want to know if a layer has moved by a certain threshold irregardless of positive or negative. It's easier and more streamlined to subtract numbers when you're not dealing with negatives.

```coffee
dragLayerEnd = Math.abs(dragLayer.y)
amountMoved = dragLayerStart - dragLayerEnd
```

