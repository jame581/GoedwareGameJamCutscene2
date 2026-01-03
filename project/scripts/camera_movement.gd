extends Camera2D


@export var rotation_speed: float = 0.1

func _input(event):
	if Global.is_mouse_check_enabled():
		if event is InputEventMouseMotion:
			rotation += deg_to_rad(event.relative.x * rotation_speed)
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT or event.double_click or event.button_index == MOUSE_BUTTON_RIGHT or event.button_index == MOUSE_BUTTON_MIDDLE:
				rotation = 0
	
	if event is InputEventKey:
		if event.pressed and (event.keycode == KEY_LEFT or event.keycode == KEY_A):
			rotation += deg_to_rad(-15)
		if event.pressed and (event.keycode == KEY_RIGHT or event.keycode == KEY_D):
			rotation += deg_to_rad(15)
		if event.pressed and event.keycode == KEY_R:
			rotation = 0
			
