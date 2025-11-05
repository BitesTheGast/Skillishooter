class_name CameraController extends Controller

func _ready(): Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event: InputEvent) -> void:
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED and event is InputEventMouseMotion:
		p.rotation.y += -event.relative.x * p.Mouse_sens
		p.head.rotation.x = max(min((p.head.rotation.x - event.relative.y * p.Mouse_sens), p.CAMERA_UP_LIMIT), p.CAMERA_DOWN_LIMIT)
