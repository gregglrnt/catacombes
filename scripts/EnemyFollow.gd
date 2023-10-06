extends Path3D

#TODO: make this script generic

var pathFollow : PathFollow3D;
var mesh : Node3D;

# Called when the node enters the scene tree for the first time.
func _ready():
	pathFollow = self.get_child(0, true);
	mesh = pathFollow.get_child(0, true);
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	const move_speed := 0.1	
	if(pathFollow.progress_ratio <= 1):
		pathFollow.progress += move_speed + delta
		mesh.get_child(0).isWalking = true;
	else: 
		mesh.get_child(0).isWalking = false
	
