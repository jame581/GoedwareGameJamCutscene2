extends Control

@onready var version_label: Label = %VersionLabel
@onready var start_button: Button = %StartButton
@onready var audio_stream_player: AudioStreamPlayer = get_node("AudioStreamPlayer")
@onready var mouse_check_button: CheckButton = %MouseCheckButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	version_label.text = Global.get_version()

	start_button.pressed.connect(_on_start_button_pressed)
	mouse_check_button.toggled.connect(_on_mouse_check_toggled)


func _on_start_button_pressed() -> void:
	Global.goto_scene("res://maps/storyboard.tscn")

func _on_mouse_check_toggled(button_pressed: bool) -> void:
	Global.set_mouse_check_enabled(button_pressed)
