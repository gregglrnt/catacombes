extends RayCast3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(_delta):
	if is_colliding():
		var target = get_collider()
		if (target is Player) : 
			%Enemy.has_seen_player = true
			target.dead = true
		
