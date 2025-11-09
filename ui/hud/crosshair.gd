extends CenterContainer

@export var Dot_radius := 1.0
@export var Dot_color := Color.WHITE

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	queue_redraw()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation += delta


func _draw() -> void:
	draw_circle(Vector2.ZERO, Dot_radius, Dot_color)
