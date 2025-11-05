class_name PhysicsController extends Controller

func _physics_process(delta: float) -> void:
	# Add the gravity
	if not p.is_on_floor():
		p.velocity.y -= p.GRAVITY * delta
	
	# Add friction
	if p.is_on_floor():
		p.velocity.x = lerpf(p.velocity.x, 0, p.FLOOR_FRIC)
		p.velocity.z = lerpf(p.velocity.z, 0, p.FLOOR_FRIC)
	else:
		p.velocity.x = lerpf(p.velocity.x, 0, p.AIR_FRIC)
		p.velocity.z = lerpf(p.velocity.z, 0, p.AIR_FRIC)
