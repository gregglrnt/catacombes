extends Area3D

signal treasureCollected
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered_treasure(body):
	if body.name == "Player":
		print("Collect")
		$AnimationPlayer.play("bounce")
		$Timer.start()
		



func _on_timer_timeout():
	emit_signal("treasureCollected")
	queue_free()
