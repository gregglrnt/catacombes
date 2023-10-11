extends Node3D

class_name Steve

@export var speed = 10

var velocity = Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var direction = Vector3.ZERO
	if Input.is_action_pressed("move_left") and Input.is_action_pressed("move_right"):
		direction.x += 0
	elif Input.is_action_pressed("move_left"):
		direction.x -= 1
	elif Input.is_action_pressed("move_right"):
		direction.x += 1
		
	if Input.is_action_pressed("move_back") and Input.is_action_pressed("move_forward"):
		direction.z += 0
	elif Input.is_action_pressed("move_back"):
		direction.z -= 1
	elif Input.is_action_pressed("move_forward"):
		direction.z += 1
