extends Node3D

var spawnplates: Array = []
@export var stuff_to_spawn: Array[PackedScene] = [
	preload("res://Scenes/coin.tscn"),
	preload("res://Scenes/enemy.tscn")
]
@export var spawn_interval := 2.0  # Seconds between spawns

var spawn_timer := 0.0

func _ready() -> void:
	# Gather all spawn plates
	spawnplates = [$spawnplate, $spawnplate2, $spawnplate3]

func _process(delta: float) -> void:
	spawn_timer += delta
	if spawn_timer >= spawn_interval:
		spawn_timer = 0.0
		spawn_random_enemy()

func spawn_random_enemy() -> void:
	if stuff_to_spawn.is_empty() or spawnplates.is_empty():
		return
	
	# Pick random spawn location
	var random_plate = spawnplates.pick_random()
	
	# Pick random enemy to spawn
	var random_enemy_scene = stuff_to_spawn.pick_random()
	
	# Spawn it
	var enemy = random_enemy_scene.instantiate()
	get_parent().add_child(enemy)  # Add to scene
	enemy.global_position = random_plate.global_position
