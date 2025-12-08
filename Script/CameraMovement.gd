extends Camera3D
@onready var player = $"../player"
var camera_offset = Vector3(0, 3, 0) 

func _physics_process(delta: float) -> void:
	position = player.position + camera_offset  
