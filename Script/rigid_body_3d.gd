extends RigidBody3D

@export var SPEED:=30.0
@export var MAX_SPEED := 15.0

func _ready() -> void:
	lock_rotation = true

func _physics_process(delta: float) -> void:
	var input_dir = Input.get_vector("left","right","straight","back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		apply_central_force(direction * SPEED)
		
	if  linear_velocity.length()>MAX_SPEED:
		linear_velocity = linear_velocity.normalized() * MAX_SPEED
