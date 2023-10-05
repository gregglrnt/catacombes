extends CharacterBody3D

@export var isWalking : bool = false
@export var has_seen_player: bool = false

func _physics_process(_delta):
	if(isWalking) : 
		$Pivot/CultMember/AnimationPlayer.play("Walk")
	else : 
		$Pivot/CultMember/AnimationPlayer.play("Idle");
	if(has_seen_player):
		$Target.visible = true
