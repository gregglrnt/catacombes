extends CharacterBody3D

class_name Player

@export var speed = 10
@export var fall_acceleration = 75
@export var jump_impulse = 20
@export var dead = false
var has_key = false

var target_velocity = Vector3.ZERO
@onready var animation = $Pivot/Casual_Male/AnimationPlayer

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * .5))

func _physics_process(delta):
	if dead: 
		animation.play("Defeat")
		return
		

	var input_dir = - Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if is_on_floor() and Input.is_action_pressed("jump"):
		target_velocity.y = jump_impulse
		animation.play("Jump")

	if direction != Vector3.ZERO:
		direction = direction.normalized()
		#$Pivot.look_at(position + direction)
		animation.play("Run")

	var collision := move_and_collide(direction * delta)
	if collision != null : 
		var body := collision.get_collider()
		handle_collide(body)
		

	if velocity == Vector3.ZERO :
		animation.play("Idle")

	# Ground Velocity
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed
		

	# Vertical Velocity
	if not is_on_floor(): # If in the air, fall towards the floor. Literally gravity
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)

	# Moving the Character
	velocity = target_velocity
	move_and_slide()
	
func handle_collide(body : Node3D) :
	if body.name == "Box": 
		has_key = true
	if body.name == "Door" and has_key == true:
		body.get_node("DoorCollision").disabled = true
	
