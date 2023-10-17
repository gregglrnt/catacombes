extends Node3D
@export var sens := 5

# Called when the node enters the scene tree for the first time.

func _process(delta) :
	global_position = get_parent().global_position
	$SpringArm3D/Camera3D.look_at(%Player.get_node("Head").global_position)

func _input(event):
	if event is InputEventMouseMotion:
		var tempRot = rotation.x - event.relative.y / 1000 * sens
		rotation.y -= event.relative.x / 1000 * sens
		tempRot = clamp(tempRot, -.5, 0.5)
		rotation.x = tempRot
