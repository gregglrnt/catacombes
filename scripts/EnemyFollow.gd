extends Path3D

#TODO: make this script generic

@export var pathFollow: PathFollow3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	const move_speed := 0.1	
	if($Enemy1PathFollow.progress_ratio <= 1):
		pathFollow.progress += move_speed + delta
		$Enemy1PathFollow/Enemy1/Enemy.isWalking = true;
	else: 
		$Enemy1PathFollow/Enemy1/Enemy.isWalking = false
	
