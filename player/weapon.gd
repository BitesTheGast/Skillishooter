class_name WeaponController extends Controller

@onready var ultra_skilli_pistol = preload("res://weapons/USP/ultra_skilli_pistol.tscn")
var weapon

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	p.hud.ammo_label.set_ammo(weapon.ammo, weapon.max_ammo)
	if Input.is_action_just_pressed("bt_reload"):
		weapon.reload()
	if Input.is_action_just_pressed("ms_left") and !Input.is_action_pressed("st_sprint"):
		weapon.shoot(p.raycast.get_collision_point())
	


func _on_player_add_weapon(weapon_id: Variant) -> void:
	var weapon_pos
	if weapon_id == 0:
		weapon = ultra_skilli_pistol.instantiate()
		weapon_pos = Vector3(0.66, -0.33, -1.0)
	else:
		weapon = ultra_skilli_pistol.instantiate()
		weapon_pos = Vector3(0.66, -0.33, -1.0)
	
	weapon.position = weapon_pos
	p.head.add_child(weapon)


func _on_player_weapon_anim(anim: String) -> void:
	weapon.play_anim(anim)
