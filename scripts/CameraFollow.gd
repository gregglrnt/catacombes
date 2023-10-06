extends Camera3D

@export var distance = 6.0
@export var height = 4.0

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	set_as_top_level(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var target = get_parent().get_global_transform().origin
	var pos = get_global_transform().origin
	var up = Vector3(0,1,0)
	
	var offset = pos - target
	
	offset = offset.normalized()*distance
	offset.y = height
	
	pos = target + offset
	
	look_at_from_position(pos, target, up)
