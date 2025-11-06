class_name Player extends CharacterBody3D

#signals
signal update_crosshair(velocity: Vector3)

#onready vars, lowercase
@onready var collision = $CollisionShape3D
@onready var mesh = $CollisionShape3D/MeshInstance3D
@onready var head = $Head
@onready var camera = $Head/Camera3D

#consts, CAPS
const FLOOR_FRIC = 0.4
const AIR_FRIC = 0.05
const GRAVITY = 9.8
const CAMERA_DOWN_LIMIT = deg_to_rad(-89)
const CAMERA_UP_LIMIT = deg_to_rad(89)

#vars, First Uppercase
var Mouse_sens = 0.002
var Speed := 5.0
var Air_speed := 1.0
var Jump_velocity := 4.5
