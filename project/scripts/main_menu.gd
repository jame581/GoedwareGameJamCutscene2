extends Control

@onready var version_label: Label = %VersionLabel
@onready var start_button: Button = %StartButton
@onready var audio_stream_player: AudioStreamPlayer = get_node("AudioStreamPlayer")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	version_label.text = Global.get_version()

	start_button.pressed.connect(_on_start_button_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_start_button_pressed() -> void:
	Global.goto_scene("res://maps/storyboard.tscn")
