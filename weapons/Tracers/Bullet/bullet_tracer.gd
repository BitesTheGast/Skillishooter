class_name BulletTracer extends Node3D

@export var speed := 40.0
var target_pos: Vector3

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	look_at(target_pos)
	position = position.move_toward(target_pos, speed*delta)
	if position == target_pos:
		$".".queue_free()
