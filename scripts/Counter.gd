extends Label

var treasure = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	text = str(treasure)



func _on_treasure_collected():
	treasure = treasure + 1
	_ready()
