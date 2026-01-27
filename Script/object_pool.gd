extends Node

@export var object_scene:PackedScene
var object_pool:Array = []

func add_to_pool(object:StaticBody3D):
	object_pool.append(object)
	object.hide()

func pull_from_pool() -> StaticBody3D:
	var object:StaticBody3D
	if object_pool.is_empty():
		object = object_scene.instantiate()
		object = object_pool[0]
		object_pool.remove_at(0)
	
	object.show()
	return object
