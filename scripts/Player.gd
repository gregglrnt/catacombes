extends CharacterBody3D



class_name Player

@export var speed = 10
@export var fall_acceleration = 75
@export var jump_impulse = 20
@export var dead = false

var target_velocity = Vector3.ZERO
@onready var animation = $Pivot/Casual_Male/AnimationPlayer

func _physics_process(delta):
	if dead: 
		animation.play("Defeat")
		return

	var direction = Vector3.ZERO
	if Input.is_action_pressed("move_left") and Input.is_action_pressed("move_right"):
		direction.x += 0;
	elif Input.is_action_pressed("move_left"):
		direction.x += 1
	elif Input.is_action_pressed("move_right"):
		direction.x -= 1
	if Input.is_action_pressed("move_forward"):
		direction.z += 1
	if Input.is_action_pressed("move_back"):
		direction.z -= 1
	if is_on_floor() and Input.is_action_pressed("jump"):
		target_velocity.y = jump_impulse
		animation.play("Jump")

	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.look_at(position - direction, Vector3.UP)
		animation.play("Run")

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
