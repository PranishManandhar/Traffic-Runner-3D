extends Node3D

var lane_scene = preload("res://Scenes/platform.tscn")

func generate_lane(spawn_times:int):
	var pos = Vector3.ZERO
	for i in range(spawn_times):
		var lanes = lane_scene.instantiate()
		lanes.position = pos
		add_child(lanes)
		pos.z += 48.0
		

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	generate_lane(20)
