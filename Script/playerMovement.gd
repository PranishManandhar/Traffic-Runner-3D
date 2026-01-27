extends RigidBody3D

@export var forward_force: float = 30.0
@export var max_speed: float = 15.0
@export var strafe_force: float = 15.0

@onready var raycast = $RayCast3D
signal colliding

func _ready() -> void:
	lock_rotation = true


func _physics_process(delta: float) -> void:
	_apply_forward_force()
	_limit_speed()
	_apply_strafe()
	detect_collision()


func _apply_forward_force() -> void:
	# Local forward direction (+Z)
	var forward_dir: Vector3 = transform.basis * -Vector3.FORWARD
	apply_central_force(forward_dir * forward_force)


func _apply_strafe() -> void:
	# X axis only (left/right)
	var input_dir := Input.get_vector("right", "left", "straight", "back")
	var strafe_dir: Vector3 = transform.basis * Vector3(input_dir.x, 0.0, 0.0)

	apply_central_force(strafe_dir * strafe_force)


func _limit_speed() -> void:
	if linear_velocity.length() > max_speed:
		linear_velocity = linear_velocity.normalized() * max_speed

func detect_collision():
	if raycast.is_colliding():
		var target = raycast.get_collider()
		if target.is_in_group("Platform"):
			emit_signal("colliding")
