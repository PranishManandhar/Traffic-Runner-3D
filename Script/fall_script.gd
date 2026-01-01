extends Area3D


func _on_body_entered(body: Node3D) -> void:
	body.queue_free()
	print("ded")
	
	if body.is_in_group('Player'):
		get_tree().reload_current_scene()
