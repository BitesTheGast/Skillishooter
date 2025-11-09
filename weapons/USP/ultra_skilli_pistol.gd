extends Node3D

@onready var tracer_scene = preload("res://weapons/Tracers/Bullet/bullet_tracer.tscn")

var can_shoot := true
var max_ammo := 6
var ammo := max_ammo

func shoot(target):
	if can_shoot and ammo > 0:
		ammo -= 1
		$AnimationPlayer.speed_scale = 2.0
		$AnimationPlayer.play("shoot")
		$Cube_002/Marker3D/CPUParticles3D.emitting = true
		$ShootTimer.start()
		var tracer = tracer_scene.instantiate()
		tracer.target_pos = target
		tracer.position = $Cube_002/Marker3D.global_position
		get_parent().get_parent().get_parent().add_child(tracer)
		can_shoot = false

func reload():
	can_shoot = false
	$AnimationPlayer.speed_scale = 1/$ReloadTimer.wait_time
	$AnimationPlayer.play("reload")
	$ReloadTimer.start()

func play_anim(anim):
	if $AnimationPlayer.current_animation != "shoot" and $AnimationPlayer.current_animation != "reload":
		$AnimationPlayer.speed_scale = 1.0
		$AnimationPlayer.play(anim)


func _on_shoot_timer_timeout() -> void:
	can_shoot = true


func _on_reload_timer_timeout() -> void:
	can_shoot = true
	ammo = max_ammo
