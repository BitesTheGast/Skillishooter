class_name AnimationController extends Controller

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.get_vector("mv_left", "mv_right", "mv_forward", "mv_back") and p.is_on_floor():
		if Input.is_action_pressed("st_sprint"):
			p.emit_signal("weapon_anim", "sprint")
		else:
			p.emit_signal("weapon_anim", "walk")
	else:
		p.emit_signal("weapon_anim", "idle")
