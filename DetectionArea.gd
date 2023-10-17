extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	print("Enemy : ", body)
	if body is Player: 
		print("Enemy has seen Player")
		%Enemy.has_seen_player = true
		body.dead = true
