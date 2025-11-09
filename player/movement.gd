class_name MovementController extends Controller

func _physics_process(delta: float) -> void:
	
	# Handle jump
	if Input.is_action_pressed("mv_up") and p.is_on_floor():
		p.velocity.y = p.Jump_velocity

	# Handle movement
	var input_dir := Input.get_vector("mv_left", "mv_right", "mv_forward", "mv_back")
	var direction = (p.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		p.velocity.x += direction.x * get_speed()
		p.velocity.z += direction.z * get_speed()

	p.move_and_slide()

func get_speed():
	var mult := 1.0
	if Input.is_action_pressed("st_sprint"):
		mult *= p.Sprint_mult
	if p.is_on_floor():
		return p.Speed * mult
	else:
		return p.Air_speed * mult
