extends RigidBody3D

@export var enemyspeed := 15.0

func _physics_process(delta: float) -> void:
	var direction = Vector3(0,0,-1.0)
	apply_central_force(direction*enemyspeed)


func _on_body_entered(body: Node) -> void:
	if body.is_in_group('Player'):
		body.queue_free()
