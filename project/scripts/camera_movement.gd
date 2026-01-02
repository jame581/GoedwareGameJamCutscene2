extends Camera2D


@export var rotation_speed: float = 0.1

func _input(event):
	if event is InputEventMouseMotion:
		rotation += deg_to_rad(event.relative.x * rotation_speed)
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT or event.double_click or event.button_index == MOUSE_BUTTON_RIGHT or event.button_index == MOUSE_BUTTON_MIDDLE:
			rotation = 0
