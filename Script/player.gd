extends CharacterBody3D

@onready var player = $"."

@export var x_player_speed = 0.1
@export var z_player_speed = 3

var mouse_dir = 0.0

func _physics_process(delta: float) -> void:
	velocity.z += z_player_speed * delta
	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		mouse_dir = -sign(event.relative.x)
		player.position.x += (x_player_speed*mouse_dir)
