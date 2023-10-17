extends CharacterBody3D

@export var isWalking : bool = false
@export var has_seen_player: bool = false
@onready var pathFollow : PathFollow3D = get_parent().get_parent()
@export var move_speed = 3


func _physics_process(delta):

	if(pathFollow.progress_ratio <= 1):
		pathFollow.progress += move_speed * delta
		$Pivot/CultMember/AnimationPlayer.play("Walk");
		$AudioStreamPlayer3D.play()
		
	else: 
		$Pivot/CultMember/AnimationPlayer.play("Idle");
	
	if(has_seen_player):
		$Target.visible = true
		move_speed = 0
	
