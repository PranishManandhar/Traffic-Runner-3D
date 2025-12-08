extends RigidBody3D

# Movement parameters
@export var forward_force := 30.0
@export var max_speed := 15.0
@export var mouse_sensitivity := 0.5
@export var mouse_speed_multiplier := 5

func _ready() -> void:
	lock_rotation = true

func _physics_process(delta: float) -> void:
	# Constant forward movement
	var forward_dir := transform.basis * Vector3(0, 0, 1.0)
	apply_central_force(forward_dir * forward_force)
	
	# Clamp to max speed
	if abs(linear_velocity.length()) > max_speed:
		linear_velocity = sign(linear_velocity) * max_speed

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		# Apply lateral velocity based on mouse movement
		var mouse_dir = -sign(event.relative.x)
		linear_velocity.x = mouse_sensitivity * mouse_dir
