extends Node3D

var lane_scene:PackedScene = preload("res://Scenes/platform.tscn")
var road_array:Array = []
@onready var player = $player
var next_spawn_z: float = 0.0
var platforms_spawned: int = 0

func _ready() -> void:
	generate_lane(20)


func generate_lane(spawn_times:int):
	for i in range(spawn_times):
		var lanes = lane_scene.instantiate()
		lanes.add_to_group("Platform")
		lanes.position = Vector3(0, 0, next_spawn_z)
		add_child(lanes)
		road_array.append(lanes)
		next_spawn_z += 24.7
		platforms_spawned += 1



func _on_player_colliding() -> void:
	var target = player.raycast.get_collider()
	if target == road_array[road_array.size() - 5]:
		generate_lane(5)
		remove_old_platforms()

func remove_old_platforms():
	while road_array.size() > 20:
		var old_platform = road_array.pop_front()
		old_platform.queue_free()
